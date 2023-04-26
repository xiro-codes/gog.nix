{pkgs, libs,...}: let
  callPackage = libs.callPackageWith  ( pkgs // {
    inherit (libs) mkNativeGame;
    fetchNextcloud = libs.fetchNextcloud rec { uname = "xiro49"; pword = "daringly-cramp-catacomb2"; url="https://cloud.tdavis.dev/remote.php/dav/files/${uname}";};
  });
in with builtins; {
  absolute-drift = callPackage ./games/absolute-drift {};
}
