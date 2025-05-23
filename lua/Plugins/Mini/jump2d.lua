return {
	-- "echasnovski/mini.jump2d",
	lazy = true,
	keys = { "<CR>" }, -- Load on specific keys for navigation
	require("mini.jump2d").setup({
		-- If `nil` (default) - use |MiniJump2d.default_spotter|
		spotter = nil,

		-- Characters used for labels of jump spots (in supplied order)
		labels = "abcdefghijklmnopqrstuvwxyz",

		-- Options for visual effects
		view = {
			-- Whether to dim lines with at least one jump spot
			dim = false,

			-- How many steps ahead to show. Set to big number to show all steps.
			n_steps_ahead = 0,
		},

		-- Which lines are used for computing spots
		allowed_lines = {
			blank = true, -- Blank line (not sent to spotter even if `true`)
			cursor_before = true, -- Lines before cursor line
			cursor_at = true, -- Cursor line
			cursor_after = true, -- Lines after cursor line
			fold = true, -- Start of fold (not sent to spotter even if `true`)
		},

		-- Which windows from current tabpage are used for visible lines
		allowed_windows = {
			current = true,
			not_current = true,
		},

		-- Functions to be executed at certain events
		hooks = {
			before_start = nil, -- Before jump start
			after_jump = nil, -- After jump was actually done
		},

		-- Module mappings. Use `''` (empty string) to disable one.
		mappings = {
			start_jumping = "<CR>",
		},

		-- Whether to disable showing non-error feedback
		-- This also affects (purely informational) helper messages shown after
		-- idle time if user input is required.
		silent = false,
	}),
}
