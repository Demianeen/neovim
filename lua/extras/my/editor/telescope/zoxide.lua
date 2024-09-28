return {
  {
    'jvgrootveld/telescope-zoxide',
    -- for whatever reason the options does not work if I load it. Otherwise it is working
    config = function()
      LazyVim.on_load('telescope.nvim', function()
        require('telescope').load_extension('zoxide')
      end)
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    opts = {
      extensions = {
        zoxide = {
          mappings = {
            default = {
              action = function(selection)
                vim.cmd('tabnew')
                vim.cmd.tcd(selection.path)
                vim.cmd('setl bufhidden=wipe')
                vim.cmd(Smart_open_command)
              end,
            },
          },
        },
      },
    },

    keys = {
      {
        '<leader>sz',
        [[<cmd>Telescope zoxide list theme=dropdown previewer=false<cr>]],
        desc = 'Zoxide',
      },
    },
  },
}
