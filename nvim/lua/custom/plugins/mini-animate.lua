if vim.g.neovide then
  return {}
end

return {
  'echasnovski/mini.animate',
  version = false,
  cond = function()
    if vim.g.neovide then
      return true
    end

    return false
  end,
  config = function()
    require('mini.animate').setup {
      -- Cursor path
      cursor = {
        -- Whether to enable this animation
        enable = true,
      },

      -- Vertical scroll
      scroll = {
        -- Whether to enable this animation
        enable = false,
      },

      -- Window resize
      resize = {
        -- Whether to enable this animation
        enable = true,
      },

      -- Window open
      open = {
        -- Whether to enable this animation
        enable = true,
      },

      -- Window close
      close = {
        -- Whether to enable this animation
        enable = true,
      },
    }
  end,
}
