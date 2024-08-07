return {
  'akinsho/toggleterm.nvim',
  keys = function(_, keys)
    keys = keys or {}

    -- open n terminals
    for i = 1, 9 do
      vim.list_extend(keys, {
        {
          'g' .. i .. '<c-\\>',
          function()
            for j = 1, i do
              vim.schedule(function()
                vim.cmd(j .. 'ToggleTerm')
              end)
            end
          end,
        },
      })
    end

    -- toggle all terminals
    vim.list_extend(keys, {
      {
        '0<c-\\>',
        function()
          require('toggleterm').toggle_all()
        end,
      },
    })

    return keys
  end,
}
