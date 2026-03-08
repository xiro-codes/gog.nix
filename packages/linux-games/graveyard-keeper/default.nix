{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "graveyard-keeper";
  version = "0.1.0";
  paths = [
    { file = "graveyard_keeper/graveyard_keeper_1_405_55214.sh"; sha256 = "sha256-tBqEr8cm6T8XMJvP68aTUpoI+tVGz3WnPq5yKbvKWe4="; }
  ];
}
  inputs