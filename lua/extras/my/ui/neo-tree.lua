local pretty_path = function(str, substr)
  return '~' .. str:sub(substr:len())
end

local node_close_or_goto_parent = function(state)
  local node = state.tree:get_node()

  if
    (node.type == 'directory' or node:has_children()) and node:is_expanded()
  then
    state.commands.toggle_node(state)
  else
    require('neo-tree.ui.renderer').focus_node(state, node:get_parent_id())
  end
end

local node_open_or_file_open = function(state)
  local node = state.tree:get_node()

  if node.type == 'directory' or node:has_children() then
    if not node:is_expanded() then
      state.commands.toggle_node(state)
    else
      require('neo-tree.ui.renderer').focus_node(state, node:get_child_ids()[1])
    end
  else
    state.commands.open(state)
  end
end

local copy_selector = function(state)
  local node = state.tree:get_node()
  local filepath = node:get_id()
  local filename = node.name
  local messages = { { '\nChoose to copy to clipboard:\n', 'Normal' } }
  local modify = vim.fn.fnamemodify

  local results = {
    e = { val = modify(filename, ':e'), msg = 'Extension only' },
    f = { val = filename, msg = 'Filename' },
    F = { val = modify(filename, ':r'), msg = 'Filename w/o extension' },
    h = { val = modify(filepath, ':~'), msg = 'Path relative to Home' },
    c = { val = modify(filepath, ':.'), msg = 'Path relative to CWD' },
    a = { val = filepath, msg = 'Absolute path' },
  }

  for i, result in pairs(results) do
    if result.val and result.val ~= '' then
      vim.list_extend(messages, {
        { ('%s.'):format(i), 'Identifier' },
        { (' %s: '):format(result.msg) },
        { result.val, 'String' },
        { '\n' },
      })
    end
  end

  vim.api.nvim_echo(messages, false, {})

  local result = results[vim.fn.getcharstr()]

  if result and result.val and result.val ~= '' then
    vim.notify('Copied: ' .. result.val)
    vim.fn.setreg('+', result.val)
  end
end

local system_open = function(state)
  local node = state.tree:get_node()
  local path = node:get_id()

  vim.fn.jobstart({ 'open', path }, { detach = true })
end

local delete = function(state)
  local inputs = require('neo-tree.ui.inputs')
  local path = state.tree:get_node().path
  local path_relative = pretty_path(path, vim.fn.getcwd() .. '/')
  local msg = 'Confirm delete "' .. path_relative .. '"'

  inputs.confirm(msg, function(confirmed)
    if not confirmed then return end

    if string.find(path, '/.local/share/chezmoi') then
      print('Using chezmoi remove...')
      local source_path =
        vim.fn.system({ 'chezmoi', 'target-path', vim.fn.fnameescape(path) })
      source_path = string.match(source_path, '^[^\n]*')

      if vim.v.shell_error ~= 0 then
        print('Chezmoi target-path could not get target at ' .. path)
        return
      end
      vim.fn.system({
        'chezmoi',
        'destroy',
        '--force',
        vim.fn.fnameescape(source_path),
      })
      if vim.v.shell_error ~= 0 then
        print('Chezmoi rm could not delete directory at ' .. source_path)
        vim.notify(
          'chezmoi ' .. 'rm ' .. ' --force ' .. vim.fn.fnameescape(source_path)
        )
        return
      end
    else
      vim.fn.system({ 'trash', vim.fn.fnameescape(path) })
    end
    pcall(require('mini.bufremove'), path, true)
    require('neo-tree.sources.manager').refresh(state.name)
  end)
end

local delete_visual = function(state, selected_nodes)
  local inputs = require('neo-tree.ui.inputs')

  local get_table_len = function(tbl)
    local len = 0
    for _ in pairs(tbl) do
      len = len + 1
    end
    return len
  end

  local count = get_table_len(selected_nodes)

  local msg = 'Confirm delete ' .. count .. ' files'

  inputs.confirm(msg, function(confirmed)
    if not confirmed then return end

    for _, node in ipairs(selected_nodes) do
      pcall(require('bufdelete').bufdelete, node.path, true)
      vim.fn.system({ 'trash', vim.fn.fnameescape(node.path) })
    end

    require('neo-tree.sources.manager').refresh(state.name)
  end)
end

return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    opts = {
      show_scrolled_off_parent_node = true,
      use_popups_for_input = true,
      popup_border_style = 'rounded',

      event_handlers = {
        {
          -- event = 'neo_tree_buffer_leave', -- then on each vtsls
          -- reinitialization the neo tree is closed
          event = 'file_opened',
          handler = function(_)
            vim.cmd('Neotree close')
          end,
        },
        {
          event = 'neo_tree_popup_input_ready',
          ---@param args { bufnr: integer, winid: integer }
          handler = function(args)
            -- map <esc> to enter normal mode (by default closes prompt)
            -- don't forget `opts.buffer` to specify the buffer of the popup.
            vim.keymap.set(
              'i',
              '<esc>',
              vim.cmd.stopinsert,
              { noremap = true, buffer = args.bufnr }
            )
          end,
        },
      },
      commands = {
        node_open_or_file_open = node_open_or_file_open,
        node_close_or_goto_parent = node_close_or_goto_parent,
        copy_selector = copy_selector,
        system_open = system_open,
      },
      filesystem = {
        filtered_items = {
          never_show = { '.DS_Store', '.git' },
        },
        commands = {
          delete = delete,
          delete_visual = delete_visual,
        },
      },
      window = {
        width = 44,
        mappings = {
          ['<space>'] = false,
          ['h'] = 'node_close_or_goto_parent',
          ['l'] = 'node_open_or_file_open',
          ['Y'] = 'copy_selector',
          ['O'] = 'system_open',
          -- fzf content of files in the dir under the cursor
          -- ['g'] = function(state)
          --   -- get the current node
          --   local node = state.tree:get_node()
          --   -- if the node is not a directory, walk up the tree until we find one
          --   while node and node.type ~= 'directory' do
          --     local parent_id = node:get_parent_id()
          --     if parent_id == nil then
          --       -- we must have reached the root node
          --       -- this should not happen because the root node is always a directory
          --       -- but just in case...
          --       node = nil
          --       break
          --     end
          --     node = state.tree:get_node(parent_id)
          --   end
          --   -- if we somehow didn't find a directory, just use the root node
          --   local path = node and node.path or state.path
          --   require('telescope.builtin').live_grep({
          --     search_dirs = { path },
          --     prompt_title = string.format(
          --       'Grep in [%s]',
          --       vim.fs.basename(path)
          --     ),
          --   })
          -- end,
        },
      },
    },
  },
  {
    {
      'antosha417/nvim-lsp-file-operations',
      optional = true,
      dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-neo-tree/neo-tree.nvim',
      },
      opts = {},
    },
  },
}
