{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "ftl-advanced-edition";
  version = "0.1.0";
  paths = [
    { file = "ftl-advanced-edition/ftl_advanced_edition_1_6_12_2_35269.sh"; sha256 = "sha256-qsi9y79HuCP3eInie+d9Ut/eBBxJd+w3UXaipSBj4Mk="; }
  ];
}
  inputs