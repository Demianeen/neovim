local function override_lazyvim_toggle_diagnostic()
  local toggle_diagnostic = LazyVim.toggle.diagnostics

  LazyVim.toggle.diagnostics = function()
    if LazyVim.has('tiny-inline-diagnostic.nvim') then
      if vim.diagnostic.is_enabled() then
        require('tiny-inline-diagnostic').disable()
      else
        require('tiny-inline-diagnostic').enable()
      end
    end

    toggle_diagnostic()
  end
end

return {
  {
    'LazyVim/LazyVim',
    opts = override_lazyvim_toggle_diagnostic,
  },
  {
    'neovim/nvim-lspconfig',
    opts = {
      inlay_hints = { enabled = false },
      diagnostics = {
        underline = false,
        virtual_text = { spacing = 0, prefix = '▎', suffix = ' ' },
      },
    },
  },

  {
    'rachartier/tiny-inline-diagnostic.nvim',
    event = 'VeryLazy',
    dependencies = {
      'neovim/nvim-lspconfig',
      opts = { diagnostics = { virtual_text = false } },
    },

    opts = {
      signs = {
        left = ' ',
        right = '',
        diag = ' ',
        arrow = ' ',
        up_arrow = ' ',
        vertical = ' │',
        vertical_end = ' ╰',
      },
      options = { virt_texts = { priority = 4100 } },
      blend = { factor = 0.55 },
    },
  },

  {
    'Wansmer/symbol-usage.nvim',
    event = 'BufReadPre',
    opts = function(_, opts)
      opts.vt_position = 'end_of_line'
      opts.request_pending_text = 'symbol'
      opts.hl = { link = 'GitSignsCurrentLineBlame' }
      opts.text_format = function(symbol)
        local text =
          require('symbol-usage.options')._default_opts.text_format(symbol)

        return '󰌹 ' .. text
      end
    end,
  },
}
