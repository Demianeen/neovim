-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Resetting lazyvim autocmd options',
  pattern = '*',
  callback = function()
    vim.opt_local.formatoptions:remove('r')
    vim.opt_local.formatoptions:remove('o')
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Auto select virtualenv',
  pattern = 'python',
  callback = function()
    local venv = vim.fn.findfile('pyproject.toml', vim.fn.getcwd() .. ';')
    if venv ~= '' then require('venv-selector').retrieve_from_cache() end
  end,
  once = true,
})

vim.api.nvim_del_augroup_by_name('lazyvim_json_conceal')
