return {
  'f-person/git-blame.nvim',
  event = 'VeryLazy',
  -- Because of the keys part, you will be lazy loading this plugin.
  -- The plugin wil only load once one of the keys is used.
  -- If you want to load the plugin at startup, add something like event = "VeryLazy",
  -- or lazy = false. One of both options will work.
  opts = {
    display_virtual_text = 0,
    message_template = ' <summary> • <author> • <<sha>>',
  },
}
