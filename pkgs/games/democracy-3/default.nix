{ mkNativeGame, ... } @ inputs:
mkNativeGame
rec
{
  pname = "democracy-3";
  version = "0.1.0";
  paths = [
    { file = "democracy_3/democracy_3_final_update_23528.sh"; sha256 = "sha256-pEC8YRo0I+C1ZOFHau6NnPFHjYU8IMHvYHSOIwv/EQQ="; }
  ];
  fixup = ''
    # Fix missing libpng12.so.0
    wrapProgram $out/bin/democracy\-3 \
      --prefix LD_LIBRARY_PATH : ${inputs.libpng12}/lib
  '';
}
  inputs

