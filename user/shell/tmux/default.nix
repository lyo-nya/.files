{ ... }:

{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    mouse = true;
    prefix = "C-M-space";
    baseIndex = 1;
    extraConfig = builtins.readFile ./extras.conf;
  };
}
