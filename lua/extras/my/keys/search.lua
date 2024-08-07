return {
  'LazyVim/LazyVim',
  keys = {
    -- next/previous search result, but centers page and folded code unfolds
    { 'n', 'nzzzv', desc = 'Next search result with centering' },
    {
      'N',
      'Nzzzv',
      desc = 'Previous search result with centering',
    },

    -- turn off search
    {
      '<Esc><Esc>',
      ':noh<CR>',
      desc = 'Turn off search highlight',
    },
  },
}
