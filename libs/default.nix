{pkgs, ...}: {
  callPackageWith = import ./callPackageWith.nix;
  fetchNextcloud = import ./fetchNextcloud.nix { inherit pkgs; };
  mkNativeGame = import ./mkNativeGame.nix;
}
