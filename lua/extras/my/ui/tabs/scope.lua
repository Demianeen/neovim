return {
  'tiagovla/scope.nvim',
  event = 'VeryLazy',
  keys = {
    {
      '<leader>bT',
      [[<cmd>lua require("scope.core").move_current_buf({})<cr>]],
      desc = 'Move buffer to different tabpage',
    },
  },
  opts = {},
}
