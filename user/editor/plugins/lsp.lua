local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
	capabilities = capabilities,
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if
				path ~= vim.fn.stdpath("config")
				and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
			then
				return
			end
		end

		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				-- Tell the language server which version of Lua you're using (most
				-- likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Tell the language server how to find Lua modules same way as Neovim
				-- (see `:h lua-module-load`)
				path = {
					"lua/?.lua",
					"lua/?/init.lua",
				},
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
				},
			},
		})
	end,
	settings = {
		Lua = {},
	},
})

lspconfig.nixd.setup({ capabilities = capabilities })
lspconfig.ruff.setup({
	settings = { logLevel = "info" },
	capabilities = capabilities,
	-- on_attach = function(client)
	-- 	client.server_capabilities.hoverProvider = false
	-- end,
})
lspconfig.pyright.setup({
	capabilities = capabilities,
	on_attach = function(client)
		client.server_capabilities.hoverProvider = false
	end,
})
lspconfig.rust_analyzer.setup({
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {
			checkOnSave = true,
			check = {
				command = "clippy",
				extraArgs = {
					"--",
					"--no-deps",
					"-Dclippy::correctness",
					"-Dclippy::complexity",
					"-Dclippy::perf",
					"-Dclippy::pedantic",
					"-Aclippy::module_name_repetitions",
				},
			},
		},
	},
})

vim.lsp.config(
	"ty",
	{ cmd = { "ty", "server" }, filetypes = { "python" }, root_markers = { "ty.toml", "pyproject.toml", ".git" } }
)
vim.lsp.enable("ty")

require("lsp_signature").setup({ hint_enable = false })
