local tele = require 'telescope.builtin'
local file_browser = require 'telescope'.extensions.file_browser.file_browser
local pickers = require 'telescope.pickers'
local actions = require 'telescope.actions'
local action_state = require 'telescope.actions.state'
local sorters = require 'telescope.sorters'
local finders = require 'telescope.finders'
local themes = require 'telescope.themes'

-- Define table to store all finders
local M = {}

-- Define some settings here, so they are easier to find
M.dotfiles = {
  'nvim', 'zsh', 'qtile', 'alacritty', 'lf', 'git', 'luaformatter',
  'efm-langserver', '.xinitrc', '.zshenv', '.Xmodmap', 'yapf',
}

-- Tuned telescope file_browser
function M.file_browser(opts)
  opts = opts or {}
  local file_browser_opts = {
    hidden = true,
    path_display = {},
    -- I rarely use browser, but when I do, I prefer it to mimic file manager
    initial_mode = 'normal',
    -- Only one title at the top
    prompt_title = 'File browser',
    preview_title = '',
    results_title = '',
    layout_strategy = 'vertical',
    layout_config = {
      vertical = {
        mirror = true,
        prompt_position = 'top',
        preview_cutoff = 1,
        width = 65,
        height = 20,
        -- Small preview
        preview_height = 4,
      },
    },
  }
  opts = vim.tbl_deep_extend('force', file_browser_opts, opts)
  file_browser(opts)
end

-- Tuned telescope find_files
function M.find_files(opts)
  opts = opts or {}
  local find_files_opts = {
    hidden = true,
    layout_strategy = 'horizontal',
    prompt_title = '',
    preview_title = '',
    results_title = 'Find files',
    search_dirs = { '~/Projects', '~/.config' },
    layout_config = {
      -- Fit the screen
      height = function(_, _, max_lines)
        return max_lines
      end,
      width = function(_, max_columns, _)
        return max_columns
      end,
      prompt_position = 'bottom',
      preview_width = 80,
    },
  }
  opts = vim.tbl_deep_extend('force', find_files_opts, opts)
  tele.find_files(opts)
end

-- Tuned telescope help_tags
function M.help_tags()
  local opts = {
    borderchars = {
      preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
    },
    preview_title = '',
  }
  opts = themes.get_ivy(opts)
  tele.help_tags(opts)
end

-- Tuned telescope current_buffer_fuzzy_find
function M.buffer_find()
  local opts = {
    skip_empty_lines = true,
    preview_title = '',
    results_title = 'Buffer search',
    layout_config = { preview_width = 80 },
  }
  tele.current_buffer_fuzzy_find(opts)
end

-- Tuned telescope lsp_definitions
function M.lsp_definitions()
  local opts = {
    initial_mode = 'normal',
    jump_type = 'never',
    results_title = 'Definitions',
    prompt_title = '',
    preview_title = '',
  }
  tele.lsp_definitions(opts)
end

-- Tuned telescope lsp_document_diagnostics
function M.diagnostics()
  local opts = {
    -- Most of the time, I will not search for anything
    initial_mode = 'normal',
    -- Only one title at the top
    prompt_title = 'LSP diagnostics',
    preview_title = '',
    results_title = '',
    layout_strategy = 'vertical',
    layout_config = {
      vertical = {
        mirror = true,
        prompt_position = 'top',
        preview_cutoff = 1,
        width = function(_, max_columns, _)
          return max_columns
        end,
        height = 20,
        -- Small preview
        preview_height = 4,
      },
    },
  }
  tele.diagnostics(opts)
end

-- Function to quickly get to dotfiles
function M.edit_dotfiles()
  -- Mapping function to pass to a picker
  local function mapping(prompt_bufnr, map)
    -- I only need special action for selecting entry
    local function enter(prompt_bufnr)
      local selected = action_state.get_selected_entry()[1] -- Get entry
      actions.close(prompt_bufnr) -- Close picker once I get entry
      -- If selected item is a file, open it in new tab
      if string.sub(selected, 1, 1) == '.' then
        vim.cmd('tabe ~/' .. selected)
        -- It selected item is a directory, start find_file there
      else
        M.find_files { cwd = '~/.config/' .. selected }
      end
    end
    -- Map action to return key
    map('i', '<CR>', enter)
    map('n', '<CR>', enter)
    return true -- This has to be here afaik
  end

  -- Just basic options
  local opts = {
    prompt_title = 'Edit dotfiles',
    finder = finders.new_table(M.dotfiles),
    sorter = sorters.get_generic_fuzzy_sorter {},
    attach_mappings = mapping,
    borderchars = {
      prompt = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
      results = { '─', '│', '─', '│', '├', '┤', '┘', '└' },
    },
  }
  opts = themes.get_dropdown(opts) -- Force dropdown menu
  opts.layout_config.width = 30 -- Make it smaller
  -- Initialization
  local picker = pickers.new(opts)
  picker:find()
end
return M
