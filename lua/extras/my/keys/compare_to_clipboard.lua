function Close_diff_buffers()
  local bufnr1 = vim.fn.bufnr('%') -- Get the buffer number of the current window
  vim.cmd('wincmd w') -- Move to the next window
  local bufnr2 = vim.fn.bufnr('%')
  vim.cmd('bd ' .. bufnr1)
  vim.cmd('bd ' .. bufnr2)
end

return {
  'LazyVim/LazyVim',
  keys = {
    {
      '<leader>xC',
      function()
        local ftype = vim.api.nvim_eval('&filetype')
        vim.cmd(string.format(
          [[
    execute "normal! \"xy"
    vsplit
    enew
    normal! P
    setlocal buftype=nowrite
    set filetype=%s
		lua LazyVim.format({ force = true })
		lua vim.bo.buflisted = false
		lua vim.keymap.set("n", "q", "<cmd>lua Close_diff_buffers()<cr>", { buffer = 0, silent = true })
    diffthis
    execute "normal! \<C-w>\<C-w>"
    enew
    set filetype=%s
    normal! "xP
		setlocal buftype=nowrite
    lua LazyVim.format({ force = true })
    lua vim.bo.buflisted = false
    lua vim.keymap.set("n", "q", "<cmd>lua Close_diff_buffers()<cr>", { buffer = 0, silent = true })
    diffthis
  ]],
          ftype,
          ftype
        ))
      end,
      desc = 'Compare to clipboard',
      mode = { 'x' },
    },
  },
}
