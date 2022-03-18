vim.cmd [[packadd packer.nvim]]
local packer = require 'packer'
return packer.startup(function()
  -- Plugin manager
  use 'wbthomason/packer.nvim'
  -- Colorize color codes
  use 'norcalli/nvim-colorizer.lua'
  -- Icons, required by multiple plugins
  use 'kyazdani42/nvim-web-devicons'
  -- Theme
  use 'projekt0n/github-nvim-theme'
  -- Status line
  use 'nvim-lualine/lualine.nvim'
  -- LSP
  use 'neovim/nvim-lspconfig'
  -- Completions
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'onsails/lspkind-nvim'
  use 'rafamadriz/friendly-snippets'
  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
  }
  use { 'nvim-telescope/telescope-file-browser.nvim' }
  -- Fuzzy finder for telescope
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- Auto pairs
  use 'windwp/nvim-autopairs'
  -- Fast comments
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  }
  -- Tree-sitter
  use { 'nvim-treesitter/nvim-treesitter', run = 'TSUpdate' }
  -- Markdown preview

  use 'davidgranstrom/nvim-markdown-preview'

end)

