return {
  'LazyVim/LazyVim',
  keys = {
    {
      '<leader>gB',
      function()
        local word_under_cursor = vim.fn.expand('<cWORD>')
        local github_identifier = word_under_cursor:sub(2, -3)

        vim.notify(github_identifier)
        local url = 'https://github.com/' .. github_identifier
        vim.fn.system('open ' .. url)
      end,
      desc = 'Open plugin in browser',
    },
  },
}
