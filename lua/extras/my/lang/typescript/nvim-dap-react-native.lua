return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'sultanahamer/nvim-dap-reactnative',
  },
  opts = function()
    local languages =
      { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' }

    local dap = require('dap')

    dap.adapters.node2 = {
      type = 'executable',
      command = 'node',
      args = { os.getenv('HOME') .. '/vscode-node-debug2/out/src/nodeDebug.js' },
    }

    for _, language in ipairs(languages) do
      dap.configurations[language] = {
        {
          name = 'Attach to React native process (port 8081)',
          type = 'node2',
          request = 'attach',
          program = '${file}',
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = 'inspector',
          console = 'integratedTerminal',
          port = 35000,
        },
      }
    end

    require('dap.ext.vscode').load_launchjs(nil, {
      ['pwa-node'] = languages,
      ['node'] = languages,
      ['chrome'] = languages,
      ['pwa-chrome'] = languages,
    })
  end,
}
