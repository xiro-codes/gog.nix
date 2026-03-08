{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "neverwinter-nights-enhanced-edition";
  version = "0.1.0";
  paths = [
    { file = "neverwinter_nights_enhanced_edition/neverwinter_nights_enhanced_edition_89_8193_37_17_85648.sh"; sha256 = "sha256-ouRgaJYB2Q4tsy/kz3hwkgKiOFQ+/UeqyU8TzA8mHYY="; }
  ];
  # Working Directory For Game Install Is: /nix/store/vjv9mw16ji9n01rxjgyr5ywqmwihi567-neverwinter-nights-enhanced-edition/share/neverwinter-nights-enhanced-edition/data
  # Working Directory For Your Resources Is: /home/tod/.local/share/Neverwinter Nights
  # Could not divine nwn base data directory. Have to give up.
  # Make sure you are starting the game with your working directory setto the appropriate platform directory (i.e. <GAMEDATA>/bin/linux-x86)
  extraBuildInputs = with inputs; [
    glfw
  ];
  needsWriteableDir = true;
  meta.broken = true;
}
  inputs

