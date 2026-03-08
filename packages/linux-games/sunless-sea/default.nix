{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "sunless-sea";
  version = "0.1.0";
  paths = [
    { file = "sunless_sea/sunless_sea_2_2_11_3212_64426.sh"; sha256 = "sha256-eoeSRX0DnPjhvSRTZwWxOSKM7IepMLpc2iwPUGABcNc="; }
  ];
}
  inputs