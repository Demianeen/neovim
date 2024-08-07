return {
  {
    'williamboman/mason.nvim',
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        'sql-formatter',
      })
    end,
  },
  {
    'stevearc/conform.nvim',
    opts = {
      formatters = {
        ['sql_formatter'] = {
          args = { '--language', 'postgresql' },
        },
      },
      formatters_by_ft = {
        sql = { 'sql_formatter' },
      },
    },
  },
}

-- return {
--   {
--     'williamboman/mason.nvim',
--     opts = function(_, opts)
--       vim.list_extend(opts.ensure_installed, {
--         'sqlfluff',
--       })
--     end,
--   },
--   {
--     'mfussenegger/nvim-lint',
--     opts = {
--       linters_by_ft = {
--         sql = { 'sqlfluff' },
--       },
--     },
--   },
--   {
--     'stevearc/conform.nvim',
--     opts = {
--       formatters = {
--         sqlfluff = {
--           args = { '--FIX-EVEN-UNPARSABLE' },
--         },
--       },
--       formatters_by_ft = {
--         sql = { 'sqlfluff' },
--       },
--     },
--   },
-- }
