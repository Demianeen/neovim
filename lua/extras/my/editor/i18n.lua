return {
  'nabekou29/js-i18n.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'neovim/nvim-lspconfig',
    'nvim-treesitter/nvim-treesitter',
    'nvim-lua/plenary.nvim',
  },
  keys = {
    { '<leader>ct', '<cmd>I18nEditTranslation<cr>', desc = 'Edit Translation' },
  },
  opts = function()
    local i18n_config = require('js-i18n.config')

    Snacks.toggle
      .new({
        name = 'I18n virtual text',
        get = function()
          return i18n_config.config.virt_text.enabled
        end,
        set = function()
          vim.cmd('I18nVirtualTextToggle')
        end,
      })
      :map('<leader>ut')

    return {
      primary_language = { 'en' },
      virt_text = {
        conceal_key = true,
      },
      diagnostic = {
        enabled = false,
      },
    }
  end,
}
