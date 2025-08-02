{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Language servers and formatters
    # Nix
    nixd
    nixfmt-rfc-style
    # Python
    ty
    ruff
    pyright
    basedpyright
    # SQL
    sqlfluff
    # Lua
    stylua
    # Rust
    cargo
    rustc
    rustfmt
    rust-analyzer
    clippy
    # Other
    lua-language-server
    prettierd
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
      lsp_signature-nvim
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
      # Mini
      mini-diff
      mini-statusline
      mini-icons
      mini-git
    ];
    extraLuaConfig = import ./readLuaConfig.nix { pkgs = pkgs; };
  };
}
