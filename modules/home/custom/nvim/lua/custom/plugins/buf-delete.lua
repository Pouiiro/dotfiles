return {
  'famiu/bufdelete.nvim',
  config = function()
    local bdelete = require 'bufdelete'
    local keymap = vim.keymap

    keymap.set('n', '<C-k>', function()
      bdelete.bufdelete()
    end, { noremap = true, silent = true })
  end,
}
