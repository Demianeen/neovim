local function region_to_text(region)
  local text = ''
  local maxcol = vim.v.maxcol
  for line, cols in vim.spairs(region) do
    local endcol = cols[2] == maxcol and -1 or cols[2]
    local chunk =
      vim.api.nvim_buf_get_text(0, line, cols[1], line, endcol, {})[1]
    text = ('%s%s\n'):format(text, chunk)
  end
  return text
end

local on_exit = function(obj)
  -- print('code', obj.code)
  -- print('signal', obj.signal)
  -- print('stdout', obj.stdout)
  -- print('stderr', obj.stderr)
end

return {
  'LazyVim/LazyVim',
  keys = {
    {
      '<leader>cy',
      function()
        local r = vim.region(0, "'<", "'>", vim.fn.visualmode(), true)
        local text = region_to_text(r)
        print('text', text)

        vim.system({
          'silicon',
          '--to-clipboard',
          '-l',
          vim.bo.filetype,
        }, { text = true, stdin = text }, on_exit)
      end,
      desc = 'Copy code',
      mode = { 'x' },
    },
  },
}
