local ls = require('luasnip')
local extras = require('luasnip.extras')
local fmt = require('luasnip.extras.fmt').fmt

local get_reg = require('snippets1.lib.get_reg')

-- vim.keymap.set({ 'i', 's' }, '<C-k>', function()
--   if ls.expand_or_jumpable() then ls.expand_or_jump() end
-- end, { silent = true })
--
-- vim.keymap.set({ 'i', 's' }, '<C-j>', function()
--   if ls.jumpable(-1) then ls.jump(-1) end
-- end, { silent = true })
--
vim.keymap.set({ 'i', 's' }, '<C-n>', function()
	if ls.choise_active() then ls.change_choise(1) end
end, { silent = true })

local get_github_author_and_repo = function()
	local clipboard = get_reg('*')

	local author, repo =
			clipboard:match('https://github%.com/([%w-%.]+)/([%w-%.]+)')
	if author and repo then
		local pasteValue = "'" .. author .. '/' .. repo .. "'"
		return pasteValue
	else
		vim.notify('No GitHub URL found in clipboard')
	end
end

ls.add_snippets('lua', {
	ls.snippet(
		'if',
		fmt(
			[[
    if {} then
      {}
    end
    ]],
			{
				ls.insert_node(1),
				ls.insert_node(2),
			}
		)
	),
	ls.snippet('gp', {
		ls.function_node(get_github_author_and_repo),
	}),
	ls.snippet(
		'rgp',
		fmt(
			[[return {{
  {},
  {}
}}]],
			{
				ls.function_node(get_github_author_and_repo),
				ls.insert_node(1),
			}
		)
	-- fmt(
	--   [[return
	--   {}
	-- ]],
	--   {
	--     -- ls.function_node(get_github_author_and_repo),
	--     ls.insert_node('Hello'),
	--   }
	-- ),
	),
	-- ls.snippet('co', {
	--   ls.dynamic_node(function()
	--     local register_data = vim.fn.getreg() .. ""
	--     if string.match(register_data, '[%d-]+,%s*[%d-]+') then
	--       return ls.snippet_node(nil, {
	--         ls.text_node('position([' .. register_data .. '])')
	--       })
	--     end
	--   end)
	--
	-- })
})
