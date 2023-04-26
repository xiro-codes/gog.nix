{
  builders,
  curl,
  ...
} @ inputs:
builders.mkNixGame {
  # missing lib libcurl-gnutls.so
  pname = "dont-starve";
  path = "Games/dont_starve.sh";
  sha256 = "sha256-gHsbnUxX+PwdzhO+r6HQVULs8RPvX1DRGF8Yic120V4=";
  broken = true;
  inputs = [curl];
}
inputs
