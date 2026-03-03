{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "megaquarium";
  version = "0.1.0";
  paths = [
    { file = "megaquarium/megaquarium_v5_0_9g_89007.sh"; sha256 = "sha256-mE93Sc/yiq1usdcUGEjryG5Y2lrkrCA7SV+H1jfnzts="; }
    { file = "megaquarium/megaquarium_v5_0_11g_89053.sh"; sha256 = "sha256-iEYoMlZELKXM5krQQbympEPZdKyKmMRbV+9Sjk3pCWA="; }
    { file = "megaquarium/megaquarium_v4_2_8g_88412.sh"; sha256 = "sha256-Zwe5DA2S/NHejc48V81k/IYJ61ztqFn/Viq7d+BODxQ="; }
  ];
}
  inputs