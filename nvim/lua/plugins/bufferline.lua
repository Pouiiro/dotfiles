return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      mode = "buffers",
      themable = true,
      show_buffer_icons = false,
      hover = {
        enabled = true,
        delay = 150,
        reveal = { "close" },
      },
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          text_align = "left",
          highlight = "Directory",
        },
      },
      color_icons = true,
      sort_by = "insert_at_end",
      separator_style = "thin",
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level)
        local icon = level:match("error") and "  " or "   "
        return "" .. icon .. count
      end,
    },
  },
}
