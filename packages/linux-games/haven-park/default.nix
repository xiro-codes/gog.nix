{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "haven-park";
  version = "0.1.0";
  paths = [
    { file = "haven_park/haven_park_1_2_3_61845.sh"; sha256 = "sha256-gfAF0RrAdzz7lWn6ub6c3SFZjDyDhTm2mnA9dnsfasY="; }
  ];
}
  inputs