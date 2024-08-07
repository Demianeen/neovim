return {
  'LazyVim/LazyVim',
  keys = {
    {
      '<leader>D',
      function()
        LazyVim.terminal('lazydocker', { esc_esc = false, ctrl_hjkl = false })
      end,
      desc = 'Lazydocker',
    },
  },
}
