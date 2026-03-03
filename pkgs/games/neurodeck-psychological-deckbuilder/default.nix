{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "neurodeck-psychological-deckbuilder";
  version = "0.1.0";
  paths = [
    { file = "neurodeck_psychological_deckbuilder/neurodeck_psychological_deckbuilder_1_5_3_49984.sh"; sha256 = "sha256-4Nsr62HuluZ6f8bQw2uSy3n61Wkf7/dPBue1AhBgyOw="; }
  ];
}
  inputs