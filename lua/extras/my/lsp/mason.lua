return {
  'williamboman/mason.nvim',
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed, {
      'yaml-language-server',
      'hadolint',
      'css-lsp',
    })
  end,
}
