-- ASCII art header
-- source: https://patorjk.com/software/taag/#p=display&f=Doom&t=diegoulloao
local logo = [[
⣿⣿⣿⣿⢏⣼⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢯⣹⣮⢿⣿⣿⣿⣿
⡿⡿⠛⠵⢛⣽⣿⣿⣿⢯⡿⣿⣿⣿⣿⣿⡿⠿⢿⣯⣿⣿⡟⡏⣫⠻⣿⣿⣿⣿
⣿⣾⡿⣴⣿⣿⣿⡿⣣⢰⡇⣿⣿⣿⣿⣿⢿⡿⠰⣍⢸⣿⡟⠇⠚⣷⢻⣿⣿⣿
⣿⣿⡏⡏⣿⣿⣏⢿⣟⠋⢇⡃⣿⣿⣿⠇⠘⠁⠁⡹⢸⣿⡇⣤⡸⣹⢿⣿⣿⣿
⣿⣿⡧⡇⣹⡿⡿⠊⣠⡶⢒⢠⣮⣛⣫⡔⢉⠙⣷⡆⢈⣿⡇⣿⢧⣻⢸⣿⣿⣿
⣿⣿⣿⣔⢯⢃⠻⢪⡿⣷⣤⣾⣿⠿⣿⣷⣶⣾⡿⣿⣸⣿⣧⢈⠈⣷⢼⠿⣿⣿
⣿⣿⡿⣫⢟⡄⠀⠨⣤⣼⣿⣿⠁⠀⠈⣿⣿⣶⣼⠿⢹⣿⡟⢸⣿⣿⠈⣿⣿⣿
⣿⡿⡘⣵⡟⣰⣿⣷⠀⠉⠉⠛⠓⠒⠓⠉⡙⠉⠀⠀⠸⣿⡇⠄⣿⣿⣀⠈⣻⣿
⣿⣇⠽⣫⢺⢻⣿⡿⠀⠀⠒⠢⠀⠠⠂⠛⠡⠞⠁⠀⠀⢻⡇⢠⠹⣿⡇⣿⣦⣬
⣿⣿⣶⣶⡀⢿⣿⠃⠀⠀⠀⠀⠀⠁⠚⠇⠁⠀⠀⠀⠀⠈⠁⠀⠀⢹⣿⡸⣿⣿
    Welcome to lazy Pouiiro   
    www.pouiiro.com   
]]

return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    theme = 'hyper',
    hide = {
      statusline = false,
    },

    config = {
      header = vim.split(logo, '\n'),
      packages = { enable = false },
      -- for doom theme
      -- center = {
      --   { action = 'Telescope file_browser', desc = ' Find File', icon = ' ', key = 'f' },
      --   { action = 'Telescope oldfiles', desc = ' Recent Files', icon = ' ', key = 'r' },
      --   { action = 'Telescope live_grep', desc = ' Find Text', icon = ' ', key = 'g' },
      --   { action = 'Lazy', desc = ' Lazy', icon = '󰒲 ', key = 'l' },
      --   {
      --     action = function()
      --       vim.api.nvim_input '<cmd>qa<cr>'
      --     end,
      --     desc = ' Quit',
      --     icon = ' ',
      --     key = 'q',
      --   },
      -- },
      footer = function()
        local stats = require('lazy').stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        return { ' 󰄛 Lazy Pouiiro~ loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms' }
      end,
      shortcut = {
        { desc = '[ Pouiiro]', group = '@property' },
        { desc = '[󰚰 Update]', icon_hl = '@variable', group = 'Label', action = 'Lazy update', key = 'u' },
        {
          icon = ' ',
          icon_hl = '@variable',
          desc = 'Files',
          group = 'Label',
          action = 'Telescope find_files',
          key = 'f',
        },
        { action = 'Telescope oldfiles', desc = 'Recent Files', icon = ' ', key = 'r' },
        { action = 'Lazy', desc = ' Lazy', icon = '󰒲 ', key = 'l' },
      },
    },
  },
}
