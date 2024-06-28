local git_blame = require("gitblame")

local function getBlame()
  if git_blame.get_current_blame_text() == nil then
    return [[LazyPouiiro Zzz]]
  end
  return git_blame.get_current_blame_text()
end

local function getEncoding()
  local ret, _ = (vim.bo.fenc or vim.go.enc):gsub("^utf%-8$", "")
  return ret
end

require("lualine").setup({
  options = {
    theme = {
      inactive = {
        a = { fg = "#727169", bg = "#16161D", gui = "bold" },
        b = { fg = "#727169", bg = "#16161D" },
        c = { fg = "#727169", bg = nil },
      },
      visual = {
        a = { fg = "#16161d", bg = "#ffa066", gui = "bold" },
        b = { fg = "#727169", bg = "#16161D" },
        c = { fg = "#727169", bg = nil },
      },
      replace = {
        a = { fg = "#29161d", bg = "#e46876", gui = "bold" },
        b = { fg = "#727169", bg = "#16161D" },
        c = { fg = "#727169", bg = nil },
      },
      normal = {
        a = { fg = "#16161d", bg = "#7e9cd8", gui = "bold" },
        b = { fg = "#fff", bg = "#16161D" },
        c = { fg = "#fff", bg = nil },
      },
      insert = {
        a = { fg = "#16161d", bg = "#98bb6c", gui = "bold" },
        b = { fg = "#727169", bg = "#16161D" },
        c = { fg = "#727169", bg = nil },
      },
      command = {
        a = { fg = "#16161d", bg = "#e6c384", gui = "bold" },
        b = { fg = "#727169", bg = "#16161D" },
        c = { fg = "#727169", bg = nil },
      },
    },
    component_separators = { left = " ", right = " " },
    section_separators = { left = " ", right = " " },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { { getBlame, cond = git_blame.is_blame_text_available } },
    lualine_x = {
      { os.date("%a, %b | %I:%M %p") },
      {
        getEncoding,
      },
    },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
})
