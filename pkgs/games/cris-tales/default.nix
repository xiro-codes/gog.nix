{ mkWindowsGame, ... } @inputs:
mkWindowsGame
{
  pname = "cris-tales";
  version = "0.1.0";
  paths = [
    { file = "cris_tales/setup_cris_tales_1.0.7_(52228).exe"; sha256 = ""; }
    { file = "cris_tales/setup_cris_tales_1.0.7_(52228)-1.bin"; sha256 = ""; }
  ];
}
  inputs
