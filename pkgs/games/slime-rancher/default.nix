{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "slime-rancher";
  version = "0.1.0";
  paths = [
    { file = "slime_rancher/slime_rancher_1_4_4_51897.sh"; sha256 = "sha256-3u8VRp8Fz0XZgUtHVhfYiuXtza1S07vOE1M38KBzRKo="; }
  ];
}
  inputs