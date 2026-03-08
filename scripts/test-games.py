import subprocess
import json
import os
import signal
import argparse
from pathlib import Path

CACHE_FILE = "test_results.json"

def load_cache():
    if os.path.exists(CACHE_FILE):
        with open(CACHE_FILE, "r") as f:
            return json.load(f)
    return {}

def save_cache(cache):
    with open(CACHE_FILE, "w") as f:
        json.dump(cache, f, indent=4)

def run_test_suite():
    parser = argparse.ArgumentParser(description="GOG.nix Game Test Runner")
    parser.add_argument("-f", "--force", action="store_true", help="Ignore cache and re-test all games")
    parser.add_argument("-t", "--timeout", type=int, default=5, help="Seconds to run each game (default: 5)")
    parser.add_argument("game", nargs="?", help="Test a specific game only")
    args = parser.parse_args()

    cache = load_cache()
    report = []

    print(f"--- Fetching package list (Timeout: {args.timeout}s, Force: {args.force}) ---")
    try:
        show_json = subprocess.check_output(["nix", "flake", "show", "--json"], stderr=subprocess.DEVNULL)
        pkgs_dict = json.loads(show_json).get("packages", {}).get("x86_64-linux", {})
    except Exception as e:
        print(f"Error: {e}")
        return

    # Filter for specific game if provided
    targets = [args.game] if args.game else pkgs_dict.keys()

    for pkg_name in targets:
        meta = pkgs_dict.get(pkg_name)
        if not meta:
            print(f"Game {pkg_name} not found in flake.")
            continue

        if meta.get("meta", {}).get("broken", False):
            report.append({"name": pkg_name, "status": "SKIPPED (BROKEN)"})
            continue

        print(f"\n--- Testing: {pkg_name} ---")
        out_link = f"result-{pkg_name}"

        # 1. Build
        build_proc = subprocess.run(
            ["nix", "build", f".#{pkg_name}", "--out-link", out_link],
            capture_output=True, text=True
        )

        if build_proc.returncode != 0:
            print(f"BUILD FAILED: {pkg_name}")
            report.append({"name": pkg_name, "status": "BUILD_FAILED"})
            continue

        # 2. Cache Check
        current_store_path = os.path.realpath(out_link)
        if not args.force and cache.get(pkg_name) == current_store_path:
            print(f"CACHE HIT: {pkg_name} verified. Skipping.")
            report.append({"name": pkg_name, "status": "SUCCESS (CACHED)"})
            continue

        # 3. Execution Test
        executable = Path(f"./{out_link}/bin/{pkg_name}")
        log_file = f"log-{pkg_name}.txt"
        success = False

        try:
            with open(log_file, "w") as f:
                proc = subprocess.Popen(
                    [str(executable)],
                    stdout=f, stderr=subprocess.STDOUT,
                    preexec_fn=os.setsid
                )
                try:
                    proc.wait(timeout=args.timeout)
                    success = (proc.returncode == 0)
                except subprocess.TimeoutExpired:
                    success = True
                    os.killpg(os.getpgid(proc.pid), signal.SIGTERM)
        except Exception as e:
            print(f"RUNTIME ERROR: {e}")

        if success:
            print(f"VERIFIED: {pkg_name}")
            cache[pkg_name] = current_store_path
            report.append({"name": pkg_name, "status": "SUCCESS"})
        else:
            print(f"EXECUTION FAILED: {pkg_name}")
            report.append({"name": pkg_name, "status": "EXEC_FAILED"})

    save_cache(cache)

    # ... (Keep existing Report printing logic) ...

if __name__ == "__main__":
    run_test_suite()
