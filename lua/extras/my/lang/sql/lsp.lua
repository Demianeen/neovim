return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        sqls = {
          on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
            require('sqls').on_attach(client, bufnr)
          end,
        },
      },
    },
  },
}
