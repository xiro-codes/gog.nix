{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "orwell";
  version = "0.1.0";
  paths = [
    { file = "orwell/orwell_1_4_9208_80802.sh"; sha256 = "sha256-pkEHg58/YWJ30FWi8gHgCzk6J/Lg+1w5cS16R8kioUg="; }
  ];
}
  inputs