local function get_main_window_id()
  local current_window_id = vim.api.nvim_get_current_win()

  require('edgy').goto_main()
  local main_window_id = vim.api.nvim_get_current_win()

  vim.fn.win_gotoid(current_window_id)
  return main_window_id
end

local function open_path(buf, path)
  if vim.uv.fs_stat(vim.fn.fnamemodify(path, ':p')) then
    local cursor = vim.api.nvim_win_get_cursor(0)
    local line =
      vim.api.nvim_buf_get_lines(buf, cursor[1] - 1, cursor[1], false)[1]

    local main_window_id = get_main_window_id()
    vim.fn.win_gotoid(main_window_id)
    vim.cmd('edit ' .. path)

    local row_col = string.match(line, path .. '%s(%d+:%d+)')

    if row_col then
      row_col = vim.iter(vim.split(row_col, ':')):map(tonumber):totable()
      vim.api.nvim_win_set_cursor(0, row_col)
    end

    return
  end

  local ok, msg = pcall(vim.ui.open, path)

  if not ok then vim.notify(string(msg), vim.log.levels.ERROR) end
end

return {
  'akinsho/toggleterm.nvim',
  opts = function()
    vim.api.nvim_create_autocmd('TermOpen', {
      pattern = 'term://*toggleterm#*',
      callback = function(event)
        local keymap_opts = require('util.keymaps')

        vim.keymap.set({ 'n' }, 'gf', function()
          local path = vim.fn.expand('<cfile>')

          if path ~= '' then open_path(event.buf, path) end
        end, keymap_opts(
          'Open file under the cursor',
          { buffer = event.buf }
        ))
      end,
    })
  end,
}
