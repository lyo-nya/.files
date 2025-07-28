{
  pkgs,
  catppuccin,
  user,
  zen-browser,
}:
{
  imports = [ ./steam ];
  programs = {
    fish.enable = true;
  };
  users = {
    defaultUserShell = pkgs.zsh;
    users."${user}" = {
      shell = pkgs.fish;
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
  };
  home-manager = {
    backupFileExtension = "backup";
    useGlobalPkgs = true;
    useUserPackages = true;
    users."${user}" = import ./home.nix { inherit pkgs catppuccin zen-browser; };
  };
}
