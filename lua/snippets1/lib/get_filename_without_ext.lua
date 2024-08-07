local get_filename_without_ext = function()
  local filename = vim.fn.expand('%:t')
  local first_dot_index = filename:find('%.')

  if first_dot_index then return filename:sub(1, first_dot_index - 1) end

  return filename
end

return get_filename_without_ext
