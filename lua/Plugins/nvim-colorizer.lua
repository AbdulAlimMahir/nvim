return {
	"NvChad/nvim-colorizer.lua",
	event = "BufReadPost",
	opts = {
		filetypes = {
			"*",
			mason = { names = false, RGB = false },
			lazy = { names = false, RGB = false },
		},
		user_default_options = {
			names = false, -- "Name" codes like Blue or blue
			RGB = true, -- #RGB hex codes
			RRGGBB = true, -- #RRGGBB hex codes
			RRGGBBAA = true, -- #RRGGBBAA hex codes
			AARRGGBB = true, -- 0xAARRGGBB hex codes
			rgb_fn = true, -- CSS rgb() and rgba() functions
			hsl_fn = true, -- CSS hsl() and hsla() functions
			css = true, -- features: rgb_fn, hsl_fn, names, RGB, RRGGBB
			css_fn = true, -- *functions*: rgb_fn, hsl_fn
			tailwind = "both", -- boolean|'normal'|'lsp'|'both'.
			sass = { enable = true, parsers = { "css" } }, -- Enable sass colors
			mode = "background", -- 'background'|'foreground'|'virtualtext'
			virtualtext = "󱓻", --  󱓻 ■ 
			virtualtext_inline = false,
			virtualtext_mode = "foreground", --'background'|'foreground'
			always_update = true,
		},
		buftypes = {},
		user_commands = true, -- Enable all or some usercommands
	},
}
