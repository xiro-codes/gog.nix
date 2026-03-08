{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "pillars-of-eternity";
  version = "0.1.0";
  paths = [
    { file = "pillars_of_eternity/pillars_of_eternity_3_8_0_88149_85633.sh"; sha256 = "sha256-wEHKw5cBtTNGjm60bYSforFf2rqmSbQT+Sx4yN3uFX4="; }
  ];
}
  inputs