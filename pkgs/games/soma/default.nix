{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "soma";
  version = "0.1.1";
  paths = [
    { file = "soma/soma_1_61_50361.sh"; sha256 = "sha256-6YZ825J4psjjWKJrupmKcIGkpVtV6VOqxSvTWy2zvhQ="; }
  ];
}
  inputs

