{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "spacechem";
  version = "0.1.0";
  paths = [
    { file = "spacechem/spacechem_1016_40617.sh"; sha256 = "sha256-C5YLeZDFoT3XluUuT1BqEehn9HaE/DI1zgAUWBl9QJE="; }
  ];
}
  inputs