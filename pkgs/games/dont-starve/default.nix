{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "dont-starve";
  version = "0.1.0";
  paths = [
    { file = "dont_starve/don_t_starve_554439_66995.sh"; sha256 = "sha256-4wy2t4aKjZpkQP5TfeQS05vg4qws65H9C11hwxBB5ss="; }
  ];
  # ./dontstarve: error while loading shared libraries: libcurl-gnutls.so.4: cannot open shared object file: No such file or directory
  meta.broken = true;
}
  inputs

