return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  keys = {
    {
      '<leader>H',
      function()
        require('harpoon'):list():add()
      end,
      desc = 'Harpoon file',
    },
    {
      '<leader>h',
      function()
        local harpoon = require('harpoon')
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = 'Harpoon quick menu',
    },
    {
      '<leader>1',
      function()
        require('harpoon'):list():select(1)
      end,
      desc = 'Harpoon to file 1',
    },
    {
      '<leader>2',
      function()
        require('harpoon'):list():select(2)
      end,
      desc = 'Harpoon to file 2',
    },
    {
      '<leader>3',
      function()
        require('harpoon'):list():select(3)
      end,
      desc = 'Harpoon to file 3',
    },
    {
      '<leader>4',
      function()
        require('harpoon'):list():select(4)
      end,
      desc = 'Harpoon to file 4',
    },
    {
      '<leader>5',
      function()
        require('harpoon'):list():select(5)
      end,
      desc = 'Harpoon to file 5',
    },
  },
  opts = {
    settings = {
      save_on_toggle = true,
      -- key = function()
      --   return 'global'
      -- end,
    },
  },
  config = function(_, opts)
    local harpoon = require('harpoon')

    harpoon:setup(opts)
  end,
}
