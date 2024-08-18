return {
  'nvimdev/lspsaga.nvim',
  config = function()
    local keymap = vim.keymap

    require('lspsaga').setup {
      symbol_in_winbar = {
        enable = false,
      },
      diagnostic = {
        on_insert = false,
      },
      code_action = {
        show_server_name = true,
      },
    }

    keymap.set({ 'n', 't' }, '<C-->', '<cmd>Lspsaga term_toggle<cr>')
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- optional
    'nvim-tree/nvim-web-devicons', -- optional
  },
}
