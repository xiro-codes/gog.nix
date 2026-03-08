{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "world-of-goo";
  version = "0.1.0";
  paths = [
    { file = "world_of_goo/world_of_goo_1_6_538_87464.sh"; sha256 = "sha256-f4Bmrs/xyA0fImsN78GcGNpIOBAqkiTWVU5Rek+eU6Y="; }
  ];
}
  inputs

