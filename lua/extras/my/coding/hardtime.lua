return {
  'm4xshen/hardtime.nvim',
  event = 'VeryLazy',
  opts = function()
    local hardtime = require('hardtime')

    Snacks.toggle
      .new({
        name = 'Hard time',
        get = function()
          return hardtime.is_plugin_enabled
        end,
        set = function()
          hardtime.toggle()
        end,
      })
      :map('<leader>uH')

    return {
      disabled_keys = {
        -- disable arrow keys in every mode except 'insert'
        ['<Up>'] = { '' },
        ['<Down>'] = { '' },
        ['<Left>'] = { '' },
        ['<Right>'] = { '' },
      },
    }
  end,
}
