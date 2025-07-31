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

  home = {
    stateVersion = "25.05";
    sessionVariables.NIXOS_OZONE_WL = "1";
    packages = with pkgs; [
      # Utilities
      telegram-desktop
      vlc
      # Python
      uv
    ];

  };

}
