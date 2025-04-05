return {
	-- "echasnovski/mini.files",
	cmd = "MiniFiles", -- Load on file explorer command
	require("mini.files").setup({
		content = {
			filter = nil,
			prefix = nil,
			sort = ascending,
		},

		mappings = {
			close = "q",
			go_in = "l",
			go_in_plus = "L",
			go_out = "h",
			go_out_plus = "H",
			mark_goto = "'",
			mark_set = "m",
			reset = "<BS>",
			reveal_cwd = "@",
			show_help = "g?",
			synchronize = "s",
			trim_left = "<",
			trim_right = ">",
		},

		options = {
			permanent_delete = false,
			use_as_default_explorer = true,
		},

		windows = {
			max_number = math.huge,
			preview = true,
			width_focus = 30,
			width_nofocus = 30,
			width_preview = 60,
		},
	}),
	vim.api.nvim_create_autocmd("User", {
		pattern = "MiniFilesActionRename",
		callback = function(event)
			Snacks.rename.on_rename_file(event.data.from, event.data.to)
		end,
	}),
}
