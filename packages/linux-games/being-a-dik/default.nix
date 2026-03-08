{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "being-a-dik";
  version = "0.1.0";
  paths = [
    { file = "being_a_dik/being_a_dik_season_1_0_4_8_14_58137.sh"; sha256 = "sha256-o7FjDSea448OVYNm1A+FobgY49jw756vv6mjfrTMbzk="; }
  ];
}
  inputs