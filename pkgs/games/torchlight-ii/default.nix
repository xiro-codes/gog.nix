{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "torchlight-ii";
  version = "0.1.0";
  paths = [
    { file = "torchlight_ii/gog_torchlight_2_2.0.0.2.sh"; sha256 = "sha256-rlDH9tQj9ZJCy31r8LUliA6UBhpVT8PDdWHbelVoyZg="; }
  ];
}
  inputs