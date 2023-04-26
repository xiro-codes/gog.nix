{pkgs, libs,...}: let
  callPackage = libs.callPackageWith  ( pkgs // {
    inherit (libs) mkNativeGame;
    fetchNextcloud = libs.fetchNextcloud { uname = "guest"; pword = "guest"; url="";};
  });
in {
  absolute-drift = callPackage ./absolute-drift {};
}
