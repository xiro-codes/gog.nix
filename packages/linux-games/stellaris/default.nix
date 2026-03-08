{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "stellaris";
  version = "0.1.0";
  paths = [
    { file = "stellaris/stellaris_4_2_4_87179.sh"; sha256 = "sha256-rO9853wTElwurZBdi1cdM6kVJxRhJVrqm2Y/YVZDXKg="; }
  ];
  # no output fails to start 
  meta.broken = true;
}
  inputs

