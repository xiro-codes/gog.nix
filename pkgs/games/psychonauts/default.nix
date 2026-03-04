{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "psychonauts";
  version = "0.1.0";
  paths = [
    { file = "psychonauts/gog_psychonauts_2.0.0.4.sh"; sha256 = "sha256-zWzE/CC4uSoVieYLom0sohvzN2txt/Grk/ksihVP5do="; }
  ];
  # Psychonauts: /home/icculus/projects/psychonauts/Source/CommonLibs/NonDF/AudioDrv/AudioDrv.cpp:48: CAudioDrv::CAudioDrv(void*, long int, long int): Assertion `GetCount() == 1' failed.
  meta.broken = true;
}
  inputs

