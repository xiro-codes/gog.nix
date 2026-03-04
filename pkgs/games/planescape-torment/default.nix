{ mkNativeGame, ... } @ inputs:
mkNativeGame
{
  pname = "planescape-torment";
  version = "0.1.0";
  paths = [
    { file = "planescape_torment/planescape_torment_gog_3_23483.sh"; sha256 = "sha256-mYg6giGwQImSIWv9RjpmSgiZkOc3/lRb0Izxw3xhQDI="; }
  ];
  # /nix/store/bx17z8ln2lgx113my78v764lzd3irqf5-planescape-torment/share/planescape-torment/data/noarch/drunk/src/drunkd.sh: line 61: xrandr: command not found
  meta.broken = true;
}
  inputs

