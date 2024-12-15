return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  build = function()
    vim.fn['mkdp#util#install']()
  end,
  keys = {
    {
      '<leader>NP',
      ft = 'markdown',
      '<cmd>MarkdownPreviewToggle<cr>',
      desc = 'Markdown Preview',
    },
  },
  config = function()
    vim.cmd([[do FileType]])
  end,
}
