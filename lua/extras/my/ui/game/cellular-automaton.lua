return {
  {
    'Eandrju/cellular-automaton.nvim',
    keys = {
      {
        '<leader>uGl',
        ':CellularAutomaton make_it_rain<CR>',
        desc = 'Make it rain',
      },
      {
        '<leader>uGg',
        ':CellularAutomaton game_of_life<CR>',
        desc = 'Game of life',
      },
    },
  },
  {
    'folke/which-key.nvim',
    opts = function(_, _)
      local wk = require('which-key')
      wk.add({
        { '<leader>uG', group = 'Cellular Automation' },
      })
    end,
  },
}
