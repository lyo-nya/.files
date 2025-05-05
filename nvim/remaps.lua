-- Space as mapleader
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Formatter
vim.keymap.set("", "<leader>f", function()
	require("conform").format({ async = true, lsp_fallback = true })
end)
