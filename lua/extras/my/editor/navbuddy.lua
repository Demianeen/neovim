return {
  {
    'SmiteshP/nvim-navbuddy',
    keys = {
      { '<c-s>', ':Navbuddy<CR>', desc = 'Navigation' },
    },
    opts = {
      lsp = { auto_attach = true },
      icons = require('lazyvim.config').icons.kinds,
    },
    dependencies = {
      'SmiteshP/nvim-navic',
      'neovim/nvim-lspconfig',
      'MunifTanjim/nui.nvim',
      'nvim-telescope/telescope.nvim',
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    optional = true,
    opts = function(_, opts)
      table.insert(opts.sections.lualine_c, {
        function()
          return require('nvim-navic').get_location()
        end,
        cond = function()
          return package.loaded['nvim-navic']
            and require('nvim-navic').is_available()
        end,
      })
    end,
  },
}
