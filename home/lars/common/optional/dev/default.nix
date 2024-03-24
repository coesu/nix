{ config, pkgs, inputs, ... }:
{
  imports = [
    ./rust.nix
    ./python.nix
    ./lsp.nix
    ./qmk.nix
  ];
}

