{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "infinifactory";
  version = "0.1.0";
  paths = [
    { file = "infinifactory/infinifactory_11_14_2020_43258.sh"; sha256 = "sha256-sAqKFZiO9uTs+ayEq4Mug5lkrIdo0onRE7XaIrieV2M="; }
  ];
}
  inputs