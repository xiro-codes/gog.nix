{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "firewatch";
  version = "0.1.0";
  paths = [
    { file = "firewatch/firewatch_1_12_55089.sh"; sha256 = "sha256-GhD+RLZweCqERqzy1S5yOh1G9JFR/yBs9VTjum4aVeI="; }
  ];
}
  inputs