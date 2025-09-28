return {
	-- "echasnovski/mini.tabline",
	lazy = true,
	require("mini.tabline").setup({
		show_icons = true,

		-- Function which formats the tab label
		-- By default surrounds with space and possibly prepends with icon
		format = nil,

		-- Where to show tabpage section in case of multiple vim tabpages.
		-- One of 'left', 'right', 'none'.
		tabpage_section = "right",
	}),
}
