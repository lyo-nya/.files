{
  pkgs,
  ...
}:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "25.05";
  time.timeZone = "Europe/Belgrade";

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "large";
    networkmanager.enable = true;
  };

  services = {
    xserver.xkb.layout = "us,ru";
    libinput.enable = true;
    getty.autologinUser = "lyonya";
  };

  fonts.packages = [ pkgs.nerd-fonts.jetbrains-mono ];

  programs = {
    zsh.enable = true;
    hyprland = {
      enable = true;
      withUWSM = true;
    };
  };

  environment.systemPackages = [ pkgs.git ];

  users = {
    defaultUserShell = pkgs.zsh;
    users.lyonya = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };

  };

  home-manager.backupFileExtension = "backup";
}
