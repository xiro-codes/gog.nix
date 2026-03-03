{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "planescape-torment-enhanced-edition-game";
  version = "0.1.0";
  paths = [
    { file = "planescape_torment_enhanced_edition_game/planescape_torment_enhanced_edition_3_1_4_26532.sh"; sha256 = "sha256-gS7akQQgASza1tWALrzVGcFtthEHzeuCBIIWUc6gkd4="; }
  ];
}
  inputs