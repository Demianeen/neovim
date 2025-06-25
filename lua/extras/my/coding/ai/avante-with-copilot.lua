return {
  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    dependencies = {
      'folke/snacks.nvim',
    },
    opts = {
      provider = 'claude-3.7',

      providers = {
        ['claude-3.7'] = {
          __inherited_from = 'copilot',
          display_name = 'copilot/claude-3.7',
          model = 'claude-3.7-sonnet',
        },
        ['claude-3.5'] = {
          __inherited_from = 'copilot',
          display_name = 'copilot/claude-3.5',
          model = 'claude-3.5-sonnet',
        },
        ['gpt-o3-mini'] = {
          __inherited_from = 'copilot',
          display_name = 'copilot/gpt-o3-mini',
          model = 'gpt-o3-mini',
        },
      },
    },
  },
}
