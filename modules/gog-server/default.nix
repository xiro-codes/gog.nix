{ config, pkgs, lib, ... }:
let
  cfg = config.services.gog-server;
  gogDir = config.services.gog-sync.directory;
  inherit (lib) mkEnableOption mkOption types mkIf;
in
{
  options.services.gog-server = {
    enable = mkEnableOption "Enable simple GOG file server";
    port = mkOption {
      type = types.port;
      default = 8080;
      description = "Port for the file server";
    };
  };
  config = mkIf cfg.enable {
    services.darkhttpd = {
      enable = true;
      rootDir = gogDir;
      port = cfg.port;
    };
    networking.firewall.allowedTCPPorts = [ cfg.port ];
  };
}
