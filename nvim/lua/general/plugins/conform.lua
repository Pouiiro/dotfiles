local function save_buffer_after_delay(delay)
  vim.defer_fn(function()
    vim.api.nvim_command 'write'
    -- print('Buffer saved after ' .. delay .. ' ms')
  end, delay)
end

return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>ff',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
      {
        '<leader>ci',
        function()
          local bufnr = vim.api.nvim_get_current_buf()
          require('vtsls').commands['remove_unused_imports'](bufnr)
          save_buffer_after_delay(100)
        end,
        mode = '',
        desc = '[i] Remove unused imports',
      },
      {
        '<leader>cv',
        function()
          local bufnr = vim.api.nvim_get_current_buf()
          require('vtsls').commands['remove_unused'](bufnr)
          save_buffer_after_delay(100)
        end,
        mode = '',
        desc = '[v] Remove unused variables',
      },
      {
        '<leader>cm',
        function()
          local bufnr = vim.api.nvim_get_current_buf()
          require('vtsls').commands['add_missing_imports'](bufnr)
          save_buffer_after_delay(100)
        end,
        mode = '',
        desc = '[m] Add missing imports',
      },
    },
    opts = {
      format_on_save = function(bufnr)
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { 'biome', 'prettierd', stop_after_first = true },
        typescript = { 'biome', 'prettierd', stop_after_first = true },
        javascriptreact = { 'biome', 'prettierd', stop_after_first = true },
        typescriptreact = { 'biome', 'prettierd', stop_after_first = true },
        css = { 'biome', 'prettierd', stop_after_first = true },
        html = { 'biome', 'prettierd', stop_after_first = true },
        json = { 'biome', 'prettierd', stop_after_first = true },
        yaml = { 'biome', 'prettierd', stop_after_first = true },
        markdown = { 'biome', 'prettierd', stop_after_first = true },
        graphql = { 'biome', 'prettierd', stop_after_first = true },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
