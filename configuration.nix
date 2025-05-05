{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      <home-manager/nixos>
      ./lyonya.nix
    ];
    
  system.stateVersion = "24.11";

  time.timeZone = "Europe/Belgrade";
  
  boot.loader = {
	systemd-boot.enable = true;
	efi.canTouchEfiVariables = true;
  };
 
  networking = {
  	hostName = "large"; # Define your hostname.
  	networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  };


  services = {
  	xserver.xkb.layout = "us,ru";
	  libinput.enable = true;
	  getty.autologinUser = "lyonya";
  };
  fonts.packages = [ pkgs.nerdfonts ];

  programs = {
  	zsh.enable = true;
	hyprland = {enable=true; withUWSM = true;};
  };
  
  environment.systemPackages =  [ pkgs.git ];
  
  users = {
	defaultUserShell = pkgs.zsh;
	users.lyonya = {
	     isNormalUser = true;
	     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
	};
  	
  };

  home-manager.backupFileExtension = "backup";
}

