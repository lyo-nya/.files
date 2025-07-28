{ pkgs, TUIApps, ... }:

let
  addDesktopEntry = pkg: {
    name = pkg.pname;
    value = {
      name = pkg.pname;
      exec = pkg.pname;
      genericName = pkg.meta.description;
      terminal = true;
      type = "Application";
      categories = [ "Utility" ];
    };
  };
  TUIDesktopEntries = builtins.listToAttrs (map addDesktopEntry TUIApps);
  themes = import ../theme "rofi";
in
{
  inherit (themes) catppuccin;
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    font = "JetBrainsMono Nerd Font 32";
    modes = [ "drun" ];
  };
  xdg.desktopEntries = TUIDesktopEntries;
}
