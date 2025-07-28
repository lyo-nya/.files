require("telescope").setup({ defaults = { file_ignore_patterns = { "csv", "png" } } })
-- Enable Telescope extensions if they are installed
pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")
