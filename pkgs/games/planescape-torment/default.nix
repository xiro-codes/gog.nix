{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "planescape-torment";
  version = "0.1.0";
  paths = [
    { file = "planescape_torment/planescape_torment_gog_3_23483.sh"; sha256 = "sha256-mYg6giGwQImSIWv9RjpmSgiZkOc3/lRb0Izxw3xhQDI="; }
  ];
}
  inputs