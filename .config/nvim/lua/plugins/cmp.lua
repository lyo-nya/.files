-- Lspkind (nice looking menu)
local lspkind = require 'lspkind'

-- Luasnip
local luasnip = require 'luasnip'

-- I don't have my own snippets yet
require'luasnip.loaders.from_vscode'.load { include = { 'python', 'lua', 'sh' } }

-- Cmp
-- This is more or less default configuration
local cmp = require 'cmp'
cmp.setup {
  mapping = {
    ['<C-j>'] = cmp.mapping.select_next_item({
      behavior = cmp.SelectBehavior.Select,
    }),
    ['<C-k>'] = cmp.mapping.select_prev_item({
      behavior = cmp.SelectBehavior.Select,
    }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-d>'] = cmp.config.disable,
    ['<C-e>'] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' }, { name = 'luasnip' }, { name = 'nvim_lua' },
    { name = 'path' }, { name = 'buffer', keyword_length = 4 },
  },
  snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = '[Buffer]',
        nvim_lsp = '[LSP]',
        nvim_lua = '[Lua]',
        path = '[Path]',
        luasnip = '[Snippet]',
      },
    },
  },
  experimental = { native_menu = false, ghost_text = true },
}
