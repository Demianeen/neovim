return {
  {
    'saghen/blink.cmp',
    opts = {
      sources = {
        providers = {
          -- bump snippet score a bit
          snippets = {
            name = 'Snippets',
            module = 'blink.cmp.sources.snippets',
            score_offset = -2, -- default is -3
          },
          -- remove constants from autocomplete (if, else, while, etc.)
          lsp = {
            name = 'LSP',
            module = 'blink.cmp.sources.lsp',
            transform_items = function(_, items)
              return vim.tbl_filter(function(item)
                return item.kind ~= vim.lsp.protocol.CompletionItemKind.Keyword
              end, items)
            end,
          },
        },
      },
    },
  },
}
