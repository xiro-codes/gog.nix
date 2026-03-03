{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "dead-cells";
  version = "0.1.0";
  paths = [
    { file = "dead_cells/dead_cells_1_26_0_75679.sh"; sha256 = "sha256-YDM7my8fo8gj/qp25OHyiJmSUDDuTZRIcER1VPLJ/6Q="; }
  ];
  meta.broken = true;
}
  inputs

