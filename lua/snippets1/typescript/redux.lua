-- luasnip
local ls = require('luasnip')
local extras = require('luasnip.extras')
local fmt = require('luasnip.extras.fmt').fmt
local rep = extras.rep

-- lib
local get_filename_without_ext =
  require('snippets1.lib.get_filename_without_ext')

local get_slice_name = function()
  local filename = get_filename_without_ext()
  return filename:gsub('Slice$', '') -- Remove 'Slice' if present
end

local get_uppercase_slice_name = function()
  return get_slice_name():gsub('^%l', string.upper)
end

local reduxSlice = ls.snippet(
  'rs',
  fmt(
    [[
        const initialState: {sliceName}Schema = {{}}
        
        export const [{sliceName}Slice = buildSlice({{
          name: '{sliceName}',
          initialState,
          reducers: {{}},
        }})

        export const {{
          actions: {sliceName}Actions,
          reducer: {sliceName}Reducer,
          useActions: use{uppercaseSliceName}Actions,
        }} = {sliceName}
        ]],
    {
      sliceName = ls.function_node(get_slice_name),
      uppercaseSliceName = ls.function_node(get_uppercase_slice_name),
    }
  )
)

local reduxTestReducer = ls.snippet(
  'rtr',
  fmt(
    [[
        test('{sliceName}Reducer', () => {{
          const state: DeepPartial<{uppercaseSliceName}Schema> = {};
          expect(
            {sliceName}Reducer(
              state as {uppercaseSliceName}Schema,
              {sliceName}Actions.{}({})
            )
          ).toEqual({});
        }})
        ]],
    {
      sliceName = ls.function_node(get_slice_name),
      uppercaseSliceName = ls.function_node(get_uppercase_slice_name),
      ls.insert_node(1),
      ls.insert_node(2),
      ls.insert_node(3),
      ls.insert_node(4),
    }
  )
)

local createAsyncThunk = ls.snippet(
  'rt',
  fmt(
    [[
    export const {fileName} = buildAsyncThunk<{}, {}, ThunkConfig>(
      '{}/{fileName}',
      async ({}, {{ extra, rejectWithValue }}) => {{
        try {{
          const response = await extra.api.get<{}>('/{}')

          if (!response.data) {{
            return rejectWithValue('error')
          }}

          {}
          return response.data
        }} catch (error) {{
          return rejectWithValue('error')
        }}
      }}
    );
    ]],
    {
      fileName = ls.function_node(get_filename_without_ext),
      ls.insert_node(1), -- Placeholder for first generic type parameter
      ls.insert_node(2), -- Placeholder for second generic type parameter
      ls.insert_node(3), -- Placeholder for the URL part
      ls.insert_node(4), -- Placeholder for the async function's argument
      ls.insert_node(5), -- Placeholder for the API endpoint
      ls.insert_node(6), -- Placeholder for the API endpoint
      ls.insert_node(0), -- Final placeholder
    }
  )
)

ls.add_snippets('typescript', {
  reduxSlice,
  reduxTestReducer,
  createAsyncThunk,
})
