return {
  {
    'vhyrro/luarocks.nvim',
    priority = 1000,
    config = true,
  },
  {
    'rest-nvim/rest.nvim',
    main = 'rest-nvim',
    opts = {},
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
        'H',
        ':Rest result prev<CR>',
        ft = 'http',
        desc = 'Cycle panes backwards',
      },
      {
        'L',
        ':Rest result next<CR>',
        ft = 'http',
        desc = 'Cycle panes forward',
      },
      {
        '<leader>rr',
        '<cmd>Rest run<cr>',
        'Run request under the cursor',
      },
      { '<leader>rl', '<cmd>Rest run last<cr>', 'Re-run latest request' },
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
}
