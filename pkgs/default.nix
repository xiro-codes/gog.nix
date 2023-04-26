{pkgs, helpers,...}: let
  callPackage = helpers.callPackageWith  ( pkgs // {
    inherit (helpers) mkNativeGame;
    fetchNextcloud = helpers.fetchNextcloud { uname = "guest"; pword = "guest"; url="";};
  });
in {
  absolute-drift = callPackage ./absolute-drift {};
}
