return {
  'Wansmer/treesj',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  keys = {
    { '<leader>cj', '<cmd>TSJToggle<cr>', desc = 'Join Toggle' },
  },
  opts = { use_default_keymaps = false },
}
