{ pkgs, ... }: {
  callPackageWith = import ./callPackageWith.nix;
  fetchFile = import ./fetchFile.nix { inherit pkgs; };
  mkNativeGame = import ./mkNativeGame.nix;
  mkWindowsGame = import ./mkWindowGame.nix;
}
