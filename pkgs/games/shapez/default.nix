{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "shapez";
  version = "0.1.0";
  paths = [
    { file = "shapez/shapez_1_0_57419.sh"; sha256 = "sha256-bovvban2KJqs78i9zGdNKSxklQU8D7bwK2TPy9VTK9o="; }
  ];
}
  inputs