{ ... }:
let
  themes = import ../theme "dunst";
in

{
  inherit (themes) catppuccin;
  services.mako = {
    enable = true;
  };
  services.dunst = {
    enable = true;
    settings.global = {
      font = "JetBrainsMono Nerd Font 20";
      offset = "0x0";
      width = 400;
    };
  };

}
