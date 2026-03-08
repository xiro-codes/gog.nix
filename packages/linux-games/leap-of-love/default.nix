{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "leap-of-love";
  version = "0.1.0";
  paths = [
    { file = "leap_of_love/leap_of_love_2_5_8_68365.sh"; sha256 = "sha256-/HMAjW6t9w8fPdQ+L3fW25kalTbQo29Mi7OzJjbVXYo="; }
  ];
  # ./LeapofLove.sh: line 63: /nix/store/d4pmjq6wnhjdfr1z2268gl8y53jfnng1-leap-of-love/share/leap-of-love/data/noarch/game/lib/py3-linux-x86_64/LeapofLove: Permission denied
  meta.broken = true;
}
  inputs

