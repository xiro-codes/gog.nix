{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "this-war-of-mine";
  version = "0.1.0";
  paths = [
    { file = "this_war_of_mine/this_war_of_mine_6_0_8_a_34693.sh"; sha256 = "sha256-QbCL8/hl3COLIaZOXqSbif3vIQP8icfgPtrCP2yrg8I="; }
  ];
  # but no audio
  # AL lib: oss.c:169: Could not open /dev/dsp: No such file or directory
  meta.broken = false;
}
  inputs

