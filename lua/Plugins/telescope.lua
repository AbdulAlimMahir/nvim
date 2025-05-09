return {
	"nvim-telescope/telescope.nvim",
	cmd = { "Telescope" },
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-telescope/telescope-symbols.nvim" },
		{ "nvim-telescope/telescope-frecency.nvim" },
	},
	require("Configs.keymaps").telescope(),
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local transform_mod = require("telescope.actions.mt").transform_mod
		local trouble = require("trouble")
		local trouble_telescope = require("trouble.sources.telescope")

		-- or create your custom action
		local custom_actions = transform_mod({
			open_trouble_qflist = function(prompt_bufnr)
				trouble.toggle("quickfix")
			end,
		})

		telescope.setup({
			defaults = {
				extensions_list = { "themes", "terms" }, -- copied from NvChad
				path_display = { "smart" },
				color_devicons = true,
				prompt_prefix = "   ",
				selection_caret = "▎ ",
				multi_icon = " │ ",
				winblend = 0,
				borderchars = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" }, --single, double, rounded, none, solid, shadow
				sorting_strategy = "ascending",
				-- layout_strategy = "horizontal", -- cursor is bad
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
					theme = "ivy", -- 'ivy', 'dropdown', 'cursor'
					previewer = true,
					path_display = { "smart" },
					layout_config = {
						prompt_position = "top",
						preview_width = 0.5,
					},
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
					["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
					["<C-t>"] = trouble_telescope.open,
				},
			},
		})
		telescope.load_extension("fzf")
		telescope.load_extension("frecency")
	end,
}
