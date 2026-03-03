{ mkWindowsGame, ... } @inputs:
mkWindowsGame
{
  pname = "cris-tales";
  version = "0.1.0";
  gameName = "Cristales.exe";
  paths = [
    { file = "cris_tales/setup_cris_tales_1.0.7_(52228).exe"; sha256 = "sha256-26qyENuwBE+UeeJ+1rBpMPQQtowbMyIQ0AzG3kLR8o8="; }
    { file = "cris_tales/setup_cris_tales_1.0.7_(52228)-1.bin"; sha256 = "sha256-iJA1ktnp+tiYGEeLqOUZrAsUan3wRZgVyvRGojnLJNM="; }
  ];
}
  inputs
