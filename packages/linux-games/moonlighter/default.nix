{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "moonlighter";
  version = "0.1.0";
  paths = [
    { file = "moonlighter/moonlighter_1_14_38_48229.sh"; sha256 = "sha256-DKQB6u4GsJ3wEbAUsIIyGfMzrav3UD40FnBO4/9ItyY="; }
  ];
}
  inputs