return {
  {
    'garymjr/nvim-snippets',
    enabled = false,
  },
  {
    'L3MON4D3/LuaSnip',
    keys = function()
			-- stylua: ignore
			return {
				{ "<M-tab>", function() return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>" end, expr = true,             silent = true, mode = { "i", 'n' }, },
				{ "<M-tab>", function() require("luasnip").jump(1) end,                                                     mode = "s" },
				{ "<S-tab>", function() require("luasnip").jump(-1) end,                                                    mode = { "i", "s", 'n' } },
			}
    end,
    opts = {
      history = true,
      delete_check_events = 'TextChanged',
      update_events = { 'TextChanged', 'TextChangedI' },
      enable_autosnippets = true,
    },
  },
}
