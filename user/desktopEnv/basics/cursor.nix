{ wm }:
{ pkgs, lib, ... }:

let
  inherit (lib.lists) flatten;
  inherit (lib) mkMerge;
  cursorName = ''"Bibata-Modern-Ice"'';
  cursorSize = "40";
  env = wm.setEnv (
    flatten (
      map
        (x: [
          "${x}_NAME,${cursorName}"
          "${x}_SIZE,${cursorSize}"
        ])
        [
          "XCURSOR"
          "HYPRCURSOR"
        ]
    )
  );
  autoStart = wm.addAutoStart "hyprctl setcursor ${cursorName} ${cursorSize}";
in

mkMerge [
  {
    home.packages = [ pkgs.hyprcursor ];
    home.pointerCursor = {
      package = pkgs.bibata-cursors;
      name = cursorName;
      size = builtins.fromJSON cursorSize;
    };
  }
  env
  autoStart
]
