-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local tsbuiltin = require("telescope.builtin")
local bdelete = require("bufdelete")

-- keymap.set({ "n", "i", "x", "v" }, "<C-s>", "<cmd>wa<cr><cmd>:stopinsert<cr>", opts)
keymap.set("n", "<tab>", "<cmd>bnext<cr>", opts)
keymap.set("n", "<s-tab>", "<cmd>bprev<cr>", opts)
keymap.set("n", "gä", vim.diagnostic.goto_next)
keymap.set("n", "gö", vim.diagnostic.goto_prev)

keymap.set("n", "<C-k>", function()
  bdelete.bufdelete()
end, opts)

keymap.set("n", "<leader>b", function()
  tsbuiltin.buffers({
    sort_mru = true,
    ignore_current_buffer = true,
  })
end, opts)

-- Movement in insert mode
keymap.set("i", "<C-e>", "<C-o>A")
keymap.set("i", "<C-i>", "<C-o>I")

--- line movement
keymap.set("n", "<C-å>", function()
  require("mini.move").move_line("up")
end)
keymap.set("n", "<C-ö>", function()
  require("mini.move").move_line("left")
end)
keymap.set("n", "<C-'>", function()
  require("mini.move").move_line("right")
end)
keymap.set("n", "<C-ä>", function()
  require("mini.move").move_line("down")
end)

-- selection movement
keymap.set("v", "<C-å>", function()
  require("mini.move").move_selection("up")
end)
keymap.set("v", "<C-ö>", function()
  require("mini.move").move_selection("left")
end)
keymap.set("v", "<C-'>", function()
  require("mini.move").move_selection("right")
end)
keymap.set("v", "<C-ä>", function()
  require("mini.move").move_selection("down")
end)

-- Delete a word backwards
keymap.set("n", "dw", "vb_d")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
keymap.set("n", "sc", "<C-w>q", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Replace words occurance
keymap.set("n", "<leader>cr", ":%s/<C-r><C-w>", { noremap = true, silent = true, desc = "Replace" })

-- Delete words occurance
keymap.set("n", "<leader>cd", ":%s/<C-r><C-w>//g<cr>", { noremap = true, silent = true, desc = "Delete all words" })

-- Delete inner tag
keymap.set("n", "di", "dit<cr>")

keymap.set(
  "n",
  "<leader>ty",
  ":ToggleTerm2 name=Pouiiro<cr>",
  { silent = true, noremap = true, desc = "Normal terminal" }
)

keymap.set("n", "<leader>ta", ":ToggleTermToggleAll<cr>", { silent = true, noremap = true, desc = "Toggle all" })

keymap.set("n", "<leader><ESC>", "<C-\\><C-n>", { noremap = true })

-- Typescript
keymap.set(
  "n",
  "<C-t>",
  ":Lspsaga peek_type_definition<cr>",
  { noremap = true, silent = true, desc = "Peek to type definition" }
)

keymap.set("n", "<C-d>", ":Lspsaga peek_definition<cr>", { noremap = true, silent = true, desc = "Peek to definition" })
keymap.set("n", "<C-f>", ":Lspsaga code_action<cr>", { noremap = true, silent = true, desc = "Code actions" })
keymap.set("n", "<C-i>", ":Lspsaga finder<cr>", { noremap = true, silent = true, desc = "Find implementations" })
keymap.set("n", "<C-h>", ":Lspsaga hover_doc<cr>", { noremap = true, silent = true, desc = "Hover definition" })
keymap.set("n", "<C-o>", ":Lspsaga outline<cr>", { noremap = true, silent = true, desc = "Outline of current buffer" })
keymap.set("n", "<C-n>", ":Lspsaga rename<cr>", { noremap = true, silent = true, desc = "Rename instances" })
