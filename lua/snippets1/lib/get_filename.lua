local get_filename = function()
  return vim.fn.expand('%:t') -- %:t expands to the tail of the file name, which is the file name itself
end

return get_filename
