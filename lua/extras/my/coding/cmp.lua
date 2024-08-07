return {
  {
    'hrsh7th/nvim-cmp',
    opts = function(_, opts)
      local cmp = require('cmp')

      opts.window = {
        documentation = {
          winhighlight = 'FloatBorder:CmpDocFloat,NormalFloat:CmpDocFloat',
          border = { '', '', '', ' ', '', '', '', ' ' },
        },
      }

      opts.enabled = function()
        -- '' for normal buffers
        -- 'acwrite' for buffers with autocommands that write to a file
        -- 'help' for help buffers
        -- 'prompt' for buffers used in command-line or search prompt windows.
        local buftype = vim.api.nvim_get_option_value('buftype', { buf = 0 })

        -- no autocompletion in vim prompts
        if buftype == 'prompt' then return false end

        local context = require('cmp.config.context')

        -- no autocompletion in comments
        return not context.in_treesitter_capture('comment')
          and not context.in_syntax_group('Comment')
      end

      opts.sources = cmp.config.sources({
        {
          name = 'nvim_lsp',
          -- removes all keywords autocompletion (def, const, export)
          entry_filter = function(entry, _)
            return require('cmp.types').lsp.CompletionItemKind[entry:get_kind()]
              ~= 'Keyword'
          end,
        },
      }, {
        { name = 'nvim_lua' },
        { name = 'path' },
        { name = 'buffer', keyword_length = 3 },
      })
    end,
  },
}
