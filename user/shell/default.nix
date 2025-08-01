{ pkgs, ... }:
{
  imports = [ ./tmux ];
  home.packages = [ pkgs.uv ];
  programs = {
    eza = {
      enable = true;
      enableFishIntegration = true;
      git = true;
      icons = "always";
    };
    fish = {
      enable = true;
      shellInit = "set -U fish_greeting";
      generateCompletions = true;
      functions = {
        tc = "tmux new-session -s $(basename $PWD)";
      };
      shellAbbrs = {
        # Git
        ga = "git add";
        gst = "git status";
        gc = "git commit";
        gp = "git push";
        gd = "git diff";
        gl = "git pull";
        # Tmux
        ta = "tmux attach -t";
        tls = "tmux ls";
        td = "tmux kill-session -t";
        # Nix
        nrb = "sudo nixos-rebuild switch --flake ~/.files --show-trace";
        ngc = "sudo nix-collect-garbage -d && sudo nixos-rebuild boot --flake ~/.files --show-trace";
        # Uv
        ur = "uv run";
        uri = "uv run -m IPython";
      };
    };
  };
}
