{ bindApp }:
{ lib, ... }:

lib.mkMerge [
  {
    programs.ghostty = {
      enable = true;
      clearDefaultKeybinds = true;
      enableFishIntegration = true;
      settings = {
        font-family = "JetBrainsMono Nerd Font";
        font-size = 24;
        resize-overlay = "never";
        keybind = [
          "ctrl+super+c=text:\\x03"
          "ctrl+super+с=text:\\x03"
          "ctrl+super+d=text:\\x04"
          "ctrl+super+в=text:\\x04"
          "ctrl+c=copy_to_clipboard"
          "ctrl+v=paste_from_clipboard"
          "ctrl+с=copy_to_clipboard"
          "ctrl+super+equal=increase_font_size:2.0"
          "ctrl+super+-=decrease_font_size:2.0"
        ];
      };
    };
    # programs.kitty = {
    #   enable = true;
    #   extraConfig = ''
    #     font_family family="JetBrainsMono Nerd Font"
    #     disable_ligatures cursor
    #     font_size 24.0
    #   '';
    #
    #   keybindings = {
    #     "ctrl+super+c" = "send_text all \\x03";
    #     "ctrl+super+с" = "send_text all \\x03";
    #     "ctrl+super+d" = "send_text all \\x04";
    #     "ctrl+super+в" = "send_text all \\x04";
    #     # "ctrl+super+l" = "send_text all \\x12";
    #     # "ctrl+super+д" = "send_text all \\x12";
    #     "ctrl+c" = "copy_to_clipboard";
    #     "ctrl+v" = "paste_from_clipboard";
    #     "ctrl+super+equal" = "change_font_size all +2.0";
    #     "ctrl+super+minus" = "change_font_size all -2.0";
    #   };
    # };
  }
  # (bindApp true "T" "kitty")
  (bindApp true "T" "ghostty")
]
