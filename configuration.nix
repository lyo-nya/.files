{
  pkgs,
  hostname,
  catppuccinTheme,
  ...
}:

{
  imports = [ ./user ];

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.05";
  time.timeZone = "Europe/Belgrade";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  environment.systemPackages = [ pkgs.git ];

  programs = {
    zsh.enable = true;
    hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };
    gnupg.agent = {
      enable = true;
      pinentryPackage = with pkgs; pinentry-tty;
      enableSSHSupport = true;
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
    ];
    config = {
      common = {
        "org.freedesktop.impl.portal.FileChooser" = "hyprland";
      };
    };
  };

  services = {
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      package = pkgs.kdePackages.sddm;
    };
    xserver = {
      xkb.layout = "us,ru";
    };
    libinput.enable = true;
  };

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = hostname;
    useDHCP = true;
    wireless.iwd = {
      enable = true;
      settings.General.EnableNetworkConfiguration = true;
    };
  };

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Experimental = true;
        };
      };
    };
  };

  fonts.packages = [ pkgs.nerd-fonts.jetbrains-mono ];
  catppuccin = {
    enable = true;
    flavor = catppuccinTheme;
  };

}
