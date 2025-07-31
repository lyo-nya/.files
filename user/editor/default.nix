{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Language servers and formatters
    nixd
    lua-language-server
    ruff
    pyright
    sqlfluff
    prettierd
    stylua
    nixfmt-rfc-style
    taplo
    # For searching
    ripgrep
  ];
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      telescope-nvim
      telescope-fzf-native-nvim
      telescope-ui-select-nvim
      conform-nvim
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      which-key-nvim
      mini-diff
      mini-statusline
      mini-icons
      mini-git
    ];
    extraLuaConfig = import ./readLuaConfig.nix { pkgs = pkgs; };
  };
}
