return {
  'echasnovski/mini.move',
  keys = {
    -- to override lazyvim keymaps
    {
      'H',
      function()
        require('mini.move').move_line('left')
      end,
    },
    {
      'L',
      function()
        require('mini.move').move_line('right')
      end,
    },
    {
      'H',
      mode = 'x',
    },
    {
      'J',
      mode = 'x',
    },
    {
      'K',
      mode = 'x',
    },
    {
      'L',
      mode = 'x',
    },
  },
  opts = {
    mappings = {
      -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
      left = 'H',
      right = 'L',
      down = 'J',
      up = 'K',

      -- Move current line in Normal mode
      line_left = '',
      line_right = '',
      line_down = '',
      line_up = '',
    },
  },
}
