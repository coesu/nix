{
  programs.zoxide = {
    enable = true;
    # enableBashIntegration = true;
    # enableZshIntegration = true;
    enableFishIntegration = true;
    options = [
      "--cmd j" #replace cd with z and zi (via cdi)
    ];
  };
}
