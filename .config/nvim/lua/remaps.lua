local map = vim.api.nvim_set_keymap

-- Little wrapper function with my preferred defaults
local function remap(mode, key, value, nocr)
  local opts = { noremap = true, silent = true }
  -- Most of my mappings require <CR> at the end, this line allow less typing
  if not nocr then value = value .. '<CR>' end
  map(mode, key, value, opts)
end

-- Fast escape (normal mode)
remap('i', 'jk', '<Esc>', true)

-- Disable arrows
remap('', '<up>', '<nop>', true)
remap('', '<down>', '<nop>', true)
remap('', '<left>', '<nop>', true)
remap('', '<right>', '<nop>', true)

-- Buffers
-- Tabs
remap('n', '<A-q>', ':bd')
remap('n', '<A-l>', ':bn')
remap('n', '<A-h>', ':bp')
-- Splits
remap('n', '<C-j>', '<C-w>j')
remap('n', '<C-k>', '<C-w>k')
remap('n', '<C-l>', '<C-w>l')
remap('n', '<C-h>', '<C-w>h')

-- Telscope
remap('n', '<leader>b', [[ :lua require 'lyonya.finders'.file_browser() ]])
remap('n', '<leader>f', [[ :lua require 'lyonya.finders'.find_files() ]])
remap('n', '<leader>h', [[ :lua require 'lyonya.finders'.help_tags() ]])
remap('n', '<leader>s', [[ :lua require 'lyonya.finders'.buffer_find() ]])
remap('n', '<leader>d', [[ :lua require 'lyonya.finders'.lsp_definitions() ]])
remap('n', '<leader>e', [[ :lua require 'lyonya.finders'.diagnostics() ]])
remap('n', '<leader>.', [[ :lua require 'lyonya.finders'.edit_dotfiles() ]])

-- LSP
remap('n', '<leader>E', ':lua vim.lsp.diagnostic.show_line_diagnostics()')
remap('n', 'K', ':lua vim.lsp.buf.hover()')
remap('n', '<leader>p', ':lua vim.lsp.buf.formatting()')

-- Spell check
remap('n', '<leader>S', ':setlocal spell!')
