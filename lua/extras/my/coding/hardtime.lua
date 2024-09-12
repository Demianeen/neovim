return {
  'm4xshen/hardtime.nvim',
  event = 'VeryLazy',
  opts = function()
    local hardtime = require('hardtime')

    local toggle = LazyVim.toggle.wrap({
      name = 'Hard time',
      get = function()
        return hardtime.is_plugin_enabled
      end,
      set = function()
        hardtime.toggle()
      end,
    })

    LazyVim.toggle.map('<leader>uH', toggle)

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
