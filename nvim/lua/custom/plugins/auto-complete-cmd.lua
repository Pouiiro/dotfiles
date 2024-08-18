return {
  'smolck/command-completion.nvim',
  config = function()
    require('command-completion').setup {
      border = nil, -- What kind of border to use, passed through directly to `nvim_open_win()`,
      -- see `:help nvim_open_win()` for available options (e.g. 'single', 'double', etc.)
      max_col_num = 4, -- Maximum number of columns to display in the completion window
      min_col_width = 20, -- Minimum width of completion window columns
      use_matchfuzzy = true, -- Whether or not to use `matchfuzzy()` (see `:help matchfuzzy()`)
      -- to order completion results
      highlight_selection = true, -- Whether or not to highlight the currently
      -- selected item, not sure why this is an option tbh
      highlight_directories = true, -- Whether or not to higlight directories with
      -- the Directory highlight group (`:help hl-Directory`)
      tab_completion = true, -- Whether or not tab completion on displayed items is enabled
    }
  end,
}
