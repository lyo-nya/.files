-- Border around hover window
vim.lsp.handlers['textDocument/hover'] =
  vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })

-- Enable completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Define LSP configuration object
local nvim_lsp = require 'lspconfig'

-- Lua
local user = vim.fn.expand('$USER')
local sumneko_path = '/.local/share/lua-language-server'
local sumneko_root_path = '/home/' .. user .. sumneko_path
local sumneko_binary_path =
  sumneko_root_path .. '/bin/Linux/lua-language-server'
local runtime_path = vim.split(package.path, ';')

table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

nvim_lsp.sumneko_lua.setup {
  capabilities = capabilities,
  cmd = { sumneko_binary_path, '-E', sumneko_root_path .. '/main.lua' },
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT', path = runtime_path },
      diagnostics = { globals = { 'vim' } },
      workspace = { library = vim.api.nvim_get_runtime_file('', true) },
      telemetry = { enable = false },
      hint = { enable = true },
      color = { mode = 'SemanticEnhanced' },
      completion = { enable = true, CallSnippet = 'Replace' },
    },
  },
}

-- Python
nvim_lsp.pyright.setup {
  disableLanguageServices = false,
  disableOrganizeImports = false,
  -- analysis = { diagnosticMode = 'workspace', useLibraryCodeForTypes = true },
}

nvim_lsp.efm.setup {
  capabilities = capabilities,
  root_dir = nvim_lsp.util.root_pattern({ '.git', '.config' }),
  filetypes = {
    'lua', 'bash', 'zsh', 'python', 'yaml', 'sh', 'html', 'css', 'scss',
    'javascript',
  },
}

