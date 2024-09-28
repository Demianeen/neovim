return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      sign_priority = 13,
      current_line_blame = true,
      current_line_blame_opts = { delay = 250 },
      current_line_blame_formatter = ' 󰞗 <author>  <author_time:%R>  <summary>',
      diff_opts = {
        algorithm = 'histogram',
        ignore_whitespace_change = true,
      },
    },
  },
}
