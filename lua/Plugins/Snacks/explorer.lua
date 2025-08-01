return {
	enabled = true,
	{
		finder = "explorer",
		sort = { fields = { "sort" } },
		supports_live = true,
		tree = true,
		watch = true,
		diagnostics = true,
		diagnostics_open = false,
		git_status = true,
		git_status_open = false,
		git_untracked = true,
		follow_file = true,
		focus = "list",
		auto_close = false,
		jump = { close = false },
		-- presets options : "default" , "ivy" , "ivy-split" , "telescope" , "vscode", "select" , "sidebar"
		-- layout = { preset = "sidebar", preview = true },
		formatters = {
			file = { filename_only = true },
			severity = { pos = "right" },
		},
		matcher = { sort_empty = false, fuzzy = false },
		config = function(opts)
			return require("snacks.picker.source.explorer").setup(opts)
		end,
		win = {
			list = {
				keys = {
					["<BS>"] = "explorer_up",
					["l"] = "confirm",
					["h"] = "explorer_close", -- close directory
					["a"] = "explorer_add",
					["d"] = "explorer_del",
					["r"] = "explorer_rename",
					["c"] = "explorer_copy",
					["m"] = "explorer_move",
					["o"] = "explorer_open", -- open with system application
					["P"] = "toggle_preview",
					["y"] = { "explorer_yank", mode = { "n", "x" } },
					["p"] = "explorer_paste",
					["u"] = "explorer_update",
					["<c-c>"] = "tcd",
					["<leader>/"] = "picker_grep",
					["<c-t>"] = "terminal",
					["."] = "explorer_focus",
					["I"] = "toggle_ignored",
					["H"] = "toggle_hidden",
					["Z"] = "explorer_close_all",
					["]g"] = "explorer_git_next",
					["[g"] = "explorer_git_prev",
					["]d"] = "explorer_diagnostic_next",
					["[d"] = "explorer_diagnostic_prev",
					["]w"] = "explorer_warn_next",
					["[w"] = "explorer_warn_prev",
					["]e"] = "explorer_error_next",
					["[e"] = "explorer_error_prev",
				},
			},
		},
	},
}
