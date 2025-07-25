local fb_actions = require("telescope._extensions.file_browser.actions")
require("telescope").load_extension("file_browser")
require("telescope").setup({
	defaults = { file_ignore_patterns = { "csv", "png" } },
	extensions = {
		file_browser = {
			mappings = {
				["n"] = { ["c"] = fb_actions.create },
			},
		},
	},
})

-- Enable Telescope extensions if they are installed
pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")
