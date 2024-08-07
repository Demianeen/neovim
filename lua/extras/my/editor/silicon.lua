return {
  'krivahtoo/silicon.nvim',
  build = './install.sh build',
  keys = {
    {
      '<leader>cy',
      ':Silicon<CR>',
      desc = 'Screen code',
      mode = { 'n', 'v' },
      silent = true,
    },
  },
  opts = {
    output = {
      clipboard = true,
    },
    line_number = true,
    background = '#e79572',
  },
}
