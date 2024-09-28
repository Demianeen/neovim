local function open_selected(prompt_bufnr)
  print('multi picker')
  local picker =
    require('telescope.actions.state').get_current_picker(prompt_bufnr)
  local multi = picker:get_multi_selection()

  if not vim.tbl_isempty(multi) then
    require('telescope.actions').close(prompt_bufnr)

    for _, j in pairs(multi) do
      if j.path ~= nil then vim.cmd(string.format('%s %s', 'edit', j.path)) end
    end
  else
    require('telescope.actions').select_default(prompt_bufnr)
  end
end

local picker_dropdown = {
  theme = 'dropdown',
  previewer = false,
}

return {
  'nvim-telescope/telescope.nvim',
  keys = {
    {
      '<leader>sp',
      function()
        require('telescope.builtin').find_files({
          cwd = require('lazy.core.config').options.root,
          prompt_title = 'Find in plugins',
        })
      end,
      desc = 'Find Plugin File',
    },
  },
  opts = {
    defaults = {
      layout_strategy = 'vertical',
      layout_config = {
        height = 0.95,
        width = 0.8,
        preview_cutoff = 20,
      },
      -- mappings = {
      --   i = {
      --     -- ['<c-s>'] = nil,
      --     ['<c-k>'] = open_selected,
      --     ['<cr>'] = open_selected,
      --   },
      --   n = {
      --     -- ['s'] = nil,
      --     ['<cr>'] = open_selected,
      --   },
      -- },
      -- path_display = { 'truncate' },
    },
    pickers = {
      buffers = picker_dropdown,
      colorscheme = picker_dropdown,
      find_files = picker_dropdown,
      git_files = picker_dropdown,
      highlights = picker_dropdown,
      lsp_document_symbols = { layout_strategy = 'horizontal' },
    },
  },
}
