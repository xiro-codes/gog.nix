{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "deep-sky-derelicts";
  version = "0.1.0";
  paths = [
    { file = "deep_sky_derelicts/deep_sky_derelicts_1_5_4_56893.sh"; sha256 = "sha256-wGMELBtocbhbftgcOw1bmSvqVm8FQiVKV7pE1kghYd4="; }
  ];
}
  inputs