{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    lua-language-server
    stylua

    nodePackages.prettier

    nodePackages.pyright
    ruff
    isort

    nixfmt
  ];
}
