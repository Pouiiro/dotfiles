return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },
  { import = "lazyvim.plugins.extras.lang.json" },
  {
    "rcarriga/nvim-notify",
    config = function(_, opts)
      require("notify").setup(vim.tbl_extend("keep", {
        -- other stuff
        background_colour = "#301934",
      }, opts))
    end,
    opts = {
      background_colour = "#301934",
      options = {
        background_colour = "#301934",
      },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "p00f/nvim-ts-rainbow",
  },
  { "nvim-telescope/telescope-media-files.nvim" },
  { "nvim-telescope/telescope-ui-select.nvim" },
}
