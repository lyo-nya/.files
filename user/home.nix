{
  pkgs,
  catppuccin,
  zen-browser,
}:

let
  themes = import ./theme "kvantum";
  TUIApps = with pkgs; [
    bluetui
    impala
  ];
  otherApps = with pkgs; [
    # Utilities
    telegram-desktop
    vlc
    ripgrep
    # Language servers and formatters
    nixd
    lua-language-server
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
    # Clipboard
    wl-clipboard
    # Hyprland utilities
    hyprshot
    hyprpaper
    hyprcursor
    # Control brightness
    brightnessctl
  ];

in
{
  inherit (themes) catppuccin;
  imports = [
    # Home modules
    catppuccin.homeModules.catppuccin
    zen-browser.homeModules.twilight
    # Text editor
    ./nvim
    ./mako
    ./hypr
    ./kitty
    ./fish
    ./zen
    (import ./rofi { inherit pkgs TUIApps; })
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
    packages = TUIApps ++ otherApps;
    pointerCursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 40;
    };
  };

}
