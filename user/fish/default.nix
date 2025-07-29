{ ... }:
let
  theme = import ../theme "fish";
in
{
  inherit (theme) catppuccin;
  programs.fish = {
    enable = true;
    shellInit = "set -U fish_greeting";
    shellAliases = {
      ga = "git add";
      gst = "git status";
      gc = "git commit";
      gp = "git push";
      gd = "git diff";
      nrb = "sudo nixos-rebuild switch --flake ~/.files --show-trace";
      ngc = "sudo nix-collect-garbage -d && sudo nixos-rebuild boot --flake ~/.files --show-trace";
    };
  };
}
