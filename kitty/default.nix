{ ... }:

{
  programs.kitty = {
    enable = true;
    extraConfig = ''
      font_family family="JetBrainsMono Nerd Font"
      disable_ligatures cursor
      font_size 24.0
    '';
    keybindings = {
      "alt+c" = "copy_to_clipboard";
      "alt+v" = "paste_from_clipboard";
      "alt+equal" = "change_font_size all +2.0";
      "alt+minus" = "change_font_size all -2.0";
    };
    themeFile = "Catppuccin-Mocha";
  };
}
