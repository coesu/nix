{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
      tmux
      neovim

      zathura
      thunderbird
      nextcloud-client

      chromium
      firefox
      unstable.obsidian

      xfce.thunar
      xfce.thunar-volman
      waybar
      unstable.hypridle
      unstable.hyprlock
      unstable.hyprpaper
      wofi

      gruvbox-plus
  ];
}
