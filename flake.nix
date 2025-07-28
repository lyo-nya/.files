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
      system = "x86_64-linux";
      user = "lyonya";
      hostname = "large";
      pkgs = nixpkgs.legacyPackages."${system}";
    in
    {
      pkgs.config.allowUnfree = true;
      nixosConfigurations."${hostname}" = nixpkgs.lib.nixosSystem {
        system = system;
        modules = [
          home-manager.nixosModules.home-manager
          catppuccin.nixosModules.catppuccin
          ./hardware-configuration.nix
          (import ./configuration.nix {
            inherit
              pkgs
              hostname
              user
              catppuccin
              zen-browser
              ;
          })
        ];
      };
    };
}
