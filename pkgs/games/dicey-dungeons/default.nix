{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "dicey-dungeons";
  version = "0.1.0";
  paths = [
    { file = "dicey_dungeons/dicey_dungeons_2_1_58192.sh"; sha256 = "sha256-lxHJRRGbQeBTKAig+rA3PFq4blJaH2bTgKdBjjbbtJc="; }
  ];
}
  inputs