-- General theme
require('github-theme').setup {
  theme_style = 'light',
  -- Disable styling, I need just colors
  comment_style = 'NONE',
  keyword_style = 'NONE',
}

-- Colorizer
local options = {
  -- Enable all codes
  RGB = true,
  RRGGBB = true,
  names = false,
  RRGGBBAA = true,
  rgb_fn = true,
  hsl_fn = true,
  css = true,
  css_fn = true,
  mode = 'background',
}

require'colorizer'.setup {
  -- Turn on for specific file types
  yaml = options,
  css = options,
  html = options,
}

-- Icons
require'nvim-web-devicons'.setup { default = true }

-- Status line
require('lualine').setup {
  options = {
    -- Use neovim theme (nice feature of lualine BTW)
    theme = 'github_light_default',
    -- Simple flat borders
    section_separators = '',
    component_separators = '',
  },
  sections = {
    -- I don't think I really need a tabline, so I keep buffer list in
    -- status line
    lualine_a = {
      {
        'buffers',
        -- Default colors make inactive buffer disappear, this is quick fix
        buffers_color = { inactive = { bg = '#e1e4e8', fg = '#444444' } },
      },
    },
    -- Need to set to empty tables, so they are not replaced with defaults
    lualine_b = {},
    lualine_c = {},
    -- That is default, with slightly different colors for better appearance
    lualine_x = {
      'branch', {
        'diff',
        diff_color = {
          added = { fg = '#00a300' },
          modified = { fg = '#ffc000' },
          removed = { fg = '#c70039' },
        },
      }, { 'diagnostics', sources = { 'nvim_diagnostic' } },
    },
    lualine_y = { 'location' },
    lualine_z = { 'mode' },
  },
}

-- Autopairs
require'Comment'.setup { ignore = '^$' }
-- Comments
require('nvim-autopairs').setup()
