{ bindApp }:
{ pkgs, lib, ... }:

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
  TUIApps = with pkgs; [
    bluetui
    impala
  ];
  TUIDesktopEntries = builtins.listToAttrs (map addDesktopEntry TUIApps);
in
lib.mkMerge [
  {
    home.packages = TUIApps;
    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      font = "JetBrainsMono Nerd Font 26";
      modes = [ "drun" ];
    };
    xdg.desktopEntries = TUIDesktopEntries;
  }
  (bindApp true "SPACE" "rofi -show drun")
]
