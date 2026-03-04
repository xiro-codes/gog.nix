{ config, pkgs, lib, ... }:
let
  cfg = config.services.gog-sync;
  cmd = "${pkgs.lgogdownloader}/bin/lgogdownloader";
  inherit (lib) types mkEnableOption mkOption;
in
{
  options.services.gog-sync = {
    enable = mkEnableOption "Enable gog-sync service";
    directory = mkOption {
      type = types.path;
      default = "/mnt/games";
      descripiton = "Directory where games will be downloaded";
    };
    interval = mkOption {
      type = types.str;
      default = "daily";
      description = "Systemd timer interval";
    };
    platforms = mkOption {
      type = types.str;
      default = "l+w";
      description = "Platoforms to download (l=linux, w=windows, m=mac)";
    };
    extraArgs = mkOption {
      type = types.str;
      default = "--repair --download";
      description = "Extra arguments passed to lgogdownloader";
    };
    secretFile = mkOption {
      type = types.path;
      description = ''
        GOG_EMAIL=user@example.com
        GOG_PASSWORD=password
      '';
    };
  };
  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ pkgs.lgogdownloader ];
    systemd.timers.gog-sync = {
      description = "Timer for GOG Library Sync";
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = cfg.interval;
        Persistent = true;
      };
    };
    systemd.services.gog-sync = {
      description = "GOG library sync service";
      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];
      serviceConfig = {
        Type = "oneshot";
        User = "root";
        Environment = cfg.secretFile;
        ExecStartPre = "${pkgs.coreutils}/bin/mkdir -p ${cfg.directory}";
        ExecStart = pkgs.writeShellScript "gog-sync" ''
          ${cmd} \
            --directory ${cfg.directory} \
            --platform ${cfg.platforms} \
            ${cfg.extraArgs}
        '';
      };
    };
  };
}
