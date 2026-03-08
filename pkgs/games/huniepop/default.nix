{ mkSimpleGame, ... } @ inputs:
mkSimpleGame
{
  pname = "huniepop";
  version = "0.1.0";
  paths = [
    { file = "huniepop/gog_huniepop_2.0.0.3.sh"; sha256 = "sha256-fnr0qEbiqePviQrL+RRFpWy66+UgU3I4h3D/3t6QyZ4="; }
  ];
  meta.broken = true;
}
  inputs

