return {
	"folke/trouble.nvim",
	-- cmd = { "TroubleToggle", "Trouble" },
	event = "InsertLeave",
	dependencies = {
		"folke/todo-comments.nvim",
		-- "nvim-tree/nvim-web-devicons",
		"echasnovski/mini.icons",
	},
	opts = {
		auto_close = true, -- auto close when there are no items
		auto_open = false, -- auto open when there are items
		auto_preview = false, -- automatically open preview when on an item
		auto_refresh = true, -- auto refresh when open
		auto_jump = false, -- auto jump to the item when there's only one
		focus = false, -- Focus the window when opened
		restore = true, -- restores the last location in the list when opening
		follow = true, -- Follow the current item
		indent_guides = true, -- show indent guides
		max_items = 200, -- limit number of items that can be displayed per section
		multiline = true, -- render multi-line messages
		pinned = false, -- When pinned, the opened trouble window will be bound to the current buffer
		warn_no_results = true, -- show a warning when there are no results
		open_no_results = false, -- open the trou
		win = {}, -- window options for the results window. Can be a split or a floating window.
		-- Window options for the preview window. Can be a split, floating window,
		-- or `main` to show the preview in the main editor window.
		preview = {
			type = "main",
			-- when a buffer is not yet loaded, the preview window will be created
			-- in a scratch buffer with only syntax highlighting enabled.
			-- Set to false, if you want the preview to always be a real loaded buffer.
			scratch = true,
		},
		-- Throttle/Debounce settings. Should usually not be changed.
		---@type table<string, number|{ms:number, debounce?:boolean}>
		throttle = {
			refresh = 20, -- fetches new data when needed
			update = 10, -- updates the window
			render = 10, -- renders the window
			follow = 100, -- follows the current item
			preview = { ms = 100, debounce = true }, -- shows the preview for the current item
		},
		keys = {
			["<esc>"] = "close",
			["?"] = "help",
			r = "refresh",
			R = "toggle_refresh",
			q = "close",
			o = "jump_close",
			-- ["<esc>"] = "cancel",
			["<cr>"] = "jump",
			["<2-leftmouse>"] = "jump",
			["<c-s>"] = "jump_split",
			["<c-v>"] = "jump_vsplit",
			-- j = "next",
			["}"] = "next",
			["]]"] = "next",
			-- k = "prev",
			["{"] = "prev",
			["[["] = "prev",
			dd = "delete",
			d = { action = "delete", mode = "v" },
			i = "inspect",
			p = "preview",
			P = "toggle_preview",
			zo = "fold_open",
			zO = "fold_open_recursive",
			zc = "fold_close",
			zC = "fold_close_recursive",
			za = "fold_toggle",
			zA = "fold_toggle_recursive",
			zm = "fold_more",
			zM = "fold_close_all",
			zr = "fold_reduce",
			zR = "fold_open_all",
			zx = "fold_update",
			zX = "fold_update_all",
			zn = "fold_disable",
			zN = "fold_enable",
			zi = "fold_toggle_enable",
			gb = { -- example of a custom action that toggles the active view filter
				action = function(view)
					view:filter({ buf = 0 }, { toggle = true })
				end,
				desc = "Toggle Current Buffer Filter",
			},
			s = { -- example of a custom action that toggles the severity
				action = function(view)
					local f = view:get_filter("severity")
					local severity = ((f and f.filter.severity or 0) + 1) % 5
					view:filter({ severity = severity }, {
						id = "severity",
						template = "{hl:Title}Filter:{hl} {severity}",
						del = severity == 0,
					})
				end,
				desc = "Toggle Severity Filter",
			},
		},
		modes = {
			diagnostics = {
				auto_open = true,
				auto_preview = false,
			},
			lsp_references = {
				params = {
					include_declaration = true,
				},
			},
			lsp_base = {
				params = {
					-- don't include the current location in the results
					include_current = false,
				},
			},
			symbols = {
				desc = "document symbols",
				mode = "lsp_document_symbols",
				focus = false,
				win = { position = "right" },
				filter = {
					["not"] = { ft = "lua", kind = "Package" },
					any = {
						ft = { "help", "markdown" },
						kind = {
							"Class",
							"Constructor",
							"Enum",
							"Field",
							"Function",
							"Interface",
							"Method",
							"Module",
							"Namespace",
							"Package",
							"Property",
							"Struct",
							"Trait",
						},
					},
				},
			},
		},
		icons = {
			folder_closed = " ",
			folder_open = " ",
			indent = {
				top = "│ ",
				middle = "├╴",
				last = "└╴", -- ╰╴
				fold_open = " ",
				fold_closed = " ",
				ws = "  ",
			},
			kinds = {
				Array = " ",
				Boolean = "󰨙 ",
				Class = " ",
				Constant = "󰏿 ",
				Constructor = " ",
				Enum = " ",
				EnumMember = " ",
				Event = " ",
				Field = " ",
				File = " ",
				Function = "󰊕 ",
				Interface = " ",
				Key = " ",
				Method = "󰊕 ",
				Module = " ",
				Namespace = "󰦮 ",
				Null = " ",
				Number = "󰎠 ",
				Object = " ",
				Operator = " ",
				Package = " ",
				Property = " ",
				String = " ",
				Struct = "󰆼 ",
				TypeParameter = " ",
				Variable = "󰀫 ",
			},
		},
	},
}
