return {
  "b0o/incline.nvim",
  event = "BufReadPre",
  priority = 1200,
  config = function()
    local helpers = require("incline.helpers")
    local devicons = require("nvim-web-devicons")

    require("incline").setup({
      window = {
        padding = 0,
        margin = { horizontal = 0 },
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        if filename == "" then
          filename = "Pouiiro Zzz"
        end
        local ft_icon, ft_color = devicons.get_icon_color(filename)
        local modified = vim.bo[props.buf].modified
        local bg_color = "#44406e"
        return {
          { "", guifg = ft_color or bg_color },
          {
            ft_icon and { "", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
            " ",
            { filename, gui = modified and "bold,italic" or "bold" },
            " ",
            guibg = bg_color,
          },
          { "", guifg = bg_color },
        }
      end,
    })
  end,
}
