{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "virtuaverse";
  version = "0.1.0";
  paths = [
    { file = "virtuaverse/virtuaverse_1_37_57278.sh"; sha256 = "sha256-TKdf6ZGASBXhPdbaEDdNL9T2uDiSKX2X1V31zkCUmyA="; }
  ];
}
  inputs