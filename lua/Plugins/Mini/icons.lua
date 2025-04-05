return {
	-- "echasnovski/mini.icons",
	lazy = true,
	require("mini.icons").setup({
		style = "glyph",

		-- Customize per category. See `:h MiniIcons.config` for details.
		default = {},
		directory = {},
		extension = {},
		file = {},
		filetype = {
			lazy = "󰒲",
			mason = "󰟾",
			alpha = "󰀫",
			terminal = "",
		},
		lsp = {},
		os = {},

		-- Control which extensions will be considered during "file" resolution
		use_file_extension = function(ext, file)
			return true
		end,
	}),
}
