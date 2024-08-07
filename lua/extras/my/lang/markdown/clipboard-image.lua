return {
  'dfendr/clipboard-image.nvim',
  keys = {
    { '<leader>np', ':PasteImg<CR>', desc = 'Paste Image' },
  },
  opts = {
    markdown = {
      img_dir = { 'assets', 'img' },
      img_dir_txt = './assets/img',
    },
  },
}
