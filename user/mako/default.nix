{ ... }:
let
  themes = import ../theme "mako";
in

{
  inherit (themes) catppuccin;
  services.mako = {
    enable = true;
    settings = {
      font = "JetBrainsMono Nerd Font 20";
      default-timeout = 10000;
    };
  };

}
