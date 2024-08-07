return {
  'LazyVim/LazyVim',
  keys = {
    {
      '<leader>p',
      '"_dP',
      desc = 'Paste and delete without yanking',
      mode = { 'x' },
    },
    { 'x', '"_x', desc = 'Delete char without yanking' },
    { 'X', '"_x', desc = 'Delete char backwards without yanking' },
    {
      '<leader>D',
      [["_d]],
      desc = 'Delete without yanking',
      mode = { 'n', 'v' },
    },
  },
}
