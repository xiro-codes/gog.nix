{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "terraria";
  version = "0.1.0";
  paths = [
    { file = "terraria/terraria_v1_4_5_5_88657.sh"; sha256 = "sha256-dLqVnFEmfJ9Wx4q/XU0ywBZzHo+KCHkF0CkqIUDFbU8="; }
  ];
}
  inputs