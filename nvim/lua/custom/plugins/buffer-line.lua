return {
  'akinsho/bufferline.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      mode = 'buffers',
      themable = true,
      show_buffer_icons = true,
      offsets = {
        {
          filetype = 'NvimTree',
          text = 'Nvim Tree',
          separator = true,
          text_align = 'left',
        },
      },
      color_icons = true,
      sort_by = 'insert_at_end',
      separator_style = { '  ', '  ' },
      -- diagnostics = 'nvim_lsp',
      -- diagnostics_indicator = function(count, level)
      --   local icon = level:match 'error' and '  ' or '   '
      --   return '' .. icon .. count
      -- end,
    },
  },
}
