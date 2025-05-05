local cmp = require("cmp")
cmp.setup({
	window = { completion = cmp.config.window.bordered() },
	completion = { completeopt = "menu,menuone,noinsert" },
	mapping = cmp.mapping.preset.insert({
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete({}),
	}),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "buffer" },
	},
})

cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources(
		{ { name = "path" } },
		{ { name = "cmdline", option = { ignore_cmds = { "Man", "!" } } } }
	),
})
