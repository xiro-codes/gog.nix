{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "megaquarium";
  version = "0.1.2";
  paths = [
    { file = "megaquarium/megaquarium_v5_0_13g_89171.sh"; sha256 = "sha256-XHgw6FCgOTqffhLYppYJjMPNnpGPmvhzp6czv2skBDM="; }
  ];
  meta.broken = true;
}
  inputs