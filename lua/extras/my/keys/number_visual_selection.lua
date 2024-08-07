return {
  'LazyVim/LazyVim',
  keys = {
    {
      '<leader>nn',
      function()
        -- Get the start and end of the visual selection
        local start_line, _, end_line, _ = unpack(vim.fn.getpos("'<"), 2, 5)

        -- Iterate through the selected lines
        for i = start_line, end_line do
          -- Generate the new line text with the line number prefix
          local new_line_text = tostring(i - start_line + 1)
            .. '. '
            .. vim.fn.getline(i)
          -- Replace the line with the new text
          vim.fn.setline(i, new_line_text)
        end
      end,
      desc = 'Number visual selection',
      mode = { 'v' },
    },
  },
}
