return {
  'echasnovski/mini.move',
  config = function()
    require('mini.move').setup()
    local keymap = vim.keymap

    -- Line movement
    keymap.set('n', '<M-Up>', function()
      require('mini.move').move_line 'up'
    end)
    keymap.set('n', '<M-Left>', function()
      require('mini.move').move_line 'left'
    end)
    keymap.set('n', '<M-Right>', function()
      require('mini.move').move_line 'right'
    end)
    keymap.set('n', '<M-Down>', function()
      require('mini.move').move_line 'down'
    end)

    -- selection movement
    keymap.set('v', '<C-å>', function()
      require('mini.move').move_selection 'up'
    end)
    keymap.set('v', '<C-ö>', function()
      require('mini.move').move_selection 'left'
    end)
    keymap.set('v', "<C-'>", function()
      require('mini.move').move_selection 'right'
    end)
    keymap.set('v', '<C-ä>', function()
      require('mini.move').move_selection 'down'
    end)
  end,
}
