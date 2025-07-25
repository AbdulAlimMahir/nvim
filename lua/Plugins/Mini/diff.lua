return {
	-- "echasnovski/mini.diff",
	lazy = true,
	-- cmd = { "MiniDiffview", "MiniDiffclose", "MiniDiffput", "MiniDiffget" },
	-- event = "User FilePost", --{ "BufReadPre", "BufNewFile" },
	require("mini.diff").setup({
		view = {
			-- Default: 'number' if line numbers are enabled, 'sign' otherwise.
			signs = { add = "▒", change = "▒", delete = "▒" },
			priority = 199,
		},

		source = nil,

		delay = {
			text_change = 500,
		},

		mappings = {
			apply = "gh",
			reset = "gH",
			textobject = "gh",
			goto_first = "[H",
			goto_prev = "[h",
			goto_next = "]h",
			goto_last = "]H",
		},

		options = {
			algorithm = "histogram",
			indent_heuristic = true,
			linematch = 60,
			wrap_goto = false,
		},
	}),
}
