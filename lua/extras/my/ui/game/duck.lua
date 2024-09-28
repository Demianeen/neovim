return {
  {
    'tamton-aquib/duck.nvim',
    keys = {
      {
        '<leader>uGdd',
        function()
          require('duck').hatch()
        end,
        desc = 'Hatch a duck',
      },
      {
        '<leader>uGdD',
        function()
          require('duck').hatch()
          require('duck').hatch()
          require('duck').hatch()
          require('duck').hatch()
          require('duck').hatch()
        end,
        desc = 'Hatch ducks',
      },
      {
        '<leader>uGdc',
        function()
          require('duck').cook()
        end,
        desc = 'Cook a duck',
      },
      {
        '<leader>uGda',
        function()
          require('duck').cook_all()
        end,
        desc = 'Cook ’em all',
      },
    },
  },
  {
    'folke/which-key.nvim',
    opts = function(_, _)
      local wk = require('which-key')
      wk.add({
        { '<leader>uGd', group = 'Duck' },
      })
    end,
  },
}
