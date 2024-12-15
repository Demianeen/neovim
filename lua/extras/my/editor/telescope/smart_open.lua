Smart_open_command = 'Telescope smart_open theme=dropdown previewer=false'

return {
  {
    'danielfalk/smart-open.nvim',
    lazy = false,
    branch = '0.2.x',
    dependencies = {
      'kkharji/sqlite.lua',
      -- lazyvim manages fzf-native build https://www.lazyvim.org/extras/editor/telescope#telescope-fzf-nativenvim
      'nvim-telescope/telescope-fzf-native.nvim',
    },
    config = function()
      LazyVim.on_load('telescope.nvim', function()
        require('telescope').load_extension('smart_open')
      end)
    end,
  },
  {
    'ibhagwan/fzf-lua',
    keys = {
      { '<leader><space>', false },
    },
  },
  -- replace old snacks find files with smart_open
  {
    'folke/snacks.nvim',
    opts = function(_, opts)
      for i = #opts.dashboard.preset.keys, 1, -1 do
        if opts.dashboard.preset.keys[i].key == 'f' then
          table.remove(opts.dashboard.preset.keys, i)
        end
      end

      table.insert(opts.dashboard.preset.keys, 1, {
        icon = ' ',
        key = 'f',
        desc = 'Find File',
        action = ':' .. Smart_open_command,
      })

      return opts
    end,
  },
  -- configure smart_open
  {
    'nvim-telescope/telescope.nvim',
    lazy = false,
    opts = {
      extensions = {
        smart_open = {
          ignore_patterns = {
            '*.git/*',
            '*.temp/*',
            'index.ts',
          },
          match_algorithm = 'fzf',
          -- cwd_only = true,
        },
      },
    },

    keys = {
      {
        '<leader><space>',
        '<cmd>' .. Smart_open_command .. '<cr>',
        desc = 'Find Files (Smart open)',
      },
    },
  },
}
