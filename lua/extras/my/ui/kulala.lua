-- http://example.com
-- NOTE: this extra needs to be loaded *after* edgy extra
return {
  -- {
  --   'mistweaverco/kulala.nvim',
  --   ft = 'http',
  --   opts = function()
  --     vim.api.nvim_create_autocmd('BufWinEnter', {
  --       callback = function()
  --         print('fired')
  --         print('filetype: ' .. vim.bo.filetype)
  --         if vim.bo.filetype == 'html' then
  --           print('passed')
  --           vim.bo.buflisted = false
  --         end
  --       end,
  --     })
  --   end,
  -- },
  {
    'mistweaverco/kulala.nvim',
    ft = 'http',
    keys = {
      {
        '<leader>R',
        function()
          local line = vim.fn.getline('.')
          local url_pattern = [[https?://[%w-_%.%d:/?&=]+]]
          local url_under_cursor = string.match(line, url_pattern)

          -- If a URL was found, proceed with the curl request
          if url_under_cursor then
            require('plenary.job')
              :new({
                command = 'curl',
                args = { '--silent', url_under_cursor },
                on_exit = function(job, return_val)
                  if return_val == 0 then
                    local result = table.concat(job:result(), '\n')
                    Snacks.notify.info(result, { ft = 'json' })
                  else
                    Snacks.notify.error('Failed to fetch URL')
                  end
                end,
              })
              :start()
          else
            Snacks.notify.warn('No URL found in the current line')
          end
        end,
        desc = 'Send the request',
      },
      -- {
      --   '<CR>',
      --   "<cmd>lua require('kulala').run()<cr>",
      --   desc = 'Send the request',
      --   ft = 'http',
      -- },
      {
        '<S-CR>',
        "<cmd>lua require('kulala').show_stats()<cr>",
        desc = 'Show stats',
        ft = 'http',
      },
    },
    opts = {},
  },
  {
    'akinsho/bufferline.nvim',
    opts = {
      options = {
        -- custom_filter = function(buf_number, buf_numbers)
        --   return not vim.fn.bufname(buf_number):match('kulala')
        -- end,
      },
    },
  },
  -- {
  --   'folke/edgy.nvim',
  --   event = 'VeryLazy',
  --   init = function()
  --     vim.opt.laststatus = 3
  --     vim.opt.splitkeep = 'screen'
  --   end,
  --   opts = function(_, opts)
  --     opts.right = opts.right or {}
  --     local filetypes = { 'http', 'xml', 'json', 'html' }
  --     for _, ft in ipairs(filetypes) do
  --       table.insert(opts.right, {
  --         ft = ft,
  --         filter = function(buf)
  --           return vim.fn.bufname(buf):match('kulala')
  --         end,
  --         title = 'Log Files',
  --         size = { width = 2 },
  --       })
  --     end
  --     -- table.insert(opts.right, {
  --     --   title = 'Aerial',
  --     --   ft = 'aerial',
  --     --   pinned = true,
  --     --   open = 'AerialOpen',
  --     -- })
  --   end,
  -- },
}
