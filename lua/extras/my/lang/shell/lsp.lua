return {
  'neovim/nvim-lspconfig',
  opts = {
    servers = {
      bashls = {
        -- disables lsp in .env files
        on_attach = function(client, bufnr)
          local filename = vim.api.nvim_buf_get_name(bufnr)
          if filename:match('%.env.*') then client.stop() end
        end,
      },
    },
  },
}
