{ inputs, lib, pkgs, config, outputs, ... }:
{
  imports = [
    #################### Required Configs ####################
    common/core #required

    #################### Host-specific Optional Configs ####################
    common/optional/desktop
    common/optional/browser

  ];
}
