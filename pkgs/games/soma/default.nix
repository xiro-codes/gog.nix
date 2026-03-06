{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "soma";
  version = "0.1.2";
  paths = [
    { file = "soma/soma_1_61_50361.sh"; sha256 = "sha256-kRjd+UlmeI7C5RwrNNwCnpkj8Cgx+zedYsWcZtZnmYI="; }
  ];
  meta.broken = true;
}
  inputs