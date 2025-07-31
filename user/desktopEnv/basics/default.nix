{ wm }:
{
  imports = map (p: import p { inherit wm; }) [
    ./cursor.nix
    ./notifications.nix
    ./utils
    ./wallpaper
  ];
}
