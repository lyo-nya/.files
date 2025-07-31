{
  description = "A simple NixOS flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    catppuccin.url = "github:catppuccin/nix";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs =
    {
      nixpkgs,
      catppuccin,
      home-manager,
      zen-browser,
      ...
    }:
    let
      user = "lyonya";
      hostname = "large";
      system = "x86_64-linux";
    in
    {
      pkgs.config.allowUnfree = true;
      nixosConfigurations."${hostname}" = nixpkgs.lib.nixosSystem {
        specialArgs = {
          user = user;
          hostname = hostname;
          catppuccinTheme = "mocha";
        };
        system = system;
        modules = [
          # NixOS modules
          home-manager.nixosModules.home-manager
          catppuccin.nixosModules.catppuccin
          # Home modules
          {
            home-manager.users."${user}" = {
              imports = [
                catppuccin.homeModules.catppuccin
                zen-browser.homeModules.twilight
              ];
            };
          }
          # My configuration
          ./hardware-configuration.nix
          ./configuration.nix
        ];
      };
    };
}
