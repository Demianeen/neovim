return {
  {
    'pwntester/octo.nvim',
    cmd = 'Octo',
    opts = {
      gh_env = function()
        local github_token = require('op').get_secret('GitHub', 'token')
        if not github_token or not vim.startswith(github_token, 'ghp_') then
          error('Failed to get GitHub token.')
        end

        return { GITHUB_TOKEN = github_token }
      end,
    },
    {
      'm4xshen/hardtime.nvim',
      opts = function(_, opts)
        table.insert(opts.disabled_filetypes, { 'octo' })
      end,
    },
  },
}
