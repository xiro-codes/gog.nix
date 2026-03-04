{ config, lib, pkgs, ... }:
let
  cfg = config.programs.gog;
  gogPkgs = import ../../pkgs {
    inherit pkgs;
    libs = import ../../libs { inherit lib pkgs; serverUrl = cfg.serverUrl; };
  };
  gameNames = builtins.attrNames gogPkgs;
in
{
  options.programs.gog = {
    enable = lib.mkEnableOption "GOG Games collection";
    serverUrl = lib.mkOption {
      type = lib.types.str;
      default = "https://files.onix.home";
      description = "the base URL for the GOG game files server";
    };
    games = lib.genAttrs gameNames (name: {
      enable = lib.mkEnableOption "install the game ${name}";
    });
  };
  config = lib.mkIf cfg.enable {
    environment.systemPackages = lib.flatten (
      lib.mapAttrsToList
        (name: gameCfg:
          if gameCfg.enable then [ gogPkgs.${name} ] else [ ]
        )
        cfg.games
    );
  };
}
