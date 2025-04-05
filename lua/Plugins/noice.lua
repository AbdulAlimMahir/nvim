return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	opts = {
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
			message = {
				enabled = true,
				view = "mini",
			},
		},
		presets = {
			bottom_search = true, -- use a classic bottom cmdline for search
			command_palette = true, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = true, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
		messages = {
			enabled = true, -- enables the Noice messages UI
			view = "mini", -- default view for messages
			view_error = "mini", -- view for errors
			view_warn = "mini", -- view for warnings
			view_history = "mini", -- view for :messages
			view_search = "mini", -- view for search count messages. Set to `false` to disable
		},
		notify = {
			enabled = true,
			view = "mini",
		},
		routes = {
			{
				view = "mini",
				filter = { event = "msg_showmode" },
			},
		},
		cmdline = {
			view = "cmdline_popup", -- cmdline | cmdline_popup
			format = {
				cmdline = { pattern = "^:", icon = " ❯", lang = "vim", title = " cmdline " },
			},
		},
		views = {
			cmdline_popup = {
				position = {
					row = "100%",
					col = "50%",
				},
				size = {
					height = "auto",
					width = "50%",
				},
				border = {
					paadding = { 1, 1 },
					style = "none",
				},
			},
			mini = {
				timeout = 2000, -- timeout in milliseconds
				align = "center",
				position = {
					row = "95%",
					col = "100%",
				},
			},
			popupmenu = {
				enabled = true, -- enables the Noice popupmenu UI
				backend = "cmp", -- backend to use to show regular cmdline completions
				relative = "editor",
				position = {
					row = "96%",
					col = "35%",
				},
				size = {
					height = "30%",
					width = "30%",
				},
				border = {
					style = "none",
					-- padding = { 1, 1 },
				},
				win_options = {
					winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
				},
			},
		},
	},
}
