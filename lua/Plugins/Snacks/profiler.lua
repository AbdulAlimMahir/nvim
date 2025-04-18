-- HACK: Read Profilier Docs @ https://github.com/folke/snacks.nvim/blob/main/docs/profiler.md

return {
	autocmds = true,
	runtime = vim.env.VIMRUNTIME, ---@type string
	opts = function()
		require("snacks").toggle.profiler():map("<leader>pp")
		require("snacks").toggle.profiler_highlights():map("<leader>ph")
	end,
	thresholds = {
		time = { 2, 10 },
		pct = { 10, 20 },
		count = { 10, 100 },
	},
	on_stop = {
		highlights = true, -- highlight entries after stopping the profiler
		pick = true, -- show a picker after stopping the profiler (uses the `on_stop` preset)
	},
	highlights = {
		min_time = 0, -- only highlight entries with time > min_time (in ms)
		max_shade = 20, -- time in ms for the darkest shade
		badges = { "time", "pct", "count", "trace" },
		align = 80,
	},
	pick = {
		picker = "auto",
		badges = { "time", "count", "name" },
		preview = {
			badges = { "time", "pct", "count" },
			align = "right",
		},
	},
	startup = {
		event = "VimEnter", -- stop profiler on this event. Defaults to `VimEnter`
		after = true, -- stop the profiler **after** the event. When false it stops **at** the event
		pattern = nil, -- pattern to match for the autocmd
		pick = true, -- show a picker after starting the profiler (uses the `startup` preset)
	},
	presets = {
		startup = { min_time = 1, sort = false },
		on_stop = {},
		filter_by_plugin = function()
			return { filter = { def_plugin = vim.fn.input("Filter by plugin: ") } }
		end,
	},
	globals = {
		"vim",
		"vim.api",
		"vim.keymap",
		"Snacks.dashboard.Dashboard",
	},
	filter_mod = {
		default = true, -- default value for unmatched patterns
		["^vim%."] = false,
		["mason-core.functional"] = false,
		["mason-core.functional.data"] = false,
		["mason-core.optional"] = false,
		["which-key.state"] = false,
	},
	filter_fn = {
		default = true,
		["^.*%._[^%.]*$"] = false,
		["trouble.filter.is"] = false,
		["trouble.item.__index"] = false,
		["which-key.node.__index"] = false,
		["smear_cursor.draw.wo"] = false,
		["^ibl%.utils%."] = false,
	},
	icons = {
		time = " ",
		pct = " ",
		count = " ",
		require = "󰋺 ",
		modname = "󰆼 ",
		plugin = " ",
		autocmd = "⚡",
		file = " ",
		fn = "󰊕 ",
		status = "󰈸 ",
	},
}
