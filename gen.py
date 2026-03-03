import os
import subprocess
from pathlib import Path

def get_nix_hash(file_path):
    """Generates a Nix-compatible sha256 hash using nix-hash."""
    try:
        result = subprocess.run(
            ["nix-hash", "--flat", "--base32", "--type", "sha256", file_path],
            capture_output=True, text=True, check=True
        )
        # Convert to the SRI format used in your nix files
        full_hash = subprocess.run(
            ["nix", "hash", "to-sri", "--type", "sha256", result.stdout.strip()],
            capture_output=True, text=True, check=True
        )
        return full_hash.stdout.strip()
    except FileNotFoundError:
        return "sha256-0000000000000000000000000000000000000000000="

def generate_linux_packages(input_dir, output_base="pkgs/games"):
    """
    Scans a directory for game folders containing .sh files and generates
    mkNativeGame nix expressions.
    """
    input_path = Path(input_dir)

    for game_folder in input_path.iterdir():
        if not game_folder.is_dir():
            continue

        # Filter: Only include games with a .sh script in the folder
        sh_files = list(game_folder.glob("*.sh"))
        if not sh_files:
            continue

        pname = game_folder.name.lower().replace("_", "-").replace(" ", "-")
        version = "0.1.0"

        # Prepare file entries for the 'paths' attribute
        files_data = []
        for file in game_folder.iterdir():
            if file.is_file() and not file.name.startswith('.'):
                # Construct path relative to the download server structure
                remote_path = f"{game_folder.name}/{file.name}"
                files_data.append({
                    "file": remote_path,
                    "sha256": get_nix_hash(str(file))
                })

        # Create the repository directory structure
        repo_game_dir = Path(output_base) / pname
        repo_game_dir.mkdir(parents=True, exist_ok=True)

        # Generate paths list in Nix syntax
        paths_nix = "\n".join([
            f'    {{ file = "{f["file"]}"; sha256 = "{f["sha256"]}"; }}'
            for f in files_data
        ])

        # Apply the mkNativeGame template
        nix_content = f"""{{ mkNativeGame, ... }} @ inputs:
mkNativeGame
{{
  pname = "{pname}";
  version = "{version}";
  paths = [
{paths_nix}
  ];
}}
  inputs"""

        with open(repo_game_dir / "default.nix", "w") as f:
            f.write(nix_content)

        print(f"Generated Linux package: {pname}")

if __name__ == "__main__":
    # Specify the directory containing your game folders
    DOWNLOAD_DIR = "./my_gog_downloads"
    generate_linux_packages(DOWNLOAD_DIR)
