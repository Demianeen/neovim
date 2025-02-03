return {
  {
    'folke/snacks.nvim',
    keys = {
      {
        '<leader>fU',
        function()
          Snacks.picker.undo()
        end,
        desc = 'Undo',
      },
    },
  },
}
