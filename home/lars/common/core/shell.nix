{ config, pkgs, inputs, ... }:
let
  aliases = {
    ls = "exa";
    l = "exa -l";
    la = "exa -la";
    f = "z";
    j = "zi";

    cp = "cp -iv";
    mv = "mv -iv";
    rm = "rm -iv";

    vim = "nvim";
    vi = "nvim";

    za = "zathura";

    drag = "xdragon -a -x";

    update = "sudo nixos-rebuild switch";
  };
in
{
  programs.zsh = {
    enable = true;
    autocd = true;
    dotDir = ".config/zsh";
    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.7.0";
          hash = "sha256-KLUYpUu4DHRumQZ3w59m9aTW6TBKMCXl2UcKi4uMd7w";
        };
      }
      {
        name = "supercharge";
        src = pkgs.fetchFromGitHub {
          owner = "zap-zsh";
          repo = "supercharge";
          rev = "e76f4e8";
          hash = "sha256-6ygs7XcKaqxDhfXdEgEbVVSnlEMcACXjRX4JrLzPUJY";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "932e29a";
          hash = "sha256-gOG0NLlaJfotJfs+SUhGgLTNOnGLjoqnUp54V9aFJg8";
        };
      }
    ];
    shellAliases = aliases;
  };

  home.packages = with pkgs; [ fishPlugins.fzf-fish ];

  programs.fish = {
    enable = true;
    shellAliases = aliases;
    interactiveShellInit = ''
      set fish_greeting
      bind \cf 'bash /home/lars/.local/scripts/tmux-sessionizer'
    '';
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = false;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    settings = {
      add_newline = false;
    };
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true; # see note on other shells below
    nix-direnv.enable = true;
  };

  # programs.nushell = {
  #   enable = true;
  #   extraConfig = ''
  #     use /home/lars/.config/nushell.bak/nu_scripts/custom-completions/git/git-completions.nu *
  #     use /home/lars/.config/nushell.bak/nu_scripts/custom-completions/glow/glow-completions.nu *
  #     use /home/lars/.config/nushell.bak/nu_scripts/custom-completions/make/make-completions.nu *
  #     use /home/lars/.config/nushell.bak/nu_scripts/custom-completions/nix/nix-completions.nu *
  #     use /home/lars/.config/nushell.bak/nu_scripts/custom-completions/man/man-completions.nu *
  #     use /home/lars/.config/nushell.bak/nu_scripts/custom-completions/cargo/cargo-completions.nu *
  #     use /home/lars/.config/nushell.bak/nu_scripts/custom-completions/zellij/zellij-completions.nu *
  #
  #     $env.config = {
  #     	show_banner: false,
  #     	edit_mode: vi_insert,
  #     	keybindings: [
  #     	{
  #     	name: change_dir_with_fzf
  #     	modifier: ALT
  #     	keycode: Char_c
  #     	mode: vi_insert
  #     	event:[
  #     	  # { edit: Clear }
  #     	  { edit: InsertString,
  #     		value: "cd (fd -t d | fzf)"
  #
  #     	  }
  #     	  { send: Enter }
  #     	  ]
  #     	},
  #     	{
  #     	name: select_file_with_fzf
  #     	modifier: CONTROL
  #     	keycode: Char_t
  #     	mode: vi_insert
  #     	event:[
  #     	  # { edit: Clear }
  #     	  { edit: InsertString,
  #     		value: "(fd -t f | fzf)"
  #
  #     	  }
  #     	  { send: Enter }
  #     	  ]
  #     	}
  #     	]
  #     }
  #   '';
  #   shellAliases = {
  #     ll = "ls -la";
  #     la = "ls -a";
  #
  #     cp = "cp -iv";
  #     mv = "mv -iv";
  #     rm = "rm -iv";
  #
  #     vim = "nvim";
  #     vi = "nvim";
  #
  #     za = "zathura";
  #
  #     ze = "zellij";
  #
  #     hell = "echo Hello party people";
  #
  #     drag = "xdragon -a -x";
  #
  #     update = "sudo nixos-rebuild switch --flake /home/lars/nixos-config/";
  #
  #
  #   };
  # };
}
