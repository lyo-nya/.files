{ wm }:
{ pkgs, lib, ... }:

let
  info = builtins.toString ./scripts/info.sh;
  screenrec = builtins.toString ./scripts/screenrec.sh.sh;
in
lib.mkMerge [
  {
    programs.hyprlock.enable = true;
    home.packages = with pkgs; [
      # Screen recording
      slurp
      wl-screenrec
      wf-recorder
      # Hyprland utilities
      hyprshot
    ];
  }
  (wm.bindApp true "I" info)
  (wm.bindApp true "P" "hyprshot -m region --clipboard-only")
  (wm.bindApp false "P" screenrec)
  (wm.bindApp false "L" "hyprlock")
]
