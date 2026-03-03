{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "treasure-of-nadia";
  version = "0.1.0";
  paths = [
    { file = "treasure_of_nadia/treasure_of_nadia_1_0117_64117.sh"; sha256 = "sha256-MDz++cg82L+S+de0ID2Lr5v56wAEf64ulO7qu4xUWys="; }
  ];
}
  inputs