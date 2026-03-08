{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "children-of-morta";
  version = "0.1.0";
  paths = [
    { file = "children_of_morta/children_of_morta_1_2_63_48061.sh"; sha256 = "sha256-BvtGFCPrfOApypdF6fXASMqA75OBj5tIyd3S5r2lVtg="; }
  ];
}
  inputs