{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "dex";
  version = "0.1.0";
  paths = [
    { file = "dex/dex_en_6_0_0_0_build_5553_17130.sh"; sha256 = "sha256-VxpII6LI0vUXjJO/iD/6MwlghjchY2rkhgbHCi34rdc="; }
  ];
  fixup = ''
    # Fix missing libXcursor.so.1
    wrapProgram $out/bin/dex \
      --prefix LD_LIBRARY_PATH : ${inputs.xorg.libXcursor}/lib
  '';
}
  inputs

