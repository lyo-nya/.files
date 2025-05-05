{ ... }:

{
  home-manager.users.lyonya =
    { config, pkgs, ... }:
    let
      pwd = builtins.toString ./.;
    in
    {
      programs = {
        kitty = {
          enable = true;
          extraConfig = "font_family JetBrains Mono Nerd Font Regular";
        };
        home-manager.enable = true;
        neovim = {
          enable = true;
          defaultEditor = true;
          viAlias = true;
          vimAlias = true;
          vimdiffAlias = true;
          plugins = with pkgs.vimPlugins; [
            nvim-lspconfig
            nvim-treesitter.withAllGrammars
            telescope-nvim
            conform-nvim
            nvim-cmp
            cmp-nvim-lsp
            cmp-buffer
            cmp-path
            cmp-cmdline
          ];
          extraLuaConfig = pkgs.lib.strings.concatStringsSep "\n" [
            (builtins.readFile ./nvim/options.lua)
            (builtins.readFile ./nvim/remaps.lua)
            (builtins.readFile ./nvim/autocommands.lua)
            (builtins.readFile ./nvim/plugins/conform.lua)
            (builtins.readFile ./nvim/plugins/cmp.lua)
            (builtins.readFile ./nvim/plugins/lsp.lua)
          ];
        };
        zsh = {
          enable = true;
          dotDir = ".config/zsh";
          envExtra = "NIXOS_CONFIG=${pwd}/configuration.nix";
          shellAliases = {
            cfg_rebuild = "cp /etc/nixos/hardware-configuration.nix ${pwd} && sudo NIXOS_CONFIG=$NIXOS_CONFIG nixos-rebuild switch";
          };

        };
        waybar.enable = true;
      };
      home = {
        stateVersion = "24.11";
        sessionVariables.NIXOS_OZONE_WL = "1";
        packages = with pkgs; [
          eza
          telegram-desktop
          rofi-wayland
          # Testing
          firefox
          # Language servers
          nil
          lua-language-server
          # Formatters
          stylua
          nixfmt-rfc-style
        ];
      };

      wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;
        extraConfig = builtins.readFile ./hypr/hyprland.conf;
      };
    };

}
