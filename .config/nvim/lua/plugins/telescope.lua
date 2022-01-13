local actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
    path_display = { 'shorten' },
    -- I prefer sharp borders
    borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
    -- Close buffer with escape in insert mode
    mappings = { i = { ['<esc>'] = actions.close } },
    prompt_prefix = ' ',
    prompt_position = 'top',
    selection_caret = '➤ ',
    file_ignore_patterns = { '^__pycache__/', '%.pyc' },
  },
  extensions = { file_browser = {} },
  fzf = {
    fuzzy = true,
    override_generic_sorter = true,
    override_file_sorter = true,
    case_mode = 'smart_case',
  },
}

require('telescope').load_extension 'file_browser'
require('telescope').load_extension('fzf')
