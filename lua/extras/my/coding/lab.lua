local opts = require('util.keymaps')

-- lazy remap
vim.keymap.set('n', '<leader>cli', ':LspInfo<CR>', opts('Lsp Info'))
vim.keymap.set('n', '<leader>cll', ':LspLog<CR>', opts('Lsp Log'))

return {
  -- 'nvim-cmp',
  -- ---@param opts cmp.ConfigSchema
  -- opts = function(_, opts)
  --   table.insert(opts.sources, 1, {
  --     name = 'lab.quick_data',
  --     keyword_length = 4,
  --   })
  -- end,
  -- dependencies = {
  '0x100101/lab.nvim',
  build = 'cd js && npm ci',
  dependencies = {
    {
      'folke/which-key.nvim',
      opts = function(_, _)
        local wk = require('which-key')
        wk.add({
          { '<leader>L', group = 'Lab' },
          { '<leader>l', group = 'Lsp' },
        })
      end,
    },
  },
  keys = {
    { '<leader>cl', false },
    { '<leader>cLs', ':Lab code stop<CR>', desc = 'Stop', silent = true },
    { '<leader>cLr', ':Lab code run<CR>', desc = 'Run', silent = true },
    { '<leader>cLp', ':Lab code panel<CR>', desc = 'Panel', silent = true },
    { '<leader>cLc', ':Lab code config<CR>', desc = 'Config', silent = true },
  },
  opts = {
    code_runner = {
      enabled = true,
    },
    quick_data = {
      enabled = true,
    },
  },
}
-- }
