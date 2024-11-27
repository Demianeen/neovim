return {
  {
    'echasnovski/mini.ai',
    opts = function()
      local ai = require('mini.ai')
      return {
        custom_textobjects = {
          P = ai.gen_spec.treesitter({
            a = '@parameter.outer',
            i = '@parameter.inner',
          }, {}),
          C = ai.gen_spec.treesitter({
            a = '@comment.outer',
            i = '@comment.inner',
          }),
        },
      }
    end,
  },
  {
    'folke/which-key.nvim',
    opts = function(_, _)
      local wk = require('which-key')
      wk.add(
        { 'iC', desc = 'Comment', mode = { 'o', 'o', 'x', 'x' } },
        { 'iP', desc = 'Parameter', mode = { 'o', 'o', 'x', 'x' } }
      )
    end,
  },
}
