return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-fzy-native.nvim" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
		-- { "nvim-telescope/telescope-symbols.nvim" },
		{ "nvim-telescope/telescope-frecency.nvim" },
	},
	require("Configs.keymaps").telescope(),
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local transform_mod = require("telescope.actions.mt").transform_mod
		-- local trouble = require("trouble")
		-- local trouble_telescope = require("trouble.sources.telescope")
		local function find_command()
			if 1 == vim.fn.executable("rg") then
				return { "rg", "--files", "--color", "never", "-g", "!.git" }
			elseif 1 == vim.fn.executable("fd") then
				return { "fd", "--type", "f", "--color", "never", "-E", ".git" }
			elseif 1 == vim.fn.executable("fdfind") then
				return { "fdfind", "--type", "f", "--color", "never", "-E", ".git" }
			elseif 1 == vim.fn.executable("find") and vim.fn.has("win32") == 0 then
				return { "find", ".", "-type", "f" }
			elseif 1 == vim.fn.executable("where") then
				return { "where", "/r", ".", "*" }
			end
		end

		-- or create your custom action
		-- local custom_actions = transform_mod({
		-- 	open_trouble_qflist = function()
		-- 		trouble.toggle("quickfix")
		-- 	end,
		-- })

		telescope.setup({
			defaults = {
				extensions_list = { "themes", "terms" }, -- copied from NvChad
				path_display = { "smart" },
				color_devicons = true,
				prompt_prefix = "  ", --  
				selection_caret = " ", -- ▎ 
				entry_prefix = " ",
				multi_icon = " │ ",
				winblend = 0,
				borderchars = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" }, --single, double, rounded, none, solid, shadow
				sorting_strategy = "ascending",
				-- layout_strategy = "horizontal", -- cursor is bad
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
					},
					width = 0.87,
					height = 0.80,
				},
			},

			pickers = {
				buffers = {
					previewer = true,
					theme = "ivy",
					mappings = {
						n = {
							["<C-e>"] = "delete_buffer",
							["l"] = "select_default",
						},
					},
					initial_mode = "normal",
				},
				find_files = {
					find_command = find_command,
					hidden = true,
					-- theme = "ivy", -- 'ivy', 'dropdown', 'cursor'
					-- previewer = true,
					-- path_display = { "smart" },
					-- layout_config = {
					-- 	prompt_position = "top",
					-- 	preview_width = 0.5,
					-- },
				},
				help_tags = {
					theme = "ivy",
				},
				symbols = {
					theme = "ivy",
				},
				registers = {
					theme = "ivy",
				},
				grep_string = {
					initial_mode = "normal",
					theme = "ivy",
				},
				live_grep = {
					theme = "ivy",
				},
				oldfiles = {
					theme = "ivy",
				},
			},

			mappings = {
				i = {
					["<C-k>"] = actions.move_selection_previous, -- move to prev result
					["<C-j>"] = actions.move_selection_next, -- move to next result
					-- ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
					-- ["<C-t>"] = trouble_telescope.open,
				},
			},
			extensions_list = { "themes", "terms" },
			extensions = {},
		})
		-- telescope.load_extension("fzf")
		-- telescope.load_extension("fzy")
		-- telescope.load_extension("frecency")
	end,
}
