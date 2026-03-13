# Agent Instructions for gog.nix

Welcome to `gog.nix`! This document provides context, commands, and conventions to help you work effectively in this repository.

## Project Overview

`gog.nix` is a Nix flake for declaratively managing and installing GOG (Good Old Games) libraries on NixOS. It packages both native Linux `.sh` installers and Windows `.exe` installers (via Wine/Proton) and integrates them using NixOS modules.

## Directory Structure

*   `libs/`: Contains Nix helper functions/builders for packaging games (e.g., `mkNativeGame.nix`, `mkWindowGame.nix`).
*   `modules/`: NixOS modules exposed by the flake (`gog`, `gog-sync`, `gog-server`).
*   `packages/linux-games/`: Nix package definitions for Linux native games.
*   `packages/windows-games/`: Nix package definitions for Windows games.
*   `scripts/`: Python scripts for packaging, testing, and reporting.

## Key Commands (via `just`)

The project uses [`just`](https://just.systems) as a command runner. Use the following commands:

*   **Generate Packages**: `just gen-packages <dir>`
    *   Runs `scripts/generate_pkgs.py <dir>` to scan a directory of GOG installers, calculate their `sha256` hashes, and automatically generate or update Nix expressions in the `packages/` directories.
*   **Test a Game**: `just test game <name>`
    *   Runs `scripts/test-games.py <name>` to test a specific game derivation.
*   **Force Test All**: `just force-test`
    *   Runs tests for games, bypassing certain cache/skip checks.
*   **Report Broken**: `just report`
    *   Runs `scripts/report-broken.py` to check for packages marked as broken.

## Development Patterns and Conventions

1.  **Game Package Definitions**: 
    *   Games are defined in individual directories under `packages/linux-games/` or `packages/windows-games/`.
    *   A typical `default.nix` for a game uses `mkNativeGame` (or similar from `libs/`), specifying `pname`, `version`, and a list of `paths` (which includes the `file` name and `sha256` SRI hash of the installer).
2.  **Automated Package Generation**:
    *   **Do not manually write hashes** if you have access to the installers. Rely on the `generate_pkgs.py` script.
    *   The generator script uses `.hash_cache.json` in the project root to cache hashes and avoid recalculating them unnecessarily.
3.  **Dependencies and Fixups**:
    *   `mkNativeGame` uses `steam-run` to run Linux games and handles common native library dependencies.
    *   If a game needs extra libraries, they can be added to `extraBuildInputs`.
4.  **Meta Broken**:
    *   If a game cannot be successfully packaged or run, it should include `meta.broken = true;` in its definition.

## Important Gotchas

*   **Documentation Discrepancy**: The `README.md` states that game expressions are located in `pkgs/games/`. However, the actual directory structure uses `packages/linux-games/` and `packages/windows-games/`. Be mindful of this when referring to docs.
*   **Self-Hosted Installers**: The builds expect to fetch installers from a local or private web server specified in the NixOS module (`programs.gog.serverUrl`). They are not downloaded directly from GOG servers during the `nix build` phase because of authentication requirements.
