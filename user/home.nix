{
  pkgs,
  ...
}:

{
  imports = [
    ./shell
    ./editor
    ./desktopEnv
  ];

  programs = {
    home-manager.enable = true;
  };

  qt = {
    enable = true;
    style.name = "kvantum";
    platformTheme.name = "kvantum";
  };

  gtk = {
    enable = true;
    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
  };

  home = {
    stateVersion = "25.05";
    sessionVariables.NIXOS_OZONE_WL = "1";
    packages = with pkgs; [
      # Utilities
      telegram-desktop
      vlc
    ];

  };

}
