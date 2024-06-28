return {
  "mg979/vim-visual-multi",
  branch = "master",
  init = function()
    vim.g.VM_maps = {
      ["Find under"] = "<C-¨>",
      ["Find Subword Under"] = "<C-´",
    }
  end,
  lazy = false,
}
