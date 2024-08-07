return {
  'LazyVim/LazyVim',
  keys = {
    {
      '<c-y>',
      '<cmd>lua vim.fn.setreg("+", vim.fn.getcmdline())<CR>',
      desc = 'Copy cmd line',
      mode = 'c',
    },
  },
}
