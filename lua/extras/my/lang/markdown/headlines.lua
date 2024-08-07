return {
  'lukas-reineke/headlines.nvim',
  dependencies = 'nvim-treesitter/nvim-treesitter',
  ft = { 'markdown', 'norg', 'rmd', 'org' },
  config = function(_, opts)
    -- PERF: schedule to prevent headlines slowing down opening a file
    vim.schedule(function()
      require('headlines').setup(opts)
      require('headlines').refresh()
    end)
  end,
  opts = {
    markdown = {
      fat_headline_lower_string = '▔',
    },
  },
}
