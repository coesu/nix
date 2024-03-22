{ config, pkgs, inputs, ... }:
{

  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./packages.nix
    ./gtk.nix
    ./mako.nix
  ];

  home.file.".config/hypr" = {
    enable = true;
    source = ./hypr;
    recursive = true;
  };
  home.file.".config/wofi" = {
    source = ./wofi;
    recursive = true;
  };
  home.file.".config/kitty" = {
    source = ./kitty;
    recursive = true;
  };
  home.file.".config/waybar" = {
    source = ./waybar;
    recursive = true;
  };
  home.file."." = {
    source = ./tmux;
    recursive = true;
  };

  #  systemd.user = {
  # services.nextcloud-autosync = {
  #   Unit = {
  # 	Description = "Auto sync Nextcloud";
  # 	After = "network-online.target";
  #   };
  #   Service = {
  # 	Type = "simple";
  # 	ExecStart= "${pkgs.nextcloud-client}/bin/nextcloudcmd -h -n --path / /home/lars/Nextcloud https://nextcloud.larshumpert.com";
  # 	TimeoutStopSec = "180";
  # 	KillMode = "process";
  # 	KillSignal = "SIGINT";
  #   };
  #   Install.WantedBy = ["multi-user.target"];
  # };
  # timers.nextcloud-autosync = {
  #   Unit.Description = "Automatic sync files with Nextcloud when booted up after 5 minutes then rerun every 60 minutes";
  #   Timer.OnBootSec = "5min";
  #   Timer.OnUnitActiveSec = "30min";
  #   Install.WantedBy = ["multi-user.target" "timers.target"];
  # };
  # startServices = true;
  #  };
}
