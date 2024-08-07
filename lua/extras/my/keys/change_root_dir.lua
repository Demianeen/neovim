return {
  'LazyVim/LazyVim',
  keys = {
    {
      '<leader>fC',
      function()
        -- Find the .git directory starting from the current file's directory
        local git_root = vim.fn.finddir('.git', vim.fn.expand('%:p:h') .. ';')

        -- If a .git directory is found, change the directory to it
        if git_root ~= '' then
          -- Remove the .git from the path to get the root
          local project_root = vim.fn.fnamemodify(git_root, ':h')
          -- Change the directory to .git
          vim.cmd('cd ' .. project_root)
          print('Changed dir to ' .. project_root)
        else
          local lazyvim_root = LazyVim.root()
          vim.cmd('cd ' .. lazyvim_root)
          print('Changed dir to ' .. lazyvim_root)
        end
      end,
      desc = 'Change root dir to git folder',
    },
  },
}
