{
  pkgs,
  serverUrl ? "http://192.168.1.127:8000",
  ...
}:
{
  callPackageWith = import ./callPackageWith.nix;
  fetchFile = import ./fetchFile.nix { inherit pkgs serverUrl; };
  mkNativeGame = import ./mkNativeGame.nix;
  mkWindowsGame = import ./mkWindowGame.nix;
  mkSimpleGame = import ./nativeBuilders/mkSimpleGame.nix;
  mk32bitGame = import ./nativeBuilders/mk32bitGame.nix;
}
