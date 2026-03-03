{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "broken-sword-directors-cut";
  version = "0.1.0";
  paths = [
    { file = "broken_sword_directors_cut/gog_broken_sword_director_s_cut_2.0.0.2.sh"; sha256 = "sha256-sJbXKoR86hCczTUiSTC7NzQVnMYGxWld1mlRHQMzm8s="; }
  ];
}
  inputs