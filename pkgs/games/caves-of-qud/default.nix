{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "caves-of-qud";
  version = "0.1.0";
  paths = [
    { file = "caves_of_qud/caves_of_qud_2_0_210_23_84192.sh"; sha256 = "sha256-29c4jW2MWZzHB+xVzq1NHak2kC4Bv3ZbpAtDyXFPJYA="; }
  ];
}
  inputs