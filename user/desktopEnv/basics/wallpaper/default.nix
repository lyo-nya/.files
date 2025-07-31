{ wm }:
{ pkgs, lib, ... }:

let
  wallpaper = builtins.toString ./image.jpg;
in
lib.mkMerge [
  {
    services.hyprpaper = {
      enable = true;
      package = pkgs.hyprpaper;
      settings = {
        preload = [ wallpaper ];
        wallpaper = [ ",${wallpaper}" ];
      };
    };
  }
  (wm.addAutoStart "hyprpaper")
]
