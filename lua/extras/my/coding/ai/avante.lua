return {
  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    dependencies = {
      'folke/snacks.nvim',
    },
    opts = {
      ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
      ---@type Provider
      provider = 'gemini',
      cursor_applying_provider = 'groq',
      hints = { enabled = false },
      providers = {
        groq = {
          __inherited_from = 'openai',
          api_key_name = 'GROQ_API_KEY',
          endpoint = 'https://api.groq.com/openai/v1/',
          model = 'llama-3.3-70b-versatile',
          extra_request_body = {
            max_tokens = 32768,
          },
        },
        ['deepseek-coder'] = {
          __inherited_from = 'openai',
          api_key_name = 'DEEPSEEK_API_KEY',
          endpoint = 'https://api.deepseek.com',
          model = 'deepseek-coder',
          extra_request_body = {
            temperature = 0,
          },
        },
        ['deepseek-reasoner'] = {
          __inherited_from = 'openai',
          api_key_name = 'DEEPSEEK_API_KEY',
          endpoint = 'https://api.deepseek.com',
          model = 'deepseek-reasoner',
          disable_tools = true,
          extra_request_body = {
            temperature = 0,
          },
        },
        ['deepseek-chat'] = {
          __inherited_from = 'openai',
          api_key_name = 'DEEPSEEK_API_KEY',
          endpoint = 'https://api.deepseek.com',
          model = 'deepseek-chat',
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
