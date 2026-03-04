{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "huniepop";
  version = "0.1.0";
  paths = [
    { file = "huniepop/gog_huniepop_2.0.0.3.sh"; sha256 = "sha256-fnr0qEbiqePviQrL+RRFpWy66+UgU3I4h3D/3t6QyZ4="; }
  ];
  fixup = ''
    # Fix missing libGLU.so.1
    wrapProgram $out/bin/huniepop \
      --prefix LD_LIBRARY_PATH : ${inputs.libGLU}/lib
  '';
}
  inputs

