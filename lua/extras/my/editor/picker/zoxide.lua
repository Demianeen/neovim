return {
  {
    'folke/snacks.nvim',
    opts = {
      picker = {
        ---@type table<string, snacks.picker.Config|{}>
        sources = {
          zoxide = {
            confirm = function(picker, item)
              picker:close()
              if item then
                -- Open a new tab
                vim.cmd('tabnew')
                -- Change this tab's working directory to the zoxide path
                vim.cmd('tcd ' .. item.text)
                Snacks.picker.files()
              end
            end,
          },
        },
      },
    },
    keys = {
      {
        '<leader>sz',
        function()
          Snacks.picker.zoxide()
        end,
        desc = 'Zoxide',
      },
    },
  },
}
