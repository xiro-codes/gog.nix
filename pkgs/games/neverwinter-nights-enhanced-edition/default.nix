{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "neverwinter-nights-enhanced-edition";
  version = "0.1.0";
  paths = [
    { file = "neverwinter_nights_enhanced_edition/neverwinter_nights_enhanced_edition_89_8193_37_17_85648.sh"; sha256 = "sha256-ouRgaJYB2Q4tsy/kz3hwkgKiOFQ+/UeqyU8TzA8mHYY="; }
  ];
}
  inputs