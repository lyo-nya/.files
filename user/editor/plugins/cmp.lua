local cmp = require("cmp")

cmp.setup({
	window = {
		completion = {
			-- Does not work
			scrollabar = false,
			border = "single",
		},
		documentation = {
			scrollabar = false,
			border = "single",
		},
	},
	completion = { completeopt = "menu,menuone,noinsert" },
	mapping = cmp.mapping.preset.insert({
		["<C-D-n>"] = cmp.mapping.select_next_item(),
		["<C-D-p>"] = cmp.mapping.select_prev_item(),
		["<C-D-y>"] = cmp.mapping.confirm({ select = true }),
		["<C-D-Space>"] = cmp.mapping.complete({}),
	}),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "buffer" },
	},
})

local cmdlineMapping = cmp.mapping.preset.cmdline({
	["<C-D-n>"] = {
		c = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
	},
	["<C-D-p>"] = {
		c = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end,
	},
	["<C-D-y>"] = {
		c = cmp.mapping.confirm({ select = false }),
	},
})

cmp.setup.cmdline("/", {
	mapping = cmdlineMapping,
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmdlineMapping,
	sources = cmp.config.sources(
		{ { name = "path" } },
		{ { name = "cmdline", option = { ignore_cmds = { "Man", "!" } } } }
	),
})
