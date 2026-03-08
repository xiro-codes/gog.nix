{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "planescape-torment-enhanced-edition-game";
  version = "0.1.0";
  paths = [
    { file = "planescape_torment_enhanced_edition_game/planescape_torment_enhanced_edition_3_1_4_26532.sh"; sha256 = "sha256-gS7akQQgASza1tWALrzVGcFtthEHzeuCBIIWUc6gkd4="; }
  ];
  # ./Torment64: error while loading shared libraries: libssl.so.1.0.0: cannot open shared object file: No such file or directory
  meta.broken = true;
}
  inputs

