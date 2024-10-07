---@diagnostic disable: undefined-field
return {
  'nvim-lualine/lualine.nvim',
  enabled = true,
  event = 'VeryLazy',
  dependencies = { 'justinhj/battery.nvim' },
  config = function()
    local colors = {
      bg = '#000000',
      fg = '#bbc2cf',
      yellow = '#ECBE7B',
      cyan = '#008080',
      darkblue = '#081633',
      green = '#98be65',
      orange = '#FF8800',
      violet = '#a9a1e1',
      magenta = '#c678dd',
      blue = '#51afef',
      red = '#ec5f67',
    }

    local lualine = require 'lualine'
    local git_blame = require 'gitblame'

    local function getBattery()
      return require('battery').get_status_line()
    end

    local function getBlame()
      if git_blame.get_current_blame_text() == nil then
        return [[LazyPouiiro Zzz]]
      end
      return git_blame.get_current_blame_text()
    end

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand '%:t') ~= 1
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
      check_git_workspace = function()
        local filepath = vim.fn.expand '%:p:h'
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
    }

    -- Config
    local config = {
      options = {
        -- Disable sections and component separators
        component_separators = '',
        icons_enabled = true,
        always_divide_middle = true,
        section_separators = '',
        theme = {
          -- We are going to use lualine_c an lualine_x as left and
          -- right section. Both are highlighted by c theme .  So we
          -- are just setting default looks o statusline
          normal = { c = { fg = colors.fg, bg = colors.bg } },
          inactive = { c = { fg = colors.fg, bg = colors.bg } },
        },
      },
      sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {},
      },
      inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
    }

    -- Inserts a component in lualine_c at left section
    local function ins_left(component)
      table.insert(config.sections.lualine_c, component)
    end

    -- Inserts a component in lualine_x at right section
    local function ins_right(component)
      table.insert(config.sections.lualine_x, component)
    end

    -- ins_left {
    --   function()
    --     return '▊'
    --   end,
    --   color = { fg = colors.blue }, -- Sets highlighting of component
    --   padding = { left = 0, right = 1 }, -- We don't need space before this
    -- }

    ins_left {
      -- mode component
      function()
        local m = vim.api.nvim_get_mode().mode
        return '  ' .. '  ' .. m.upper(m) .. ''
      end,
      color = function()
        -- auto change color according to neovims mode
        local mode_color = {
          n = colors.red,
          i = colors.green,
          v = colors.blue,
          [''] = colors.blue,
          V = colors.blue,
          c = colors.magenta,
          no = colors.red,
          s = colors.orange,
          S = colors.orange,
          [''] = colors.orange,
          ic = colors.yellow,
          R = colors.violet,
          Rv = colors.violet,
          cv = colors.red,
          ce = colors.red,
          r = colors.cyan,
          rm = colors.cyan,
          ['r?'] = colors.cyan,
          ['!'] = colors.red,
          t = colors.red,
        }
        return { fg = mode_color[vim.fn.mode()] }
      end,
      padding = { right = 1 },
    }
    --
    -- ins_left {
    --   -- filesize component
    --   'filesize',
    --   cond = conditions.buffer_not_empty,
    -- }

    -- ins_left {
    --   'filename',
    --   cond = conditions.buffer_not_empty,
    --   color = { fg = colors.magenta, gui = 'bold' },
    -- }

    ins_left { 'location' }

    -- ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }
    -- ins_left {
    --   'copilot',
    --   -- Default values
    --   symbols = {
    --     status = {
    --       icons = {
    --         enabled = ' ',
    --         sleep = ' ', -- auto-trigger disabled
    --         disabled = ' ',
    --         warning = ' ',
    --         unknown = ' ',
    --       },
    --       hl = {
    --         enabled = '#50FA7B',
    --         sleep = '#50FA7B',
    --         disabled = '#6272A4',
    --         warning = '#FFB86C',
    --         unknown = '#FF5555',
    --       },
    --     },
    --     spinners = require('copilot-lualine.spinners').dots,
    --     spinner_color = '#6272A4',
    --   },
    --   show_colors = true,
    --   show_loading = true,
    -- }
    --
    ins_left {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      symbols = { error = '  ', warn = '  ', info = '  ' },
      diagnostics_color = {
        error = { fg = colors.red },
        warn = { fg = colors.yellow },
        info = { fg = colors.cyan },
      },
    }

    -- Insert mid section. You can make any number of sections in neovim :)
    -- for lualine it's any number greater then 2
    ins_left {
      function()
        return '%='
      end,
    }

    ins_left {
      -- Lsp server name .
      function()
        local msg = 'No Active Lsp'
        local buf_ft = vim.bo.filetype
        local clients = vim.lsp.get_clients { bufnr = 0 }
        if next(clients) == nil then
          return msg
        end

        local client_names = {}

        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            table.insert(client_names, client.name)
          end
        end

        if #client_names == 0 then
          return msg
        else
          return table.concat(client_names, ', ')
        end
      end,
      icon = '  LSP:',
      color = { fg = '#ffffff', gui = 'bold' },
    }

    -- Add components to right sections
    ins_right {
      function()
        return getBlame()
      end,
      color = { fg = colors.blue }, -- Sets highlighting of component
      padding = { left = 0, right = 1 }, -- We don't need space before this
    }

    -- ins_right {
    --   'o:encoding', -- option component same as &encoding in viml
    --   fmt = string.upper, -- I'm not sure why it's upper case either ;)
    --   cond = conditions.hide_in_width,
    --   color = { fg = colors.green, gui = 'bold' },
    -- }
    --
    -- ins_right {
    --   'fileformat',
    --   fmt = string.upper,
    --   icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
    --   color = { fg = colors.green, gui = 'bold' },
    -- }

    ins_right {
      'branch',
      icon = '',
      color = { fg = colors.violet, gui = 'bold' },
    }

    ins_right {
      'diff',
      -- Is it me or the symbol for modified us really weird
      symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
      diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.orange },
        removed = { fg = colors.red },
      },
      cond = conditions.hide_in_width,
    }

    ins_right {
      getBattery,
      color = { fg = colors.fg, bg = colors.bg },
    }

    -- ins_right {
    --   function()
    --     return '▊'
    --   end,
    --   color = { fg = colors.blue },
    --   padding = { left = 1 },
    -- }

    -- Now don't forget to initialize lualine
    lualine.setup(config)
  end,
}
