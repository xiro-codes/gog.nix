#!/usr/bin/env python3
import argparse
import subprocess
import sys
import json
import re
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor

CACHE_FILE = ".hash_cache.json"

def load_cache():
    cache_path = Path(CACHE_FILE)
    if cache_path.exists():
        try:
            with open(cache_path, "r") as f:
                return json.load(f)
        except json.JSONDecodeError:
            return {}
    return {}

def save_cache(cache):
    with open(CACHE_FILE, "w") as f:
        json.dump(cache, f, indent=2)

def get_nix_hash(file_path):
    try:
        result = subprocess.run(
            ["nix-hash", "--flat", "--base32", "--type", "sha256", str(file_path)],
            capture_output=True, text=True, check=True
        )
        full_hash = subprocess.run(
            ["nix", "hash", "to-sri", "--type", "sha256", result.stdout.strip()],
            capture_output=True, text=True, check=True
        )
        return full_hash.stdout.strip()
    except Exception as e:
        print(f"Error hashing {file_path}: {e}", file=sys.stderr)
        return None

def extract_metadata(nix_file_path):
    if not nix_file_path.exists():
        return None, "0.1.0"
    content = nix_file_path.read_text()
    h_match = re.search(r'sha256\s*=\s*"([^"]+)"', content)
    v_match = re.search(r'version\s*=\s*"([^"]+)"', content)
    return (h_match.group(1) if h_match else None,
            v_match.group(1) if v_match else "0.1.0")

def increment_version(version_str):
    parts = version_str.split('.')
    if len(parts) == 3 and parts[-1].isdigit():
        parts[-1] = str(int(parts[-1]) + 1)
        return ".".join(parts)
    return version_str + ".1"

def process_game(game_folder, output_base, cache):
    sh_files = sorted(list(game_folder.glob("*.sh")), key=lambda x: x.stat().st_mtime, reverse=True)
    if not sh_files:
        return None

    newest_sh = sh_files[0]
    pname = game_folder.name.lower().replace("_", "-").replace(" ", "-")
    target_nix = Path(output_base) / pname / "default.nix"

    file_key = str(newest_sh.absolute())
    mtime = newest_sh.stat().st_mtime
    new_hashes = {}

    if file_key in cache and cache[file_key]["mtime"] == mtime:
        new_sri_hash = cache[file_key]["hash"]
    else:
        print(f"  [HASHING] {pname} -> {newest_sh.name}")
        new_sri_hash = get_nix_hash(newest_sh)
        if not new_sri_hash: return None
        new_hashes[file_key] = {"mtime": mtime, "hash": new_sri_hash}

    existing_hash, current_version = extract_metadata(target_nix)

    if existing_hash == new_sri_hash:
        return (pname, None, new_hashes)

    new_version = increment_version(current_version) if target_nix.exists() else "0.1.0"
    broken_meta = "\n  meta.broken = true;" if target_nix.exists() else ""

    nix_content = f"""{{ mkNativeGame, ... }} @ inputs:
mkNativeGame
{{
  pname = "{pname}";
  version = "{new_version}";
  paths = [
    {{ file = "{game_folder.name}/{newest_sh.name}"; sha256 = "{new_sri_hash}"; }}
  ];{broken_meta}
}}
  inputs"""

    return (pname, nix_content, new_hashes)

def main():
    parser = argparse.ArgumentParser(description="Generate Nix packages with versioning, caching, and safety checks.")
    parser.add_argument("input_dir", type=str, help="Directory to scan")
    parser.add_argument("-o", "--output", type=str, default="packages/linux-games", help="Output directory")
    parser.add_argument("-t", "--threads", type=int, default=None, help="Number of threads")
    args = parser.parse_args()

    input_path = Path(args.input_dir)
    output_base = Path(args.output)
    cache = load_cache()

    results = []
    all_new_hashes = {}

    with ThreadPoolExecutor(max_workers=args.threads) as executor:
        folders = [f for f in input_path.iterdir() if f.is_dir()]
        futures = [executor.submit(process_game, f, output_base, cache) for f in folders]
        for future in futures:
            res = future.result()
            if res:
                pname, content, h = res
                results.append((pname, content))
                all_new_hashes.update(h)

    if all_new_hashes:
        cache.update(all_new_hashes)
        save_cache(cache)

    for pname, content in results:
        if content:
            dest = output_base / pname
            dest.mkdir(parents=True, exist_ok=True)
            with open(dest / "default.nix", "w") as f:
                f.write(content)

    # Final Report: List all broken packages
    broken_packages = []
    for pkg_dir in output_base.iterdir():
        nix_file = pkg_dir / "default.nix"
        if nix_file.exists() and "meta.broken = true;" in nix_file.read_text():
            broken_packages.append(pkg_dir.name)

    if broken_packages:
        print("\n--- BROKEN PACKAGES (Require Manual Review) ---")
        for pkg in sorted(broken_packages):
            print(f" - {pkg}")
    else:
        print("\nNo packages are currently marked as broken.")

if __name__ == "__main__":
    main()
