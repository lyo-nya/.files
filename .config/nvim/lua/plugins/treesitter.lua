-- TreeSitter initialization
require'nvim-treesitter.configs'.setup {
  ensure_installed = { 'python', 'bash', 'lua', 'yaml', 'toml' },
  sync_install = true,
  highlight = { enable = true, additional_vim_regex_highlighting = false },
  indent = { enable = false },
}
