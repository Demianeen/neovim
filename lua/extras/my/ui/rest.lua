return {
  {
    'vhyrro/luarocks.nvim',
    priority = 1000,
    config = true,
  },
  {
    'rest-nvim/rest.nvim',
    main = 'rest-nvim',
    opts = {
      ui = {
        winbar = true,
        keybinds = {
          prev = 'P',
          next = 'N',
        },
      },
    },
    ft = 'http',
    dependencies = {
      'vhyrro/luarocks.nvim',
      'j-hui/fidget.nvim',
    },
    keys = {
      {
        '<cr>',
        ':Rest run<CR>',
        ft = 'http',
        desc = 'Run request under the cursor',
      },
      {
        '<s-cr>',
        ':Rest run last<CR>',
        ft = 'http',
        desc = 'Re-run latest request',
      },
      {
        '<leader>rr',
        '<cmd>Rest run<cr>',
        'Run request under the cursor',
      },
      { '<leader>rl', '<cmd>Rest run last<cr>', 'Re-run latest request' },
      { '<leader>rL', '<cmd>Rest logs<cr>', 'Logs' },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    optional = true,

    opts = function(_, opts)
      if type(opts.ensure_installed) == 'table' then
        vim.list_extend(opts.ensure_installed, { 'http' })
      end
    end,
  },
  {
    'folke/edgy.nvim',
    opts = function(_, opts)
      vim.list_extend(opts.right, {
        { ft = 'rest_nvim_result', title = 'Rest Results', width = 1.2 },
      })
    end,
  },
}
