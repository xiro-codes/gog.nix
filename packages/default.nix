{ pkgs
, libs
, ...
}:
let
  callPackage = libs.callPackageWith (pkgs
    // {
    inherit (libs) mkSimpleGame mkNativeGame mkWindowsGame fetchFile;
  });
in
with builtins; mapAttrs (name: value: callPackage (./linux-games + ("/" + name)) { }) (readDir ./linux-games)
