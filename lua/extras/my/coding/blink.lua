return {
  {
    'saghen/blink.cmp',
    opts = {
      keymap = {},
    },
  },
  -- remove constants from autocomplete (if, else, while, etc.)
  {
    'saghen/blink.cmp',
    opts = {
      sources = {
        providers = {
          lsp = {
            name = 'LSP',
            module = 'blink.cmp.sources.lsp',
            transform_items = function(_, items)
              return vim.tbl_filter(function(item)
                return item.kind ~= 14
              end, items)
            end,
          },
        },
      },
    },
  },
}
