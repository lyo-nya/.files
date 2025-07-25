{ ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    extraConfig = builtins.readFile ./hyprland.conf;
  };
  programs.waybar.enable = true;
}
