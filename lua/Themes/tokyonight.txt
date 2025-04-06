return {
	"folke/tokyonight.nvim",
	lazy = true,
	-- priority = 1000,
	opts = {
		style = "night", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
		light_style = "day", -- The theme is used when the background is set to light
		transparent = true, -- Enable this to disable setting the background color
		terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
		styles = {
			comments = { italic = true },
			keywords = { italic = true },
			functions = {},
			variables = {},
			sidebars = "dark", -- style for sidebars, see below
			floats = "dark", -- style for floating windows
		},
		day_brightness = 0, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
		dim_inactive = true, -- dims inactive windows
		lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
		cache = true, -- When set to true, the theme will be cached for better performance
		plugins = {
			all = package.loaded.lazy == nil,
			auto = true,
		},
	},
}
