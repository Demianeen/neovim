return {
  'debugloop/telescope-undo.nvim',
  keys = {
    { -- lazy style key map
      '<leader>fu',
      '<cmd>Telescope undo<cr>',
      desc = 'Undo history',
    },
  },
  opts = {
    extensions = {
      undo = {
        -- telescope-undo.nvim config, see below
      },
    },
  },
  config = function(_, opts)
    LazyVim.on_load('telescope.nvim', function()
      require('telescope').load_extension('undo')
    end)
  end,
}
