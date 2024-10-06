return {
  'akinsho/bufferline.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('bufferline').setup {
      highlights = {
        fill = {
          fg = '#000000',
          bg = '#000000',
        },
        background = {
          fg = '#5a5b5c',
          bg = '#000000',
        },
        tab = {
          fg = '#5a5b5c',
          bg = '#000000',
        },
        tab_selected = {
          fg = '#fff000',
          bg = '#000000',
        },
        tab_separator = {
          fg = '#000000',
          bg = '#000000',
        },
        tab_separator_selected = {
          fg = '#000000',
          bg = '#000000',
          sp = '#000000',
        },
        buffer_visible = {
          fg = '#5a5b5c',
          bg = '#000000',
        },
        buffer_selected = {
          fg = '#fff000',
          bg = '#000000',
          bold = true,
          italic = false,
        },
        separator_visible = {
          fg = '#000000',
          bg = '#000000',
        },
        separator = {
          fg = '#000000',
          bg = '#000000',
        },
        indicator_visible = {
          fg = '#000000',
          bg = '#000000',
        },
        indicator_selected = {
          fg = '#000000',
          bg = '#000000',
          blend = 'winblend',
          winblend = 0,
        },

        -- tab_close = {
        --   fg = '<colour-value-here>',
        --   bg = '<colour-value-here>',
        -- },
      },
      options = {
        mode = 'buffers',
        themable = true,
        show_buffer_icons = true,
        enforce_regular_tabs = true,
        offsets = {
          {
            filetype = 'NvimTree',
            text = 'File Explorer',
            separator = false,
            text_align = 'left',
            highlight = 'Directory',
          },
        },
        color_icons = true,
        indicator = {
          style = 'none',
        },
        sort_by = 'insert_at_end',
        separator_style = { '', '' },
        -- groups = {
        --   options = {
        --     toggle_hidden_on_enter = true, -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
        --   },
        --   items = {
        --     -- {
        --     --   require('bufferline.groups').builtin.pinned:with { icon = '󰐃 ' },
        --     --   auto_close = true, -- whether or not close this group if it doesn't contain the current buffer
        --     --   name = 'Json',
        --     --   -- icon = '{}',
        --     --   matcher = function(buf) -- buf here is now only a subset of the full buffer object
        --     --     return vim.api.nvim_buf_get_name(buf.id):match '%.json'
        --     --   end,
        --     -- },
        --     {
        --       name = 'Tests', -- Mandatory
        --       auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
        --       priority = 2, -- determines where it will appear relative to other groups (Optional)
        --       -- icon = '', -- Optional
        --       matcher = function(buf) -- Mandatory
        --         return vim.api.nvim_buf_get_name(buf.id):match '%.test.*' or vim.api.nvim_buf_get_name(buf.id):match '%.spec.*'
        --       end,
        --     },
        --     -- {
        --     --   require('bufferline.groups').builtin.pinned:with { icon = '󰐃 ' },
        --     --   auto_close = true, -- whether or not close this group if it doesn't contain the current buffer
        --     --   name = 'Dot',
        --     --   -- icon = '',
        --     --   matcher = function(buf) -- buf here is now only a subset of the full buffer object
        --     --     local filename = vim.api.nvim_buf_get_name(buf.id)
        --     --     local basename = filename:match '([^/]+)$'
        --     --     return basename and basename:match '^%.' ~= nil
        --     --   end,
        --     -- },
        --     -- require('bufferline.groups').builtin.pinned:with {
        --     --   icon = '󰐃 ',
        --     --   name = 'Docs',
        --     --   auto_close = false,
        --     --   -- highlight = { undercurl = true, sp = 'green' },
        --     --   matcher = function(buf)
        --     --     return vim.api.nvim_buf_get_name(buf.id):match '%.md' or vim.api.nvim_buf_get_name(buf.id):match '%.txt'
        --     --   end,
        --     --   separator = { -- Optional
        --     --     style = require('bufferline.groups').separator.tab,
        --     --   },
        --     -- },
        --   },
        -- },
        buffer_close_icon = '󰅖',
        modified_icon = '● ',
        close_icon = '󰅖',
        left_trunc_marker = ' ',
        right_trunc_marker = ' ',
        get_element_icon = function(element)
          -- element consists of {filetype: string, path: string, extension: string, directory: string}
          -- This can be used to change how bufferline fetches the icon
          -- for an element e.g. a buffer or a tab.
          -- e.g.
          local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
          if icon ~= nil then
            return icon .. ' ' .. ' ', hl
          else
            return '󰄛'
          end
        end,
        auto_toggle_bufferline = true,
        always_show_bufferline = false,

        -- diagnostics = 'nvim_lsp',
        -- diagnostics_indicator = function(count, level)
        --   local icon = level:match 'error' and '  ' or '   '
        --   return '' .. icon .. count
        -- end,
      },
    }
  end,
}
