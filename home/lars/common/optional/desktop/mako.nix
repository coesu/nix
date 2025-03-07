{ pkgs, config, ... }:

{

  services.mako = with config.colorScheme.palette; {
    enable = true;
    backgroundColor = "#${base01}";
    borderColor = "#${base0E}";
    borderRadius = 5;
    borderSize = 2;
    textColor = "#${base04}";
    layer = "overlay";
    defaultTimeout = 5000;
  };

}
