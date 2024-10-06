return {
  'mrcapivaro/true-zen.nvim',
  config = function()
    require('true-zen').setup {
      modes = { -- configurations per mode
        ataraxis = {
          shade = 'dark', -- if `dark` then dim the padding windows, otherwise if it's `light` it'll brighten said windows
          backdrop = 1, -- percentage by which padding windows should be dimmed/brightened. Must be a number between 0 and 1. Set to 0 to keep the same background color
          minimum_writing_area = { -- minimum size of main window
            width = 90,
            height = 50,
          },
          quit_untoggles = true, -- type :q or :qa to quit Ataraxis mode
          padding = { -- padding windows
            left = 52,
            right = 52,
            top = 0,
            bottom = 0,
          },
          callbacks = { -- run functions when opening/closing Ataraxis mode
            open_pre = nil,
            open_pos = nil,
            close_pre = nil,
            close_pos = nil,
          },
        },
        minimalist = {
          ignored_buf_types = { 'nofile' }, -- save current options from any window except ones displaying these kinds of buffers
          options = { -- options to be disabled when entering Minimalist mode
            number = false,
            relativenumber = false,
            showtabline = 0,
            signcolumn = 'no',
            statusline = '',
            cmdheight = 1,
            laststatus = 0,
            showcmd = false,
            showmode = false,
            ruler = false,
            numberwidth = 1,
          },
          callbacks = { -- run functions when opening/closing Minimalist mode
            open_pre = nil,
            open_pos = nil,
            close_pre = nil,
            close_pos = nil,
          },
        },
        narrow = {
          --- change the style of the fold lines. Set it to:
          --- `informative`: to get nice pre-baked folds
          --- `invisible`: hide them
          --- function() end: pass a custom func with your fold lines. See :h foldtext
          folds_style = 'informative',
          run_ataraxis = true, -- display narrowed text in a Ataraxis session
          callbacks = { -- run functions when opening/closing Narrow mode
            open_pre = nil,
            open_pos = nil,
            close_pre = nil,
            close_pos = nil,
          },
        },
        focus = {
          callbacks = { -- run functions when opening/closing Focus mode
            open_pre = nil,
            open_pos = nil,
            close_pre = nil,
            close_pos = nil,
          },
        },
      },
      integrations = {
        tmux = false, -- hide tmux status bar in (minimalist, ataraxis)
        kitty = { -- increment font size in Kitty. Note: you must set `allow_remote_control socket-only` and `listen_on unix:/tmp/kitty` in your personal config (ataraxis)
          enabled = true,
          font = '+2',
        },
        twilight = false, -- enable twilight (ataraxis)
        lualine = false, -- hide nvim-lualine (ataraxis)
      },
    }

    local truezen = require 'true-zen'
    local keymap = vim.keymap

    keymap.set('n', '<leader>zn', function()
      local first = 0
      local last = vim.api.nvim_buf_line_count(0)
      truezen.narrow(first, last)
    end, { noremap = true, desc = 'Narrow' })
    keymap.set('v', '<leader>zn', function()
      local first = vim.fn.line 'v'
      local last = vim.fn.line '.'
      truezen.narrow(first, last)
    end, { noremap = true, desc = 'Narrow' })
    keymap.set('n', '<leader>zf', truezen.focus, { noremap = true, desc = 'Focus' })
    keymap.set('n', '<leader>zm', truezen.minimalist, { noremap = true, desc = 'Minimalistic' })
    keymap.set('n', '<leader>za', truezen.ataraxis, { noremap = true, desc = 'Ataraxis' })
  end,
}
