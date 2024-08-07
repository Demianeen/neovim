-- luasnip
local ls = require('luasnip')
local extras = require('luasnip.extras')
local fmt = require('luasnip.extras.fmt').fmt

-- lib
local get_filename_without_ext =
		require('snippets1.lib.get_filename_without_ext')

local beforeEach = ls.snippet(
	'tbe',
	fmt(
		[[
        beforeEach(() => {{
          {}
        }});
        ]],
		{
			ls.insert_node(1), -- Placeholder for the content inside beforeEach
		}
	)
)

local afterEach = ls.snippet(
	'tae',
	fmt(
		[[
        afterEach(() => {{
          {}
        }})
        ]],
		{
			ls.insert_node(1), -- Placeholder for the content inside afterEach
		}
	)
)

local describe = ls.snippet(
	'td',
	fmt(
		[[
describe("{}", () => {{
  {}
}});
        ]],
		{
			ls.function_node(get_filename_without_ext), -- Filename without extension
			ls.insert_node(0),                       -- Placeholder for the test description
		}
	)
)

local it = ls.snippet(
	'ti',
	fmt(
		[[
        it('should {}', () => {{
          {}
        }});
        ]],
		{
			ls.insert_node(1, 'do something'), -- Placeholder for the 'it' description
			ls.insert_node(2),              -- Placeholder for the content inside 'it'
		}
	)
)

local test = ls.snippet(
	'tt',
	fmt(
		[[
        test('{}', () => {{
          {}
        }});
        ]],
		{
			ls.insert_node(1, 'test something'), -- Placeholder for the test description
			ls.insert_node(2),                -- Placeholder for the content inside test
		}
	)
)

local expect = ls.snippet(
	'te',
	fmt('expect({}).{}', {
		ls.insert_node(1),         -- Placeholder for the expect argument
		ls.insert_node(2, 'toBe()'), -- Placeholder for the matcher
	})
)

local expectToBe = ls.snippet(
	'teb',
	fmt('expect({}).toBe({})', {
		ls.insert_node(1), -- Placeholder for the first argument
		ls.insert_node(2), -- Placeholder for the second argument
	})
)

ls.add_snippets('typescriptreact', {
	beforeEach,
	afterEach,
	describe,
	it,
	test,
	expect,
	expectToBe,
})

ls.add_snippets('typescript', {
	beforeEach,
	afterEach,
	describe,
	it,
	test,
	expect,
	expectToBe,
})
