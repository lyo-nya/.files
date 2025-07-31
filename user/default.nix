{
  pkgs,
  user,
  catppuccinTheme,
  ...
}:
{
  imports = [ ./steam.nix ];
  programs = {
    fish.enable = true;
    # Required for uv to work
    nix-ld.enable = true;
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
    users."${user}" = {
      imports = [ ./home.nix ];
      catppuccin = {
        enable = true;
        flavor = catppuccinTheme;
      };
    };
  };
}
