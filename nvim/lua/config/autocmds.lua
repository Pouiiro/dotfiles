-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.cmd([[
autocmd VimResized * wincmd =
" colorscheme tokyonight-night
" colorscheme rose-pine-moon
" colorscheme catppuccin-mocha
" hi DashboardHeader guifg=#fff
" hi DashboardFooter guifg=#e0af68
]])
