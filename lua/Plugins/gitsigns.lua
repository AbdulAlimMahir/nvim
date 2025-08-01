return {
	"lewis6991/gitsigns.nvim",
	event = "User MasonLspFileType", --"BufReadPost",
	config = function()
		local success, gitsigns = pcall(require, "gitsigns")
		if not success then
			vim.notify("Error loading plugin: gitsigns")
			return
		end

		gitsigns.setup({
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "│" },
				topdelete = { text = "│" },
				changedelete = { text = "│" },
				untracked = { text = "│" }, -- ▎ 
			},

			signcolumn = true,
			numhl = false,
			linehl = false,
			word_diff = false,

			watch_gitdir = {
				interval = 1000,
				follow_files = true,
			},

			attach_to_untracked = true,
			current_line_blame = false,

			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol",
				delay = 1000,
				ignore_whitespace = true,
			},

			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil,
			max_file_length = 10000,

			preview_config = {
				border = "single",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
		})

		vim.keymap.set("n", "<leader>k", gitsigns.preview_hunk)
		vim.keymap.set("n", "<leader>u", gitsigns.reset_hunk)
		vim.keymap.set("n", "<leader>x", gitsigns.diffthis)
		vim.keymap.set("n", "<leader>z", "<cmd>wincmd p | q<return>")

		vim.keymap.set("n", "<C-g>", gitsigns.stage_hunk)
		vim.keymap.set("n", "<C-f>", gitsigns.stage_buffer)
		vim.keymap.set("n", "<C-e>", gitsigns.blame_line)
		vim.keymap.set("n", "<C-a>", gitsigns.blame)
	end,
}
