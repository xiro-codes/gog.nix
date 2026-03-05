{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "caves-of-qud";
  version = "0.1.2";
  paths = [
    { file = "caves_of_qud/caves_of_qud_2_0_210_24_89142.sh"; sha256 = "sha256-fkbqTTBJPL4qDLCCjDLTlyjSV0FJ0eHpJ3U+BE3uCqw="; }
  ];
  meta.broken = true;
}
  inputs