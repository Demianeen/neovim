return {
	'nanozuki/tabby.nvim',
	event = 'VimEnter',
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function()
		local theme = {
			fill = 'TabLineFill',
			-- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
			head = 'TabLine',
			current_tab = 'TabLineSel',
			tab = 'TabLine',
			win = 'TabLine',
			tail = 'TabLine',
		}
		require('tabby.tabline').set(function(line)
			return {
				{
					-- { '   ', hl = theme.head },
					line.sep('', theme.head, theme.fill),
				},
				line.tabs().foreach(function(tab)
					local hl = tab.is_current() and theme.current_tab or theme.tab
					return {
						line.sep('', hl, theme.fill),
						tab.is_current() and '' or '󰆣',
						tab.number(),
						-- tab.close_btn(''),  -- This line adds the close button. Remove or comment out this line.
						line.sep('', hl, theme.fill),
						hl = hl,
						margin = ' ',
					}
				end),
				line.spacer(),
				-- {
				-- 	line.sep('', theme.tail, theme.fill),
				-- },
				hl = theme.fill,
			}
		end)

		-- require('tabby.tabline').use_preset('tab_only', {
		-- 	theme = {
		-- 		fill = 'TabLineFill',           -- tabline background
		-- 		head = 'TabLine',               -- head element highlight
		-- 		current_tab = 'TabLineSel',     -- current tab label highlight
		-- 		tab = 'TabLine',                -- other tab label highlight
		-- 		win = 'TabLine',                -- window highlight
		-- 		tail = 'TabLine',               -- tail element highlight
		-- 	},
		-- 	nerdfont = true,                  -- whether use nerdfont
		-- 	lualine_theme = 'catppuccin-frappe', -- lualine theme name
		-- 	tab_name = {
		-- 		name_fallback = function(tabid)
		-- 			return tabid
		-- 		end,
		-- 	},
		-- 	buf_name = {
		-- 		mode = "'unique'|'relative'|'tail'|'shorten'",
		-- 	},
		-- })
	end

}
