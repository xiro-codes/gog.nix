{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "tyranny-game";
  version = "0.1.0";
  paths = [
    { file = "tyranny_game/tyranny_v1_2_1_160_v2_25169.sh"; sha256 = "sha256-yuqEt8DSEcnZVLpkH+gYpv1Fn+gu69FTKFVOCPSCWYM="; }
  ];
}
  inputs