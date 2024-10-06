return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    local gatto = require 'catppuccin'

    gatto.setup {
      flavour = 'mocha', -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = 'latte',
        dark = 'mocha',
      },
      transparent_background = true, -- disables setting the background color.
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = 'dark',
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      no_underline = false, -- Force no underline
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { 'italic' }, -- Change the style of comments
        conditionals = { 'italic' },
        loops = {},
        functions = { 'italic' },
        keywords = { 'bold', 'italic' },
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
      },
      color_overrides = {
        -- all = {},
        mocha = {
          rosewater = '#efc9c2',
          flamingo = '#ebb2b2',
          pink = '#f2a7de',
          mauve = '#b889f4',
          red = '#ea7183',
          maroon = '#ea838c',
          peach = '#f39967',
          yellow = '#eaca89',
          green = '#96d382',
          teal = '#78cec1',
          sky = '#91d7e3',
          sapphire = '#68bae0',
          blue = '#739df2',
          lavender = '#a0a8f6',
          text = '#b5c1f1',
          subtext1 = '#a6b0d8',
          subtext0 = '#959ec2',
          overlay2 = '#848cad',
          overlay1 = '#717997',
          overlay0 = '#63677f',
          surface2 = '#505469',
          surface1 = '#3e4255',
          surface0 = '#2c2f40',
          base = '#1a1c2a',
          mantle = '#141620',
          crust = '#0e0f16',
        },
      },
      default_integrations = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = true,
        telescope = true,
        dashboard = true,
        mason = true,
        flash = true,
        which_key = true,
        markdown = true,
        mini = { enabled = true, indentscope_color = '' },
        indent_blankline = {
          enabled = true,
          scope_color = 'mauve', -- catppuccin color (eg. `lavender`) Default: text
          colored_indent_levels = true,
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
      custom_highlights = function(colors)
        return {
          -- Comment = { fg = colors.subtext0 },
          TabLineSel = { bg = colors.yellow },
          CmpBorder = { fg = colors.red, bg = colors.red },
          CursorLine = {
            bg = '#210f2e',
          },
          NvimTreeNormal = { bg = colors.none },
          -- VertSplit = { bg = '#ff0000', fg = '#ff0000' },
          WinSeparator = { bg = colors.none, fg = colors.none },
          FloatermBorder = { fg = colors.teal },
          FloatermNC = { fg = 'gray' },
        }
      end,
    }

    -- Set theme color
    vim.cmd.colorscheme 'catppuccin-mocha'
    local hl_groups = { 'DiagnosticUnderlineError', 'DiagnosticUnderlineWarning', 'DiagnosticUnderlineInfo', 'DiagnosticUnderlineHint' }
    for _, hl in ipairs(hl_groups) do
      vim.cmd.highlight(hl .. ' gui=undercurl')
    end
    -- You can configure highlights by doing something like:
    -- vim.cmd.hi 'Comment gui=none'
  end,
}
