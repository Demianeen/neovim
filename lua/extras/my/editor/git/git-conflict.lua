return {
  'akinsho/git-conflict.nvim',
  event = { 'VeryLazy' },
  keys = {
    { '<leader>gx', ':GitConflictListQf<CR>' },
  },
  opts = {
    disable_diagnostics = false,
    list_opener = 'Trouble',
  },
}
