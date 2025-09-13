return {
	toggles = {
		dim = true,
		git_signs = false,
		mini_diff_signs = false,
		-- diagnostics = false,
		-- inlay_hints = false,
	},
	show = {
		statusline = false, -- can only be shown when using the global statusline
		tabline = false,
	},
	---@type snacks.win.Config
	win = { style = "zen" },
	--- Callback when the window is opened.
	---@param win snacks.win
	on_open = function(win) end,
	--- Callback when the window is closed.
	---@param win snacks.win
	on_close = function(win) end,
	--- Options for the `Snacks.zen.zoom()`
	---@type snacks.zen.Config
	zoom = {
		toggles = {},
		show = { statusline = true, tabline = true },
		win = {
			backdrop = false,
			width = 0, -- full width
		},
	},
	enter = true,
	fixbuf = false,
	minimal = false,
	width = 120,
	height = 0,
	backdrop = { transparent = true, blend = 40 },
	keys = { q = false },
	zindex = 40,
	wo = {
		winhighlight = "NormalFloat:Normal",
	},
	w = {
		snacks_main = true,
	},
}
