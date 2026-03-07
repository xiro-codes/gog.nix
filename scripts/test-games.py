import subprocess
import json
import os
import signal
from pathlib import Path

def run_test_suite():
    print("--- Fetching package list and metadata ---")
    try:
        # We use --all-systems and --json to get full metadata including 'broken' status
        show_json = subprocess.check_output(
            ["nix", "flake", "show", "--json"],
            stderr=subprocess.DEVNULL
        )
        data = json.loads(show_json)
        pkgs_dict = data.get("packages", {}).get("x86_64-linux", {})
    except Exception as e:
        print(f"Error fetching flake info: {e}")
        return

    for pkg_name, meta in pkgs_dict.items():
        # --- THE BROKEN CHECK ---
        # Note: Depending on how your flake is structured, 'broken' might be
        # inside a 'meta' field in the JSON.
        if meta.get("meta", {}).get("broken", False):
            print(f"\n--- Skipping: {pkg_name} (Marked as BROKEN) ---")
            continue

        print(f"\n--- Testing: {pkg_name} ---")
        out_link = f"result-{pkg_name}"
        log_file = f"log-{pkg_name}.txt"

        # Build command (allow broken=false is implicit,
        # but you can add --impure if you use environment variables)
        build_proc = subprocess.run(
            ["nix", "build", f".#{pkg_name}", "--out-link", out_link],
            capture_output=True,
            text=True
        )

        if build_proc.returncode != 0:
            print(f"FAILED: Build error for {pkg_name}")
            with open(log_file, "w") as f:
                f.write(build_proc.stderr)
            continue

        # Launching logic
        executable = Path(f"./{out_link}/bin/{pkg_name}")
        if not executable.exists():
            print(f"FAILED: Executable not found at {executable}")
            continue

        print(f"Build success. Launching {pkg_name}...")
        try:
            with open(log_file, "w") as f:
                # Start process group so we can kill the game and any sub-processes
                proc = subprocess.Popen(
                    [str(executable)],
                    stdout=f,
                    stderr=subprocess.STDOUT,
                    preexec_fn=os.setsid
                )

                try:
                    proc.wait(timeout=5)
                    print(f"INFO: {pkg_name} exited early (Code: {proc.returncode})")
                except subprocess.TimeoutExpired:
                    print(f"SUCCESS: {pkg_name} stabilized for 5s. Killing.")
                    os.killpg(os.getpgid(proc.pid), signal.SIGTERM)

        except Exception as e:
            print(f"RUNTIME ERROR: {e}")

if __name__ == "__main__":
    run_test_suite()
