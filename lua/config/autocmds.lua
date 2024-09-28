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

-- custom tabpage naming
local function getCurrentCwdDirName()
  local cwd = vim.uv.cwd()
  if cwd == nil then
    vim.notify('Cwd is nil!', vim.log.levels.ERROR, nil)
    return 'error'
  end
  return cwd:match('([^/\\]+)$')
end
vim.cmd('BufferLineTabRename ' .. getCurrentCwdDirName())
vim.api.nvim_create_autocmd('TabNewEntered', {
  callback = function()
    -- Schedule the renaming after the tab is fully entered
    vim.schedule(function()
      vim.cmd('BufferLineTabRename ' .. getCurrentCwdDirName())
    end)
  end,
})

-- Function to rename all tab pages
local function renameAllTabs()
  local current_tab = vim.fn.tabpagenr()
  for tabnr = 1, vim.fn.tabpagenr('$') do
    vim.cmd(tabnr .. 'tabnext') -- Switch to the tab with the number `tabnr`
    vim.cmd('BufferLineTabRename ' .. getCurrentCwdDirName()) -- Rename the tab
    vim.cmd(current_tab .. 'tabnext')
  end
end
-- Autocmd to rename all tabs after loading a session
vim.api.nvim_create_autocmd('User', {
  pattern = 'PersistenceLoadPost',
  callback = function()
    vim.schedule(renameAllTabs) -- Schedule the renaming after the session is loaded
  end,
})
