local wk = require('which-key')
wk.add({ '<leader>fc', group = 'Copy' })

return {
  'LazyVim/LazyVim',
  keys = {
    {
      '<leader>fcr',
      ":call setreg('+', expand('%'))<CR>",
      desc = 'Relative file path',
    },
  },
}
