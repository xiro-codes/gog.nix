{ pkgs
, libs
, ...
}:
let
  callPackage = libs.callPackageWith (pkgs
    // {
    inherit (libs) mkSimpleGame mk32bitGame mkNativeGame mkWindowsGame fetchFile;
  });
in
with builtins;
(mapAttrs (name: value: callPackage (./linux-games + ("/" + name)) { }) (readDir ./linux-games))
  //
(mapAttrs (name: value: callPackage (./windows-games + ("/" + name)) { }) (readDir ./windows-games))
