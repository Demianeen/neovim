return {
	'monaqa/dial.nvim',
	opts = function()
		local augend = require('dial.augend')

		local logical_alias = augend.constant.new({
			elements = { '&&', '||' },
			word = false,
			cyclic = true,
		})

		local horizontal_direction_alias = augend.constant.new({
			elements = { 'left', 'right' },
			word = false,
			cyclic = true,
		})

		local vertical_direction_alias = augend.constant.new({
			elements = { 'top', 'bottom' },
			word = false,
			cyclic = true,
		})


		local ordinal_numbers = augend.constant.new({
			-- elements through which we cycle. When we increment, we go down
			-- On decrement we go up
			elements = {
				'first',
				'second',
				'third',
				'fourth',
				'fifth',
				'sixth',
				'seventh',
				'eighth',
				'ninth',
				'tenth',
			},
			-- if true, it only matches strings with word boundary. firstDate wouldn't work for example
			word = false,
			-- do we cycle back and forth (tenth to first on increment, first to tenth on decrement).
			-- Otherwise nothing will happen when there are no further values
			cyclic = true,
		})

		local weekdays = augend.constant.new({
			elements = {
				'Monday',
				'Tuesday',
				'Wednesday',
				'Thursday',
				'Friday',
				'Saturday',
				'Sunday',
			},
			word = true,
			cyclic = true,
		})

		local months = augend.constant.new({
			elements = {
				'January',
				'February',
				'March',
				'April',
				'May',
				'June',
				'July',
				'August',
				'September',
				'October',
				'November',
				'December',
			},
			word = true,
			cyclic = true,
		})

		local capitalized_boolean = augend.constant.new({
			elements = {
				'True',
				'False',
			},
			word = true,
			cyclic = true,
		})

		return {
			dials_by_ft = {
				css = 'css',
				sass = 'css',
				scss = 'css',
				javascript = 'typescript',
				javascriptreact = 'typescript',
				typescript = 'typescript',
				typescriptreact = 'typescript',
				json = 'json',
				lua = 'lua',
				markdown = 'markdown',
				python = 'python',
			},
			groups = {
				default = {
					augend.integer.alias.decimal, -- nonnegative decimal number (0, 1, 2, 3, ...)
					augend.integer.alias.hex, -- nonnegative hex number  (0x01, 0x1a1f, etc.)
					augend.date.alias['%Y/%m/%d'], -- date (2022/02/19, etc.)
				},
				typescript = {
					augend.integer.alias.decimal, -- nonnegative and negative decimal number
					augend.constant.alias.bool, -- boolean value (true <-> false)
					logical_alias,
					augend.constant.new({ elements = { 'let', 'const' } }),
					ordinal_numbers,
					weekdays,
					months,
					horizontal_direction_alias,
					vertical_direction_alias
				},
				css = {
					augend.integer.alias.decimal, -- nonnegative and negative decimal number
					augend.hexcolor.new({
						case = 'lower',
					}),
					augend.hexcolor.new({
						case = 'upper',
					}),
				},
				markdown = {
					augend.misc.alias.markdown_header,
					ordinal_numbers,
					weekdays,
					months,
				},
				json = {
					augend.integer.alias.decimal, -- nonnegative and negative decimal number
					augend.semver.alias.semver, -- versioning (v1.1.2)
				},
				lua = {
					augend.integer.alias.decimal, -- nonnegative and negative decimal number
					augend.constant.alias.bool, -- boolean value (true <-> false)
					augend.constant.new({
						elements = { 'and', 'or' },
						word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
						cyclic = true, -- "or" is incremented into "and".
					}),
					ordinal_numbers,
					weekdays,
					months,
				},
				python = {
					augend.integer.alias.decimal, -- nonnegative and negative decimal number
					capitalized_boolean,
					logical_alias,
					ordinal_numbers,
					weekdays,
					months,
					horizontal_direction_alias,
					vertical_direction_alias
				},
			},
		}
	end,
}
