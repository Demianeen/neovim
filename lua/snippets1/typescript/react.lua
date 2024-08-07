-- luasnip
local ls = require('luasnip')
local extras = require('luasnip.extras')
local fmt = require('luasnip.extras.fmt').fmt

-- lib
local get_filename_without_ext =
  require('snippets1.lib.get_filename_without_ext')

local reactComponent = ls.snippet(
  'rc',
  fmt(
    [[
export interface {f}Props {{
}}

export const {f} = ({{}}: {f}Props) => {{

  return (
    <div>
      {}
    </div>
  );
}};
]],
    {
      f = ls.function_node(get_filename_without_ext),
      ls.insert_node(1),
    }
  )
)
local useCallback = ls.snippet(
  'uc',
  fmt(
    [[
const {} = useCallback(() => {{
  {}
}}, []);{}
]],
    {
      ls.insert_node(1, 'callbackName'), -- Placeholder for callback name
      ls.insert_node(2), -- Placeholder for callback body
      ls.insert_node(0), -- Final placeholder
    }
  )
)

local useEffect = ls.snippet(
  'ue',
  fmt(
    [[
useEffect(() => {{
  {}
}}, []);
]],
    {
      ls.insert_node(0), -- Placeholder inside useEffect
    }
  )
)

local useState = ls.snippet(
  'us',
  fmt(
    [[
const [{}, set{}] = useState({});
]],
    {
      ls.insert_node(1, 'name'), -- Placeholder for state name
      ls.function_node(function(args)
        return args[1][1]:gsub('^%l', string.upper) -- Capitalizes the first letter
      end, { 1 }),
      ls.insert_node(2), -- Placeholder for initial state value
    }
  )
)

local useTranslation = ls.snippet(
  'ut',
  fmt(
    [[
const {{ t }} = useTranslation({});
]],
    {
      ls.insert_node(1), -- Placeholder
    }
  )
)

local useRef = ls.snippet(
  'ur',
  fmt(
    [[
const {} = useRef({});
]],
    {
      ls.insert_node(1, 'refName'), -- Placeholder for ref name
      ls.insert_node(0), -- Placeholder for initial ref value
    }
  )
)

local useParams = ls.snippet(
  'up',
  fmt(
    [[
const {{ {} }} = useParams();
]],
    {
      ls.insert_node(1, 'param'), -- Placeholder for param
    }
  )
)

local useMemo = ls.snippet(
  'um',
  fmt(
    [[
const {} = useMemo(() => ({{ 
  {} 
}}), []);
]],
    {
      ls.insert_node(1, 'memoName'), -- Placeholder for memo name
      ls.insert_node(0), -- Placeholder for memo body
    }
  )
)

local useNavigate = ls.snippet('un', {
  ls.text_node('const navigate = useNavigate();'),
})

local useAppDispatch = ls.snippet('ud', {
  ls.text_node('const dispatch = useAppDispatch();'),
})

local useDispatch = ls.snippet('udn', {
  ls.text_node('const dispatch = useDispatch();'),
})

local useSelectorGet = ls.snippet(
  'usg',
  fmt(
    [[
const {} = useSelector(get{});
]],
    {
      ls.insert_node(1, 'selectorName'), -- Placeholder for selector name
      ls.insert_node(0), -- Placeholder for get function
    }
  )
)

local useSelectorSelect = ls.snippet(
  'uss',
  fmt(
    [[
const {} = useSelector(select{});
]],
    {
      ls.insert_node(1, 'selectorName'), -- Placeholder for selector name
      ls.insert_node(0), -- Placeholder for select function
    }
  )
)

local useServer = ls.snippet('useserver', {
  ls.text_node("'use server'"),
})

local useClient = ls.snippet('useclient', {
  ls.text_node("'use client'"),
})

ls.add_snippets('typescriptreact', {
  reactComponent,
  useCallback,
  useEffect,
  useState,
  useTranslation,
  useRef,
  useParams,
  useMemo,
  useNavigate,
  useAppDispatch,
  useSelectorGet,
  useSelectorSelect,
  useDispatch,
  useServer,
  useClient,
})

ls.add_snippets('typescript', {
  useCallback,
  useEffect,
  useState,
  useTranslation,
  useRef,
  useParams,
  useMemo,
  useNavigate,
  useAppDispatch,
  useDispatch,
  useSelectorGet,
  useSelectorSelect,
  useServer,
  useClient,
})
