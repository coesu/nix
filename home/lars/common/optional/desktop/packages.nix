{ config, pkgs, inputs, ... }:

{
  home.packages =  with pkgs; [
    neovim
    vim
    vifm
    git
    zsh

    # cli stuff
    hello
    stow
    neofetch
    freshfetch
    zoxide
    eza
    thefuck
    zellij
    vifm
    sd
    ncdu
    fzf
    fd
    bat
    btop
    tldr
    zip
    unzip
    killall
    util-linux
    xdragon
    ripgrep
    porsmo
    ttyper
    speedtest-rs
    ncspot
    wiki-tui
    rust-analyzer

    gnumake
    clang
    glibc

    #rust and cli tools
    rustup

    python3

    sshfs

    zathura

    thunderbird
    discord
    nextcloud-client

    zoom-us
    chromium
    firefox
    obsidian
  ];
}
