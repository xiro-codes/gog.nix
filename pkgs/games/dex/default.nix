{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "dex";
  version = "0.1.0";
  paths = [
    { file = "dex/dex_en_6_0_0_0_build_5553_17130.sh"; sha256 = "sha256-VxpII6LI0vUXjJO/iD/6MwlghjchY2rkhgbHCi34rdc="; }
  ];
  # ./Dex.x86: error while loading shared libraries: libXcursor.so.1: cannot open shared object file: No such file or directory
  meta.broken = true;
}
  inputs

