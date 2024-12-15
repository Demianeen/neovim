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
  -- {
  --   'nvimdev/dashboard-nvim',
  --   optional = true,
  --   opts = function(_, opts)
  --     local projects = {
  --       action = Smart_open_command,
  --       desc = '  Find files',
  --       icon = '',
  --       key = 'f',
  --     }
  --
  --     projects.desc = projects.desc .. string.rep(' ', 43 - #projects.desc)
  --     projects.key_format = '  %s'
  --
  --     -- remove lazyvim config property
  --     for i = #opts.config.center, 1, -1 do
  --       if opts.config.center[i].key == 'f' then
  --         table.remove(opts.config.center, i)
  --       end
  --     end
  --
  --     table.insert(opts.config.center, 1, projects)
  --   end,
  -- },
}
