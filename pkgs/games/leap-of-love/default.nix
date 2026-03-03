{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "leap-of-love";
  version = "0.1.0";
  paths = [
    { file = "leap_of_love/leap_of_love_2_5_8_68365.sh"; sha256 = "sha256-/HMAjW6t9w8fPdQ+L3fW25kalTbQo29Mi7OzJjbVXYo="; }
  ];
}
  inputs