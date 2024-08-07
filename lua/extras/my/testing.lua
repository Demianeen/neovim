return {
	"nvim-neotest/neotest",
	keys = {
		{
			"<leader>tl",
			function()
				require("neotest").run.run_last()
			end,
			desc = "Run last test",
		},
	},
	opts = {
		icons = {
			marked = "",
			child_indent = "│",
			child_prefix = "├",
			collapsed = "─",
			expanded = "╮",
			failed = "",
			final_child_indent = " ",
			final_child_prefix = "╰",
			non_collapsible = "─",
			passed = "",
			running = "",
			running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
			skipped = "",
			unknown = "",
			watching = "",
		},
	},
}
