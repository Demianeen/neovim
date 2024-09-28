return {
  'mikavilpas/yazi.nvim',
  event = 'VeryLazy',
  keys = {
    { '<leader>fy', '<cmd>Yazi<CR>', desc = 'Open yazi at the current file' },
    {
      '<leader>fY',
      '<cmd>Yazi toggle<CR>',
      desc = 'Resume the last yazi session',
    },
  },
  opts = {
    open_for_directories = true,
    keymaps = {
      show_help = '<c-h>',
    },
    integrations = {
      resolve_relative_path_application = 'realpath',
    },
  },
}
