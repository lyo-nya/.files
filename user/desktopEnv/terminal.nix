{ bindApp }:
{ lib, ... }:

lib.mkMerge [
  {
    programs.ghostty = {
      enable = true;
      clearDefaultKeybinds = true;
      enableFishIntegration = true;
      settings = {
        font-family = "JetBrainsMono Nerd Font Mono";
        font-size = 24;
        window-vsync = true;
        resize-overlay = "never";
        keybind = [
          "ctrl+equal=increase_font_size:2.0"
          "ctrl+-=decrease_font_size:2.0"
        ];
      };
    };
  }
  (bindApp true "T" "ghostty")
]
