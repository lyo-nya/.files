MiniStatusline = require("mini.statusline")
MiniDiff = require("mini.diff")
MiniIcons = require("mini.icons")
require("mini.git").setup()

MiniIcons.setup()
MiniDiff.setup({ view = { style = "number" }, options = { algirithm = "minimal" } })

-- Git summary section
local format_summary = function(data)
	-- Utilize buffer-local table summary
	local summary = vim.b[data.buf].minigit_summary
	vim.b[data.buf].minigit_summary_string = summary.head_name or ""
end
local au_opts = { pattern = "MiniGitUpdated", callback = format_summary }
vim.api.nvim_create_autocmd("User", au_opts)

-- File info section (hacky)
local section_fileinfo = function(args)
	local get_filesize = function()
		local size = math.max(vim.fn.line2byte(vim.fn.line("$") + 1) - 1, 0)
		if size < 1024 then
			return string.format("%dB", size)
		elseif size < 1048576 then
			return string.format("%.2fKiB", size / 1024)
		else
			return string.format("%.2fMiB", size / 1048576)
		end
	end
	local filetype = vim.bo.filetype

	-- Add filetype icon
	if filetype ~= "" then
		filetype = MiniIcons.get("filetype", filetype) .. " " .. filetype
	end

	-- Construct output string if truncated or buffer is not normal
	if MiniStatusline.is_truncated(args.trunc_width) or vim.bo.buftype ~= "" then
		return filetype
	end

	local size = get_filesize()

	return string.format("%s %s", filetype, size)
end
MiniStatusline.setup({
	content = {
		active = function()
			local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
			local git = MiniStatusline.section_git({ trunc_width = 40 })
			local diff = MiniStatusline.section_diff({ trunc_width = 75 })
			local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
			local filename = MiniStatusline.section_filename({ trunc_width = 140 })
			local fileinfo = section_fileinfo({ trunc_width = 120 })
			local location = MiniStatusline.section_location({ trun = 75 })

			return MiniStatusline.combine_groups({
				{ hl = mode_hl, strings = { mode } },
				{ hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics } },
				"%<", -- Mark general truncate point
				{ hl = "MiniStatuslineFilename", strings = { filename } },
				"%=", -- End left alignment
				{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
				{ hl = mode_hl, strings = { location } },
			})
		end,
	},
	use_icons = true,
})
-- Diffs
vim.keymap.set("n", "<leader>gd", MiniDiff.toggle_overlay, { desc = "[G]it [D]iff" })
