{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "shenzhen-io";
  version = "0.1.0";
  paths = [
    { file = "shenzhen_io/shenzhen_i_o_gog_4_26_03_2023_63470.sh"; sha256 = "sha256-GJ9hw+LsJedi7dJyX4AZR9og7oYaugOK1lKNoD2g1OE="; }
  ];
}
  inputs