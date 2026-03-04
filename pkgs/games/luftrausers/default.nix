{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "luftrausers";
  version = "0.1.0";
  paths = [
    { file = "luftrausers/gog_luftrausers_2.0.0.3.sh"; sha256 = "sha256-pk7IEnpWewqQQmcPdcJb3ESyBPhVl1pcugp9Wqr23xA="; }
  ];
}
  inputs