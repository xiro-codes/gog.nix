{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "hacknet";
  version = "0.1.0";
  paths = [
    { file = "hacknet/hacknet_en_5_069_15083.sh"; sha256 = "sha256-uQaqgPj/UmzWOIpUqN6Ez3Ndn2V2DjiZbhurHMSzM70="; }
  ];
}
  inputs