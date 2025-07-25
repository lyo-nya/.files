{ pkgs, ... }:

{
  imports = [
    ./nvim
    ./hypr
    ./kitty
    ./zsh
  ];
  programs = {
    home-manager.enable = true;
  };
  home = {
    stateVersion = "25.05";
    sessionVariables.NIXOS_OZONE_WL = "1";
    packages = with pkgs; [
      eza
      telegram-desktop
      rofi-wayland
      vlc
      # Testing
      firefox
      # Language servers
      nixd
      lua-language-server
      # Formatters
      ruff
      sqlfluff
      prettierd
      stylua
      nixfmt-rfc-style
      taplo
      # Screen recording
      slurp
      wl-screenrec
      wf-recorder
    ];
  };

}
