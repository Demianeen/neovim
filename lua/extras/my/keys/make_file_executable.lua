return {
  'LazyVim/LazyVim',
  keys = {
    {
      '<leader>fx',
      '<cmd>!chmod +x %<CR>',
      desc = 'Make file executable',
    },
    {
      '<leader>fX',
      '<cmd>!chmod -x %<CR>',
      desc = 'Make file NOT executable',
    },
  },
}
