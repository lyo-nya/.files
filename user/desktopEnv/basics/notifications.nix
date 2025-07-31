{ wm }:
{ pkgs, lib, ... }:

lib.mkMerge [
  {
    home.packages = [ pkgs.libnotify ];
    services.mako = {
      enable = true;
      settings = {
        font = "JetBrainsMono Nerd Font 20";
      };
    };
  }
  (wm.addAutoStart "mako")
]
