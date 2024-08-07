local function show_hidden()
  local action_state = require('telescope.actions.state')
  local line = action_state.get_current_line()
  require('lazyvim.util').telescope(
    'find_files',
    { hidden = true, default_text = line }
  )()
end

return {
  'nvim-telescope/telescope.nvim',
  keys = {
    {
      '<leader>sp',
      function()
        require('telescope.builtin').find_files({
          cwd = require('lazy.core.config').options.root,
          prompt_title = 'Find in plugins',
        })
      end,
      desc = 'Find Plugin File',
    },
    {
      '<leader>fc',
      false,
    },
  },
  opts = {
    defaults = {
      mappings = {
        i = {
          ['<c-h>'] = show_hidden,
        },
      },
      path_display = { 'truncate' },
    },
  },
  dependencies = {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    config = function()
      require('telescope').load_extension('fzf')
    end,
  },
}
