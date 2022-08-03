-- TreeSitter initialization
require'nvim-treesitter.configs'.setup {
  ensure_installed = { 'python', 'bash', 'lua', 'yaml', 'toml', 'html', 'css', 'r', 'typescript' },
  sync_install = true,
  highlight = { enable = true, additional_vim_regex_highlighting = false },
  indent = { enable = false },
}
