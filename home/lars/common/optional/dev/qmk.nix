{ config, pkgs, inputs, ... }:
{
  home.packages = with pkgs; [ qmk keymapviz ];
}
