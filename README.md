# GOG.nix

[![Nix](https://img.shields.io/badge/Nix-5277C3?logo=nixos&logoColor=white)](https://nixos.org)
[![GOG](https://img.shields.io/badge/GOG-880088?logo=gog-dot-com&logoColor=white)](https://www.gog.com)

**GOG.nix** is a Nix flake for declaratively managing and installing your GOG (Good Old Games) library on NixOS. It simplifies the process of packaging GOG installers (both Linux native and Windows via Wine) and integrating them into your system configuration.

## Features

- 📦 **Declarative Management**: Install games via your NixOS configuration.
- 🐧 **Native Linux Support**: Automatically wraps Linux installers with `steam-run` for compatibility.
- 🍷 **Windows Support**: Experimental support for running Windows games via Wine/Proton.
- 🔄 **Automated Sync**: Includes a systemd service (`gog-sync`) to keep your local installer library up-to-date using `lgogdownloader`.
- 🌐 **Self-Hosted Installers**: Fetches game files from your own local or private web server (e.g., NAS, Nginx).
- 🛠️ **Easy Packaging**: Includes tools to scan your installer library and generate Nix expressions automatically.

## Prerequisites

To use this flake effectively, you need:
1.  **A collection of GOG offline installers**: `.sh` files for Linux, `.exe` for Windows.
2.  **A file server**: The installers must be hosted on a web server accessible to your NixOS machine (e.g., `http://192.168.1.10:8080` or `https://files.my-server.com`).
    *   *Tip: For testing, you can run `python3 -m http.server` in your installer directory.*

## Installation

Add `gog.nix` to your `flake.nix`:

```nix
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    gog-nix.url = "github:yourusername/gog.nix"; # Replace with your repo URL
  };

  outputs = { self, nixpkgs, gog-nix, ... }: {
    nixosConfigurations.my-machine = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        gog-nix.nixosModules.gog
        gog-nix.nixosModules.gog-sync
      ];
    };
  };
}
```

## Usage

### 1. Enabling Games

In your `configuration.nix` (or Home Manager module if adapted), configure the `programs.gog` module:

```nix
{ config, pkgs, ... }:

{
  programs.gog = {
    enable = true;
    
    # URL where your GOG installers are hosted
    serverUrl = "https://files.my-server.com/games/gog"; 
    
    games = {
      stardew-valley.enable = true;
      dead-cells.enable = true;
      hollow-knight.enable = true;
      # ... see packages/linux-games for available titles
    };
  };
}
```

This will verify the hash of the installers, download them from your server during build time, and install them to your system profile.

### 2. Syncing Library (Optional)

You can use the `gog-sync` module to automatically download new installers from GOG to your local storage.

```nix
{ config, ... }:

{
  services.gog-sync = {
    enable = true;
    directory = "/mnt/data/games/gog"; # Where to save installers
    interval = "daily";
    
    # Secret file containing GOG credentials
    # Content format:
    # GOG_EMAIL=user@example.com
    # GOG_PASSWORD=secret
    secretFile = "/run/secrets/gog-credentials"; 
    
    platforms = "l+w"; # Download Linux (l) and Windows (w) installers
  };
}
```

## Adding New Games

When you buy a new game or want to add an existing one to this repo:

1.  **Download the installer**: Ensure you have the offline installer file.
2.  **Generate Package**: Run the generator script pointing to your installer directory.

```bash
# Using 'just' (recommended)
just gen-packages /path/to/my/downloaded/installers

# Or manually
python3 generate_pkgs.py /path/to/my/downloaded/installers
```

This will scan the directory, calculate hashes, and create/update entries in `packages/`.

3.  **Commit**: Commit the new files in `packages/` to the repository.

## Supported Games

This repository currently contains definitions for **over 60 games**, including:
-   Bastion
-   Dead Cells
-   Disco Elysium
-   Hollow Knight
-   Stardew Valley
-   Terraria
-   And many more...

Check the `packages/` directory for the full list.

## Project Structure

-   `libs/`: Helper functions for building games (`mkNativeGame`, `mkWindowsGame`).
-   `modules/`: NixOS modules (`gog`, `gog-sync`).
-   `packages/`: Generated Nix expressions for each game.
-   `generate_pkgs.py`: Script to scan installers and generate package definitions.

## License

MIT

