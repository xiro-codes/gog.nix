{ pkgs
, libs
, ...
}:
let
  callPackage = libs.callPackageWith (pkgs
    // {
    inherit (libs) mkNativeGame mkWindowsGame fetchFile;
  });
in
with builtins; mapAttrs (name: value: callPackage (./games + ("/" + name)) { }) (readDir ./games)
