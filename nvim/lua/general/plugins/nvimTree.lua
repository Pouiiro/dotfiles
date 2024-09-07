return {
  'nvim-tree/nvim-tree.lua',
  opts = {
    filters = {
      dotfiles = true,
      git_ignored = false,
    },
    view = {
      width = 35,
      signcolumn = 'no',
    },
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = true,
    },
    sort = {
      sorter = 'case_sensitive',
    },
  },
}
