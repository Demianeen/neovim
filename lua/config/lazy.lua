local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	-- bootstrap lazy.nvim
	-- stylua: ignore
	vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
		lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require('lazy').setup({
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = true,
    notify = false,
  },
  spec = {
    -- lazyvim default plugins
    {
      'LazyVim/LazyVim',
      import = 'lazyvim.plugins',
      opts = function()
        table.insert(require('lazyvim.util.extras').sources, {
          name = '󰬟',
          desc = 'My lazyvim extra',
          module = 'extras',
        })

        return {
          news = {
            lazyvim = true,
            neovim = true,
          },
          colorscheme = 'catppuccin-frappe',
        }
      end,
    },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
    keys = {
      silent = true,
      noremap = true,
    },
  },
  install = { colorscheme = { 'catppuccin-frappe' } },
  checker = { enabled = true, notify = false }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        -- 'gzip',
        -- "matchit",
        -- 'matchparen',
        'netrwPlugin',
        -- 'tarPlugin',
        -- 'tohtml',
        -- 'tutor',
        -- 'zipPlugin',
      },
    },
  },
})
