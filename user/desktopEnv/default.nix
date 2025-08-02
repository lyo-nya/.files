{ pkgs, lib, ... }:
let
  wm = import ./hypr.nix { inherit lib; };
in
{
  imports = [
    (import ./basics { inherit wm; })
    (import ./terminal.nix { bindApp = wm.bindApp; })
    (import ./browser { bindApp = wm.bindApp; })
    (import ./appLauncher.nix { inherit wm; })
    (wm.setup)

  ];

  home.packages = with pkgs; [
    # Clipboard
    wl-clipboard
    # Control brightness
    brightnessctl
  ];
}
