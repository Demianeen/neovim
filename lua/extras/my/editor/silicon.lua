return {
  'michaelrommel/nvim-silicon',
  keys = {
    {
      '<leader>cy',
      function()
        require('nvim-silicon').clip()
      end,
      desc = 'Screen code',
      mode = { 'n', 'v' },
      silent = true,
    },
  },
  opts = {
    background = '#e79572',
  },
  config = function(_, opts)
    require('nvim-silicon').setup(opts)
  end,
}
