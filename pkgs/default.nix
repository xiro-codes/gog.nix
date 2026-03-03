{ pkgs
, libs
, ...
}:
let
  callPackage = libs.callPackageWith (pkgs
    // {
    inherit (libs) mkNativeGame fetchFile;
  });
in
with builtins; mapAttrs (name: value: callPackage (./games + ("/" + name)) { }) (readDir ./games)
