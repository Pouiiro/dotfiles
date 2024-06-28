return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
    { "nvim-telescope/telescope-symbols.nvim" },
    {
      "nvim-telescope/telescope-smart-history.nvim",
      dependencies = "kkharji/sqlite.lua",
    },
  },
  opts = {
    defaults = {
      theme = "center",
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0,
      prompt_prefix = "  ",
      selection_caret = "  ",
      path_display = { "smart" },
      history = {
        path = vim.env.HOME .. "/.local/share/nvim/telescope_history.sqlite3",
        limit = 100,
      },
      dynamic_preview_title = true,
    },
    extensions = {
      file_browser = {
        -- theme = "ivy",
        grouped = true,
        hijack_netrw = true,
        previewer = true,
        initial_browser = "tree",
        auto_depth = true,
        depth = 1,
      },
      fzf = {
        fuzzy = false, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      },
      media_files = {
        -- filetypes whitelist
        -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
        filetypes = { "png", "webp", "jpg", "jpeg", "webm", "pdf", "mp4" },
        find_cmd = "rg", -- find command (defaults to `fd`)
      },
      ["ui-select"] = {
        require("telescope.themes").get_dropdown({
          previewer = false,
          -- even more opts
        }),
      },
    },
  },
  keys = {
    {
      "<leader>fP",
      function()
        require("telescope.builtin").find_files({
          cwd = require("lazy.core.config").options.root,
        })
      end,
      desc = "Find Plugin File",
    },
    {
      ";f",
      function()
        local builtin = require("telescope.builtin")
        builtin.find_files({
          no_ignore = false,
          hidden = true,
        })
      end,
      desc = "Lists files in your current working directory, respects .gitignore",
    },
    {
      ";r",
      function()
        local builtin = require("telescope.builtin")
        builtin.live_grep({
          additional_args = { "--hidden" },
        })
      end,
      desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore",
    },
    {
      "<leader>be",
      function()
        local builtin = require("telescope.builtin")
        builtin.buffers()
      end,
      desc = "Lists open buffers",
    },
    {
      ";t",
      function()
        local builtin = require("telescope.builtin")
        builtin.help_tags()
      end,
      desc = "Lists available help tags and opens a new window with the relevant help info on <cr>",
    },
    {
      ";;",
      function()
        local builtin = require("telescope.builtin")
        builtin.resume()
      end,
      desc = "Resume the previous telescope picker",
    },
    {
      ";e",
      function()
        local builtin = require("telescope.builtin")
        builtin.diagnostics()
      end,
      desc = "Lists Diagnostics for all open buffers or a specific buffer",
    },
    {
      ";s",
      function()
        local builtin = require("telescope.builtin")
        builtin.treesitter()
      end,
      desc = "Lists Function names, variables, from Treesitter",
    },
    {
      "sf",
      function()
        local builtin = require("telescope.builtin")
        builtin.find_files()
      end,
    },
    {
      "<leader><leader>",
      function()
        local telescope = require("telescope")

        -- local function telescope_buffer_dir()
        --   return vim.fn.expand("%:p:h")
        -- end

        telescope.extensions.file_browser.file_browser({
          -- path = "%:p:h",
          -- cwd = telescope_buffer_dir(),
          respect_gitignore = true,
          hidden = false,
          grouped = true,
          previewer = true,
          initial_mode = "insert",
          layout_config = { height = 40 },
        })
      end,
      desc = "Open File Browser with the path of the current buffer",
    },
  },
}
