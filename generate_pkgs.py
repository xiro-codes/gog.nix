import argparse
import subprocess
import sys
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor

def get_nix_hash(file_path):
    try:
        # Get raw sha256 in base32
        result = subprocess.run(
            ["nix-hash", "--flat", "--base32", "--type", "sha256", str(file_path)],
            capture_output=True, text=True, check=True
        )
        # Convert base32 to SRI format (sha256-...)
        full_hash = subprocess.run(
            ["nix", "hash", "to-sri", "--type", "sha256", result.stdout.strip()],
            capture_output=True, text=True, check=True
        )
        return full_hash.stdout.strip()
    except FileNotFoundError:
        print("Error: 'nix-hash' or 'nix' command not found. Is Nix installed?", file=sys.stderr)
        return "sha256-0000000000000000000000000000000000000000000="
    except subprocess.CalledProcessError as e:
        print(f"Error hashing {file_path}: {e}", file=sys.stderr)
        return "sha256-0000000000000000000000000000000000000000000="

def process_game(game_folder, output_base):
    """Processes a single folder: scans for .sh, hashes them, and returns nix data."""
    # Strict filter: Only .sh files
    sh_files = list(game_folder.glob("*.sh"))

    if not sh_files:
        return None

    # Format pname for Nix (lowercase, hyphens instead of spaces/underscores)
    pname = game_folder.name.lower().replace("_", "-").replace(" ", "-")
    files_data = []

    for sh_file in sh_files:
        print(f"  [HASHING] {pname} -> {sh_file.name}")
        sri_hash = get_nix_hash(sh_file)

        files_data.append({
            "file": f"{game_folder.name}/{sh_file.name}",
            "sha256": sri_hash
        })

    # Construct the Nix path list
    paths_nix = "\n".join([
        f'    {{ file = "{f["file"]}"; sha256 = "{f["sha256"]}"; }}'
        for f in files_data
    ])

    # mkNativeGame template
    nix_content = f"""{{ mkNativeGame, ... }} @ inputs:
mkNativeGame
{{
  pname = "{pname}";
  version = "0.1.0";
  paths = [
{paths_nix}
  ];
}}
  inputs"""

    return (pname, nix_content)

def main():
    parser = argparse.ArgumentParser(
        description="Generate Nix package definitions for Linux games from a directory of installers."
    )
    parser.add_argument(
        "input_dir",
        type=str,
        help="The directory to scan for game subfolders."
    )
    parser.add_argument(
        "-o", "--output",
        type=str,
        default="pkgs/games",
        help="Base directory to write Nix packages (default: pkgs/games)"
    )
    parser.add_argument(
        "-t", "--threads",
        type=int,
        default=None,
        help="Number of threads for parallel hashing (default: CPU count)"
    )

    args = parser.parse_args()
    input_path = Path(args.input_dir)
    output_base = Path(args.output)

    if not input_path.exists() or not input_path.is_dir():
        print(f"Error: Input directory '{args.input_dir}' does not exist.", file=sys.stderr)
        sys.exit(1)

    print(f"Scanning: {input_path.absolute()}")
    game_folders = [f for f in input_path.iterdir() if f.is_dir()]

    results = []

    # Process folders in parallel
    with ThreadPoolExecutor(max_workers=args.threads) as executor:
        futures = [executor.submit(process_game, folder, output_base) for folder in game_folders]
        for future in futures:
            res = future.result()
            if res:
                results.append(res)

    # Final write to disk
    if not results:
        print("No folders with .sh files found.")
        return

    print(f"\nWriting {len(results)} package(s) to {output_base.absolute()}...")
    for pname, content in results:
        target_dir = output_base / pname
        target_dir.mkdir(parents=True, exist_ok=True)

        with open(target_dir / "default.nix", "w") as f:
            f.write(content)
        print(f"  [WRITTEN] {pname}")

if __name__ == "__main__":
    main()
