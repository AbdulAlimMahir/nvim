return {
	-- "echasnovski/mini.diff",
	enabled = false,
	lazy = true,
	event = "VeryLazy",
	require("mini.diff").setup({
		view = {
			-- Default: 'number' if line numbers are enabled, 'sign' otherwise.
			style = "sign",
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
