{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "stardew-valley";
  version = "0.1.0";
  paths = [
    { file = "stardew_valley/stardew_valley_1_6_15_24357_8705766150_78675.sh"; sha256 = "sha256-mq50ltEZKJ8WF9apw9dJ83zTLNE+NNMgAVq8LBtVcO8="; }
  ];
}
  inputs