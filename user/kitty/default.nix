{ ... }:

let
  themes = import ../theme "kitty";
in
{
  inherit (themes) catppuccin;
  programs.kitty = {
    enable = true;
    extraConfig = ''
      font_family family="JetBrainsMono Nerd Font"
      disable_ligatures cursor
      font_size 24.0
    '';

    keybindings = {
      "ctrl+super+c" = "send_text all \\x03";
      "ctrl+super+с" = "send_text all \\x03";
      "ctrl+super+d" = "send_text all \\x04";
      "ctrl+super+в" = "send_text all \\x04";
      "ctrl+c" = "copy_to_clipboard";
      "ctrl+v" = "paste_from_clipboard";
      "ctrl+super+equal" = "change_font_size all +2.0";
      "ctrl+super+minus" = "change_font_size all -2.0";
    };
  };
}
