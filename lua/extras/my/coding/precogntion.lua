return {
  'tris203/precognition.nvim',
  event = 'VeryLazy',
  opts = function()
    local is_on = false
    Snacks.toggle
      .new({
        name = 'Precognition hints',
        get = function()
          return is_on
        end,
        set = function()
          is_on = require('precognition').toggle()
        end,
      })
      :map('<leader>uP')

    return {
      startVisible = false,
    }
  end,
}
