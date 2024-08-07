return {
  {
    'williamboman/mason.nvim',
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        'proselint',
        'write-good',
        'alex',
      })
    end,
  },
  {
    'mfussenegger/nvim-lint',
    opts = {
      linters_by_ft = {
        markdown = { 'proselint', 'write_good', 'alex' },
      },
    },
  },
}
