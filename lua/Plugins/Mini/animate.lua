return {
	-- "echasnovski/mini.animate",
	lazy = false,
	require("mini.animate").setup({
		-- Cursor path
		cursor = {
			enable = true,
			-- timing = 200, -- ms
		},

		-- Vertical scroll
		scroll = {
			enable = true,
			-- timing = 200, --ms
			-- subscroll = 60,
		},

		-- Window resize
		resize = {
			enable = true,
			-- timing = 200,
			-- subresize = 60,
		},

		-- Window open
		open = {
			enable = true,
			-- timing = 200,
			-- winconfig = 30,
			-- winblend = 90,
		},

		-- Window close
		close = {
			enable = true,
			-- timing = 200,
			-- winconfig = 30,
			-- winblend = 90,
		},
	}),
}
