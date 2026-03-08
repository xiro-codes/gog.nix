{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "outlast";
  version = "0.1.0";
  paths = [
    { file = "outlast/gog_outlast_2.0.0.2.sh"; sha256 = "sha256-2PsVqc7XUVJSUnSq7FxlIsgKj26t8iHoVGE9GTwXBbY="; }
  ];
}
  inputs