return {
  'LazyVim/LazyVim',
  keys = {
    {
      '<leader>cS',
      function()
        local input = vim.fn.input('Enter URL endpoint: ')
        local response =
          vim.fn.system('json2struct -s "$(curl -s \'' .. input .. '\')"')
        local buf = vim.api.nvim_get_current_buf()
        local lines = {}
        for line in response:gmatch('[^\r\n]+') do
          table.insert(lines, line)
        end
        local newLines = {}
        for i = 3, #lines do
          table.insert(newLines, lines[i])
        end
        local current_cursor_line = vim.api.nvim_win_get_cursor(0)[1] - 1
        vim.api.nvim_buf_set_lines(
          buf,
          current_cursor_line,
          current_cursor_line,
          false,
          newLines
        )
      end,
      desc = 'Json to struct',
    },
  },
}
