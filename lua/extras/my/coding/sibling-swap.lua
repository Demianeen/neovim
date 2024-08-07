return {
  'Wansmer/sibling-swap.nvim',
  keys = {
    { '<c-.>', [[<cmd>lua require('sibling-swap').swap_with_right()<cr>]] },
    { '<c-,>', [[<cmd>lua require('sibling-swap').swap_with_left()<cr>]] },
  },
  dependencies = { 'nvim-treesitter' },
  opts = {
    use_default_keymaps = false,
    highlight_node_at_cursor = { ms = 250 },
  },
}
