local tsdoc = function()
  local i = require('neogen.types.template').item

  return {
    { nil, '/** $1 */', { no_results = true, type = { 'func', 'class' } } },
    { nil, '/** @type $1 */', { no_results = true, type = { 'type' } } },

    { nil, '/**', { no_results = true, type = { 'file' } } },
    { nil, ' * @module $1', { no_results = true, type = { 'file' } } },
    { nil, ' */', { no_results = true, type = { 'file' } } },

    { nil, '/**', { type = { 'class', 'func' } } },
    { i.ClassName, ' * $1', { type = { 'class' } } },
    { i.Type, ' * @template %s - $1', { type = { 'func' } } },
    { i.Parameter, ' * @param %s - $1', { type = { 'func' } } },
    {
      { i.Parameter },
      ' * @param %s - $1',
      { required = i.Tparam, type = { 'func' } },
    },
    { i.Return, ' * @returns $1', { type = { 'func' } } },
    { nil, ' */', { type = { 'class', 'func' } } },
    { i.InterfaceProperty, ' * @property %s - $1', { type = { 'interface' } } },
  }
end

return {
  'danymat/neogen',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  keys = {
    {
      '<leader>cN',
      function()
        require('neogen').generate({})
      end,
      desc = 'Add note comment',
    },
  },
  opts = {
    snippet_engine = 'luasnip',
    -- languages = {
    --   typescript = {
    --     template = {
    --       annotation_convention = 'tsdoc',
    --     },
    --   },
    --   ['typescript.tsdoc'] = tsdoc(),
    -- },
  },
}
