return {
  {
    'neovim/nvim-lspconfig',
    opts = function(_, opts)
      vim.list_extend(opts.servers, {
        ['emmet-language-server'] = {},
      })
    end,
  },
  {
    'williamboman/mason.nvim',
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        'emmet-language-server',
      })
    end,
  },
}
