{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "democracy-3";
  version = "0.1.0";
  paths = [
    { file = "democracy_3/democracy_3_final_update_23528.sh"; sha256 = "sha256-pEC8YRo0I+C1ZOFHau6NnPFHjYU8IMHvYHSOIwv/EQQ="; }
  ];
}
  inputs