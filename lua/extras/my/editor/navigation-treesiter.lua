return {
  'nvim-treesitter/nvim-treesitter-context',
  enabled = false,

  opts = {
    on_attach = function(buf)
      local ft = vim.api.nvim_get_option_value('filetype', { buf = buf })

      if ft == '' or ft == 'svelte' then return false end

      return true
    end,
  },
  keys = {
    { '[x', [[<cmd>lua require("treesitter-context").go_to_context()<cr>]] },
  },
}
