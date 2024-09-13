-- luasnip
local ls = require('luasnip')
local extras = require('luasnip.extras')
local fmt = require('luasnip.extras.fmt').fmt
local rep = extras.rep

-- lib
local get_filename_without_ext =
  require('snippets1.lib.get_filename_without_ext')

local consoleLog = ls.snippet('clg', {
  ls.text_node('console.log('),
  ls.insert_node(1),
  ls.text_node(')'),
})

local interfaceSnippet = ls.snippet(
  'i',
  fmt(
    [[
interface {} {{
  {}
}}
]],
    {
      ls.insert_node(1, 'InterfaceName'),
      ls.insert_node(2),
    }
  )
)

local importFrom = ls.snippet(
  'imf',
  fmt("import {{{}}} from '{}'", {
    ls.insert_node(2),
    ls.insert_node(1),
  })
)

local exportFrom = ls.snippet(
  'exf',
  fmt("export {{{}}} from '{}'", {
    ls.insert_node(2),
    ls.insert_node(1),
  })
)

local exportAll = ls.snippet(
  'ea',
  fmt("export * from '{}'", {
    ls.insert_node(1),
  })
)

local exportInterface = ls.snippet(
  'ei',
  fmt(
    [[
export interface {} {{
  {}
}}
]],
    {
      ls.insert_node(1, 'InterfaceName'),
      ls.insert_node(2),
    }
  )
)

local exportConst = ls.snippet(
  'ec',
  fmt('export const {} = {}', {
    ls.insert_node(1),
    ls.insert_node(2),
  })
)

local func = ls.snippet(
  'f',
  fmt(
    [[
function {}({}) {{
	{}
}}
]],
    {
      ls.insert_node(1),
      ls.insert_node(2),
      ls.insert_node(3),
    }
  )
)

local arrowFunc = ls.snippet(
  'af',
  fmt(
    [[
	() =>
]],
    {}
  )
)

local constArrowFunc = ls.snippet(
  'caf',
  fmt(
    [[
	const {} = () => {}
]],
    {
      ls.insert_node(1),
      ls.insert_node(2),
    }
  )
)

local exportFunc = ls.snippet(
  'ef',
  fmt(
    [[
export function {}({}) {{
	{}
}}
]],
    {
      ls.insert_node(1),
      ls.insert_node(2),
      ls.insert_node(3),
    }
  )
)
local toggleFeatureComponent = ls.snippet(
  'tfc',
  fmt(
    [[
<ToggleFeature name='{}' on={{{}}} off={{{}}} />
    ]],
    {
      ls.insert_node(1, 'featureName'),
      ls.insert_node(2),
      ls.insert_node(3),
    }
  )
)

local toggleFeatureFunction = ls.snippet(
  'tff',
  fmt(
    [[
toggleFeature({{ name: {}, on: {}, off: {} }})
]],
    {
      ls.insert_node(1, "'featureName'"),
      ls.insert_node(2, '() => '),
      ls.insert_node(3, '() => '),
    }
  )
)

ls.add_snippets('typescriptreact', {
  consoleLog,
  ls.snippet('co', {
    ls.dynamic_node(function()
      local register_data = vim.fn.getreg() .. ''
      if string.match(register_data, '[%d-]+,%s*[%d-]+') then
        return ls.snippet_node(nil, {
          ls.text_node('position([' .. register_data .. '])'),
        })
      end
    end),
  }),
  interfaceSnippet,
  exportInterface,
  toggleFeatureComponent,
  toggleFeatureFunction,
  importFrom,
  exportFrom,
  exportAll,
  exportConst,
  func,
  arrowFunc,
  constArrowFunc,
  exportFunc,
})

ls.add_snippets('typescript', {
  consoleLog,
  interfaceSnippet,
  exportInterface,
  toggleFeatureComponent,
  toggleFeatureFunction,
  importFrom,
  exportFrom,
  exportAll,
  exportConst,
  func,
  arrowFunc,
  constArrowFunc,
  exportFunc,
})
