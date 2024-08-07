return {
  'akinsho/toggleterm.nvim',
  event = 'VeryLazy',
  opts = {
    size = function(term)
      if term.direction == 'horizontal' then
        return vim.o.lines * 0.5 -- Take up half of the screen's height
      elseif term.direction == 'vertical' then
        return vim.o.columns * 0.4 -- Keep 40% of the screen's width as is
      end
    end,
    open_mapping = [[<c-\>]],
  },
}
