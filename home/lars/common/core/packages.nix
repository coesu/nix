{ pkgs, config, ... }:

{
  home.packages = with pkgs; [

    vim
    neovim
    tmux
    ttyper

    borgbackup # backups
    btop # resource monitor
    coreutils # basic gnu utils
    curl # curl
    eza # ls replacement
    fd # tree style ls
    findutils # find
    fzf # fuzzy search
    jq # JSON pretty printer and manipulator
    nix-tree # nix package tree viewer
    ncdu # TUI disk usage
    pciutils
    pfetch # system info
    pre-commit # git hooks
    p7zip # compression & encryption
    ripgrep # better grep
    usbutils
    tree # cli dir tree viewer
    unrar # rar extraction
    wget # downloader
    killall
    unzip # zip extraction
    zip # zip compression
    gcc
  ];
}

