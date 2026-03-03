{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "psychonauts";
  version = "0.1.0";
  paths = [
    { file = "psychonauts/gog_psychonauts_2.0.0.4.sh"; sha256 = "sha256-zWzE/CC4uSoVieYLom0sohvzN2txt/Grk/ksihVP5do="; }
  ];
}
  inputs