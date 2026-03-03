{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "jenny-leclue-detectivu";
  version = "0.1.0";
  paths = [
    { file = "jenny_leclue_detectivu/jenny_leclue_detectivu_2_2_1_47129.sh"; sha256 = "sha256-pXTSb/9VsyuQyPB6BLRCAB9LSRkoqrFk6A6mlueJfFw="; }
  ];
}
  inputs