return {
  'ahmedkhalf/project.nvim',
  config = function()
    require('project_nvim').setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }

    require('telescope').load_extension 'projects'

    local project_nvim = require 'project_nvim'
    -- Function to cycle through projects
    local function cycle_projects(direction)
      local projects = project_nvim.get_recent_projects()
      if #projects == 0 then
        return
      end -- No projects to cycle through

      local current_project = vim.fn.getcwd()
      local current_index = 1

      -- Find the current project index
      for i, project in ipairs(projects) do
        if project == current_project then
          current_index = i
          break
        end
      end

      -- Calculate the next project index based on the direction
      local next_index
      if direction == 'next' then
        next_index = (current_index % #projects) + 1
      else
        next_index = (current_index - 2) % #projects + 1
      end

      -- Change to the next project directory
      vim.cmd('cd ' .. projects[next_index])
      -- Optionally, open the NvimTree automatically in the new project
      vim.cmd 'NvimTreeOpen'
    end

    -- Keybindings to cycle through projects
    vim.keymap.set('n', '<C-S-j>', function()
      cycle_projects 'next'
    end)
    vim.keymap.set('n', '<C-S-k>', function()
      cycle_projects 'prev'
    end)

    vim.keymap.set('n', '<C-.>', '<cmd>Telescope projects<cr>')
  end,
}
