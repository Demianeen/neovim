vim.g.mapleader = ' '
vim.g.sqlite_clib_path = os.getenv('SQLITE_LIB_PATH')

local options = {
  -- tabs
  tabstop = 2, -- Number of spaces that a <Tab> in the file counts for
  smartindent = true, -- Tries to guess and adds intend when start a new line
  autoindent = true, -- Remembers indent from previous lines
  expandtab = true,

  wrap = true,
  -- wrapmargin = 80,
  linebreak = true, -- line breaks only on special characters instead of any char

  undofile = true, -- Sets persistent undo

  conceallevel = 2,

  scrolloff = 10, -- Always would be at least n characters in the bottom/ at the top of screen unless the end of the file
  signcolumn = 'yes', -- Always show columns for sign at the left part of the window

  report = 1000,

  spell = true, -- enables spelling
  spelloptions = 'camel',

  listchars = 'tab:  ,trail:-,nbsp:+',
  -- hint.paramType = true -- enables inline parameter hints

  -- showtabline = 1, -- show tabline only when there is more then one tabpage
}

vim.filetype.add({
  --  extension = {
  --   foo = 'fooscript',
  --   bar = function(path, bufnr)
  --     if some_condition() then
  --       return 'barscript', function(bufnr)
  --         -- Set a buffer variable
  --         vim.b[bufnr].barscript_version = 2
  --       end
  --     end
  --     return 'bar'
  --   end,
  -- },
  filename = {
    ['.eslintrc.json'] = 'jsonc',
    ['.lintstagedrc'] = 'json',
    ['.sqlfluff'] = 'toml',
  },
  pattern = {
    ['.*/.husky/.*'] = 'bash',
    ['.*/.vscode/.*json'] = 'jsonc',
    ['.*/.devcontainer/.*json'] = 'jsonc',
    -- -- Using an optional priority
    -- ['.*/etc/foo/.*%.conf'] = { 'dosini', { priority = 10 } },
    -- -- A pattern containing an environment variable
    -- ['${XDG_CONFIG_HOME}/foo/git'] = 'git',
    -- ['README.(%a+)$'] = function(path, bufnr, ext)
    --   if ext == 'md' then
    --     return 'markdown'
    --   elseif ext == 'rst' then
    --     return 'rst'
    --   end
    -- end,
  },
})

for opt_name, opt_value in pairs(options) do
  local ok, _ = pcall(vim.api.nvim_get_option_info2, opt_name, {})
  if ok then
    vim.opt[opt_name] = opt_value
  else
    vim.notify(
      'Option ' .. opt_name .. ' is not supported',
      vim.log.levels.WARN
    )
  end
end

vim.cmd.aunmenu({ 'PopUp.How-to\\ disable\\ mouse' })
vim.cmd.aunmenu({ 'PopUp.-1-' })
