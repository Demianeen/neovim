local opts = require('util.keymaps')
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '/Users/demian/Library/Mobile Documents/iCloud~md~obsidian/**/*',
  callback = function()
    -- to load obsidian.nvim
    require('obsidian')
    vim.api.nvim_buf_set_keymap(
      0,
      'n',
      '<leader>Np',
      ':ObsidianPasteImg<CR>',
      opts('Paste Image')
    )
  end,
})
return {
  {
    'epwalsh/obsidian.nvim',
    lazy = true,
    ft = 'markdown',
    keys = {
      -- search
      {
        '<leader>Ns',
        '<cmd>ObsidianQuickSwitch<cr>',
        desc = 'Search',
      },
      {
        '<leader>Ng',
        '<cmd>ObsidianQuickSearch<cr>',
        desc = 'Grep',
      },
      -- daily note
      {
        '<leader>Ndt',
        '<cmd>ObsidianToday<cr>',
        desc = 'Today',
      },
      {
        '<leader>Ndy',
        '<cmd>ObsidianYesterdat<cr>',
        desc = 'Yesterday',
      },
      {
        '<leader>NdT',
        '<cmd>ObsidianTomorrow<cr>',
        desc = 'Tomorrow',
      },
      -- links
      {
        '<leader>Nl',
        ft = 'markdown',
        '<cmd>ObsidianLink<cr>',
        desc = 'Link',
      },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',
      'nvim-telescope/telescope.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      workspaces = {
        {
          name = 'personal',
          path = '/Users/demian/Library/Mobile Documents/iCloud~md~obsidian/Documents/Default',
        },
      },
      daily_notes = {
        folder = 'Daily notes',
        date_format = '%Y-%m-%d',
        alias_format = '%B %-d, %Y',
        -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
        template = nil,
      },

      wiki_link_func = 'use_alias_only', -- e.g. '[[Foo Bar]]'

      -- Where to put new notes. Valid options are
      --  * "current_dir" - put new notes in same directory as the current buffer.
      --  * "notes_subdir" - put new notes in the default notes subdirectory.
      new_notes_location = 'notes_subdir',

      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
      mappings = {
        -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
        ['gf'] = {
          action = function()
            return require('obsidian').util.gf_passthrough()
          end,
          opts = {
            noremap = false,
            expr = true,
            buffer = true,
            desc = 'Go to file',
          },
        },
        -- Toggle check-boxes.
        ['<leader>Nc'] = {
          action = function()
            return require('obsidian').util.toggle_checkbox()
          end,
          opts = { buffer = true, desc = 'Toggle check-boxes' },
        },
      },
      disable_frontmatter = false,
      templates = {
        subdir = '.templates',
        date_format = '%Y-%m-%d',
        time_format = '%H:%M',
        -- A map for custom variables, the key should be the variable and the value a function
        substitutions = {},
      },
      follow_url_func = function(url)
        vim.fn.jobstart({ 'open', url })
      end,
      ui = {
        enable = true,
        update_debounce = 200, -- update delay after a text change (in milliseconds)
        checkboxes = {
          -- the 'char' value has to be a single character, and the highlight groups are defined below.
          [' '] = { char = '󰄱', hl_group = 'ObsidianTodo' },
          ['x'] = { char = '', hl_group = 'ObsidianDone' },
          ['>'] = { char = '', hl_group = 'ObsidianRightArrow' },
          ['~'] = { char = '󰰱', hl_group = 'ObsidianTilde' },
          -- You can also add more custom ones...
        },
        external_link_icon = { char = '', hl_group = 'ObsidianExtLinkIcon' },
        reference_text = { hl_group = 'ObsidianRefText' },
        highlight_text = { hl_group = 'ObsidianHighlightText' },
        tags = { hl_group = 'ObsidianTag' },
        hl_groups = {
          -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
          ObsidianTodo = { bold = true, fg = '#f78c6c' },
          ObsidianDone = { bold = true, fg = '#89ddff' },
          ObsidianRightArrow = { bold = true, fg = '#f78c6c' },
          ObsidianTilde = { bold = true, fg = '#ff5370' },
          ObsidianRefText = { underline = true, fg = '#c792ea' },
          ObsidianExtLinkIcon = { fg = '#c792ea' },
          ObsidianTag = { italic = true, fg = '#89ddff' },
          ObsidianHighlightText = { bg = '#75662e' },
        },
      },
      attachments = {
        img_folder = '_assets',
        -- A function that determines the text to insert in the note when pasting an image.
        -- It takes two arguments, the `obsidian.Client` and a plenary `Path` to the image file.
        -- This is the default implementation.
        ---@param client obsidian.Client
        ---@param path Path the absolute path to the image file
        ---@return string
        img_text_func = function(client, path)
          local link_path
          local vault_relative_path = client:vault_relative_path(path)
          if vault_relative_path ~= nil then
            -- Use relative path if the image is saved in the vault dir.
            link_path = vault_relative_path
          else
            -- Otherwise use the absolute path.
            link_path = tostring(path)
          end
          local display_name = vim.fs.basename(link_path)
          return string.format('![%s](%s)', display_name, link_path)
        end,
      },
    },
  },
  {
    'folke/which-key.nvim',
    opts = function(_, _)
      local wk = require('which-key')
      wk.add({
        '<leader>Nd',
        group = 'Daily note',
      })
    end,
  },
}
