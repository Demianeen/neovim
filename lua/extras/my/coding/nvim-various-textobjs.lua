return {
  'chrisgrieser/nvim-various-textobjs',
  lazy = false,
  keys = {
    {
      'L',
      '<cmd>lua require("various-textobjs").url()<CR>',
      mode = { 'o' },
    },
  },
  opts = {
    useDefaultKeymaps = true,
    disabledKeymaps = { 'L' },
  },
}
