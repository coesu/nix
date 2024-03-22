{ config, lib, pkgs, outputs, ... }:
{
  imports = [

    # Packages with custom configs go here

    ./bash.nix # backup shell
    ./bat.nix # cat with better syntax highlighting and extras like batgrep.
    ./fonts.nix # core fonts
    ./git.nix # personal git config
    ./kitty.nix # terminal
    # ./ssh.nix # personal ssh configs
    ./zoxide.nix # cd replacement
    ./shell.nix # primary shell: includes zsh, oh-my-zsh, and p10k theme

    # TODO: Not set, need to investigate but will need custom config if used:
    # ./shellcolor.nix

  ] ++ (builtins.attrValues outputs.homeManagerModules);

  home = {
    username = "lars";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = lib.mkDefault "23.05";
    sessionPath = [
      "$HOME/.local/bin"
      "$HOME/scripts/talon_scripts"
    ];
    sessionVariables = {
      SHELL = "zsh";
      TERM = "kitty";
      TERMINAL = "kitty";
      EDITOR = "nvim";
      MANPAGER = "batman"; # see ./cli/bat.nix
    };
  };

  home.packages = builtins.attrValues {
    inherit (pkgs)

      # Packages that don't have custom configs go here

      # TODO: spaces before comment are removed by nixpkgs-fmt
      # See: https://github.com/nix-community/nixpkgs-fmt/issues/305
      borgbackup# backups
      btop# resource monitor
      coreutils# basic gnu utils
      # curl
      eza# ls replacement
      fd# tree style ls
      findutils# find
      fzf# fuzzy search
      jq# JSON pretty printer and manipulator
      nix-tree# nix package tree viewer
      ncdu# TUI disk usage
      pciutils
      pfetch# system info
      pre-commit# git hooks
      p7zip# compression & encryption
      ripgrep# better grep
      usbutils
      tree# cli dir tree viewer
      unzip# zip extraction
      unrar# rar extraction
      wget# downloader
      killall
      zip; # zip compression
  };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
      warn-dirty = false;
    };
  };

  programs = {
    home-manager.enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
