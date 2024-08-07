return {
  'Wansmer/sibling-swap.nvim',
  keys = {
    { '<c-,>', [[<cmd>lua require('sibling-swap').swap_with_left()<cr>]] },
    { '<c-.>', [[<cmd>lua require('sibling-swap').swap_with_right()<cr>]] },
  },
  dependencies = { 'nvim-treesitter' },
  opts = {
    highlight_node_at_cursor = { ms = 250 },
    use_default_keymaps = false,
  },
}
