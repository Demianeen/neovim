return {
  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    dependencies = {
      'folke/snacks.nvim',
      { 'zbirenbaum/copilot.lua', opts = {} },
    },
    opts = {
      ---@alias AvanteProvider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
      provider = 'copilot',
      cursor_applying_provider = 'groq',
      copilot = {
        model = 'claude-3.7-sonnet',
        temperature = 0,
        max_tokens = 8192,
        hints = { enabled = false },
      },
      hints = { enabled = false },
      vendors = {
        groq = { -- define groq provider
          __inherited_from = 'openai',
          api_key_name = 'GROQ_API_KEY',
          endpoint = 'https://api.groq.com/openai/v1/',
          model = 'llama-3.3-70b-versatile',
          max_tokens = 32768,
        },
      },

      -- File selector configuration
      --- @alias FileSelectorProvider "native" | "fzf" | "mini.pick" | "snacks" | "telescope" | string
      file_selector = {
        provider = 'snacks',
        provider_opts = {},
      },
      behaviour = {
        -- auto_suggestions = true,
        enable_cursor_planning_mode = true,
      },
    },
    build = LazyVim.is_win()
        and 'powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false'
      or 'make',
  },
  {
    'saghen/blink.cmp',
    lazy = true,
    dependencies = { 'saghen/blink.compat' },
    opts = {
      sources = {
        default = { 'avante_commands', 'avante_mentions', 'avante_files' },
        compat = {
          'avante_commands',
          'avante_mentions',
          'avante_files',
        },
        -- LSP score_offset is typically 60
        providers = {
          avante_commands = {
            name = 'avante_commands',
            module = 'blink.compat.source',
            score_offset = 90,
            opts = {},
          },
          avante_files = {
            name = 'avante_files',
            module = 'blink.compat.source',
            score_offset = 100,
            opts = {},
          },
          avante_mentions = {
            name = 'avante_mentions',
            module = 'blink.compat.source',
            score_offset = 1000,
            opts = {},
          },
        },
      },
    },
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    optional = true,
    ft = function(_, ft)
      vim.list_extend(ft, { 'Avante' })
    end,
    opts = function(_, opts)
      opts.file_types = vim.list_extend(opts.file_types or {}, { 'Avante' })
    end,
  },
  {
    'folke/which-key.nvim',
    optional = true,
    opts = {
      spec = {
        { '<leader>a', group = 'ai' },
      },
    },
  },
}
