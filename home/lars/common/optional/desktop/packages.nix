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

      waybar
      unstable.hypridle
      unstable.hyprlock
      wofi
  ];
}
