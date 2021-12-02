local g = vim.g
local o = vim.opt

g.mapleader = ' '

-- Line numbers
o.number = true
o.relativenumber = true

-- Clipboard
o.clipboard = 'unnamedplus'

-- Swap file
o.swapfile = false

-- Aesthetics
o.colorcolumn = '80'
o.cmdheight = 1
o.showtabline = 0
o.termguicolors = true
o.scrolloff = 10
o.showmode = false
o.wrap = false
o.splitbelow = true
o.splitright = true

-- Had to introduce auto command so that this option is not overridden by file type plugin
vim.cmd [[ au BufWinEnter * set formatoptions-=o ]]

-- Indentation
o.autoindent = true
o.cindent = true
o.expandtab = true
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4

-- Smoothness
o.updatetime = 1000

-- Completions
o.completeopt = 'menu,noselect'
o.omnifunc = 'v:lua.vim.lsp.omnifunc'
o.wildignore = { '*.pyc', '*pycache*' }

-- Tree-sitter
o.foldmethod = 'expr'
o.syntax = 'true'
o.foldexpr = 'nvim_treesitter#foldexpr()'
