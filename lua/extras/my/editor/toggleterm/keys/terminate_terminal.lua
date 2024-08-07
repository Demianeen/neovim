return {
  'akinsho/toggleterm.nvim',
  opts = function()
    vim.api.nvim_create_autocmd('TermOpen', {
      pattern = 'term://*toggleterm#*',
      callback = function()
        local keymap_opts = require('util.keymaps')

        -- del buffer
        vim.api.nvim_buf_set_keymap(
          0,
          't',
          '<C-q>',
          '<Cmd>lua require("mini.bufremove").delete(0)<CR>',
          keymap_opts('Terminate terminal')
        )
      end,
    })
  end,
}
