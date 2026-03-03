{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "cultist-simulator";
  version = "0.1.0";
  paths = [
    { file = "cultist_simulator/cultist_simulator_2025_4_e_6_84275.sh"; sha256 = "sha256-SPpLx0rqQHlxx5ytv6wQNsCBQh0qh3AkjLhWqP2movE="; }
  ];
}
  inputs