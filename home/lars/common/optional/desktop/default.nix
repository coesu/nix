{ config, pkgs, inputs, ... }:

let
  gruvboxplus = import ./gruvbox-plus.nix { inherit pkgs; };
in
{

  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./fonts.nix
    ./packages.nix
  ];

  home.file.".config/hypr" = {
    enable = true;
    source = ./hypr;
    recursive = true;
  };
  home.file.".config/waybar" = {
    source = ./waybar;
    recursive = true;
  };
  #  home.file.".config/mako" = {
  #  	source = ./mako;
  # recursive = true;
  #  };

  programs.firefox = {
    enable = true;
  };

  gtk = {
    enable = true;

    cursorTheme.package = pkgs.bibata-cursors;
    cursorTheme.name = "Bibata-Modern-Ice";

    theme.package = pkgs.adw-gtk3;
    theme.name = "adw-gtk3";

    iconTheme.package = pkgs.papirus-icon-theme;
    # iconTheme.package = pkgs.gruvbox-dark-icons-gtk;
    iconTheme.name = "Papirus-Dark";
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
    style.name = "adwaita-dark";

    style.package = pkgs.adwaita-qt;
  };



  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-hard;

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
