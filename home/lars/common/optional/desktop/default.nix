{ config, pkgs, inputs, ... }:
let
    gruvboxPlus = import ./gruvbox-plus.nix {inherit pkgs;};
    # gruvboxPlus = pkgs.gruvbox-plus;
    cssContent = import ./gtk-css.nix {inherit config;};
in
{

  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./packages.nix
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

  home.file.".local/share/icons/Gruvbox-Plus-Dark/".source = "${gruvboxPlus}";

  programs.firefox = {
    enable = true;
  };

  gtk = {
    enable = true;

    cursorTheme.package = pkgs.bibata-cursors;
    cursorTheme.name = "Bibata-Modern-Ice";

    theme.package = pkgs.adw-gtk3;
    theme.name = "adw-gtk3";

    # iconTheme.package = pkgs.papirus-icon-theme;
    # iconTheme.name = "Papirus-Dark";
    iconTheme.package = gruvboxPlus;
    iconTheme.name = "Gruvbox-Plus-Dark";
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
    style.name = "adwaita-dark";

    style.package = pkgs.adwaita-qt;
  };

  xdg.configFile."gtk-4.0/gtk.css" = {
      text = cssContent;
  };
  xdg.configFile."gtk-3.0/gtk.css" = {
      text = cssContent;
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
