{builders, ...} @ inputs:
builders.mkNixGame {
  # Broken tries write save files to nix store
  pname = "dead-cells";
  path = "Games/dead_cells.sh";
  sha256 = "sha256-zHfQc89Gn2EkxM1umd/gWwDDAVjZMl4oav/vawoXnE0=";
  broken = true;
  fixup = "chmod +x $out/share/dead-cells/data/noarch/game/deadcells";
}
inputs
