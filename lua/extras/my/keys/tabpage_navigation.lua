local wk = require('which-key')
wk.add({
  '<leader>T',
  group = 'Tabpage',
})
return {
  'LazyVim/LazyVim',
  keys = {
    {
      '<leader>Tp',
      '<cmd>tabp<CR>',
      desc = 'Prev tabpage',
    },
    {
      '<leader>Tn',
      '<cmd>tabn<CR>',
      desc = 'Next tabpage',
    },
    {
      '<leader>Td',
      '<cmd>tabclose<CR>',
      desc = 'Delete tabpage',
    },
  },
}
