{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "dont-starve";
  version = "0.1.0";
  paths = [
    { file = "dont_starve/don_t_starve_554439_66995.sh"; sha256 = "sha256-4wy2t4aKjZpkQP5TfeQS05vg4qws65H9C11hwxBB5ss="; }
  ];
  fixup = ''
    # Fix missing libcurl-gnutls.so.4
    # Provide a symlink with the expected name since nixpkgs curl ships libcurl.so
    mkdir -p $out/lib
    ln -s ${inputs.curl}/lib/libcurl.so $out/lib/libcurl-gnutls.so.4
    wrapProgram $out/bin/dont-starve \
      --prefix LD_LIBRARY_PATH : $out/lib
  '';
}
  inputs

