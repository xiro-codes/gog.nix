{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "tis100";
  version = "0.1.0";
  paths = [
    { file = "tis100/tis_100_11_14_2020_43142.sh"; sha256 = "sha256-PGRqRsnPFiXqublEXTOS7LXBtHBLJwZ750Gb6xKRkAM="; }
  ];
}
  inputs