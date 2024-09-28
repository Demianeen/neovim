return {
  'hrsh7th/nvim-cmp',
  dependencies = { 'LazyVim/LazyVim', 'onsails/lspkind.nvim' },
  opts = function(_, opts)
    local cmp = require('cmp')

    opts.formatting = {
      fields = {
        cmp.ItemField.Kind,
        cmp.ItemField.Abbr,
        cmp.ItemField.Menu,
      },
      format = function(entry, item)
        local color_item =
          require('nvim-highlight-colors').format(entry, { kind = item.kind })
        item = require('lspkind').cmp_format({
          mode = 'symbol',
          maxwidth = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 50,
          symbol_map = LazyVim.config.icons.kinds,
          ellipsis_char = LazyVim.config.icons.misc.dots,
        })(entry, item)

        if color_item.abbr_hl_group then
          item.kind_hl_group = color_item.abbr_hl_group
          item.kind = color_item.abbr
        end
        return item
      end,
    }

    return opts
  end,
}
