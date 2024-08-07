return {
  'ruifm/gitlinker.nvim',
  keys = {
    { '<leader>gy', desc = 'Generate permalink', mode = { 'n', 'v' } },
    {
      '<leader>gY',
      function()
        require('gitlinker').get_repo_url()
      end,
      desc = 'Copy repo url',
    },
    {
      '<leader>gb',
      function()
        require('gitlinker').get_repo_url({
          action_callback = require('gitlinker.actions').open_in_browser,
        })
      end,
      desc = 'Open repo in browser',
    },
  },
  dependencies = { { 'nvim-lua/plenary.nvim' } },
  opts = {
    -- default mapping to call url generation with action_callback
    mappings = '<leader>gy',
  },
}
