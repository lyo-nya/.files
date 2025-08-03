{ ... }:

{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    mouse = true;
    prefix = "C-space";
    baseIndex = 1;
    extraConfig = builtins.readFile ./extras.conf;
  };
}
