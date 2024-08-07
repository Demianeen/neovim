return {
  'jbyuki/one-small-step-for-vimkind',
  keys = {
    {
      '<leader>dL',
      function()
        require('osv').launch({ port = 8086 })
      end,
      desc = 'Run lua debugger',
    },
  },
}
