{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "caves-of-qud";
  version = "0.1.0";
  paths = [
    { file = "caves_of_qud/caves_of_qud_2_0_210_24_89142.sh"; sha256 = "sha256-pvr+4e4uo/V7/Ebw/z4cAf4ZCCWrn49Zy70BKxUJ0ew="; }
  ];
}
  inputs

