{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "beautiful-desolation-game";
  version = "0.1.0";
  paths = [
    { file = "beautiful_desolation_game/beautiful_desolation_1_0_5_5_44769.sh"; sha256 = "sha256-dMXBMXPu+e0rMs8rnmdMyJ8ovwyOCC9d9z5uvxLQrd0="; }
  ];
}
  inputs