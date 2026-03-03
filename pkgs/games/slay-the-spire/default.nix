{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "slay-the-spire";
  version = "0.1.0";
  paths = [
    { file = "slay_the_spire/slay_the_spire_2020_12_15_8735c9fe3cc2280b76aa3ec47c953352a7df1f65_43444.sh"; sha256 = "sha256-9nmIiSzEjf/RzbIUjATOZgyAp8MiZLoTZYRUKXc4OFY="; }
  ];
}
  inputs