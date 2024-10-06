return {
  'lukas-reineke/indent-blankline.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  main = 'ibl',

  config = function()
    require('ibl').setup {
      indent = {
        char = '│',
        tab_char = '│',
      },
      scope = {
        enabled = true,
        show_start = false, -- Show the start of the context (indentation)
        show_end = false, -- Disable the end of the context
      },
    }
  end,
}
