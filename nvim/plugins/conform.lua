require("conform").setup({
	notify_on_error = true,
	logLevel = vim.log.levels.DEBUG,
	format_on_save = function(bufnr)
		local disable_filetypes = { c = true, cpp = true }
		return {
			timeout_ms = 5000,
			lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
		}
	end,
	formatters_by_ft = {
		lua = { "stylua" },
		nix = { "nixfmt" },
		python = { "ruff_format", "ruff_fix" },
		sql = { "sqlfluff" },
		json = { "prettier" },
		toml = { "taplo" },
	},
	formatters = {
		sqlfluff = {
			args = function()
				local config_path = vim.fs.find(".sqlfluff", {
					upward = true,
					type = "file",
					stop = vim.loop.os_homedir(),
					path = vim.fs.dirname(vim.api.nvim_buf_get_name(0)),
				})[1]
				return {
					"fix",
					"--config",
					config_path,
					"-",
				}
			end,
		},
	},
})
