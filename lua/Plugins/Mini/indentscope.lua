return {
	"echasnovski/mini.indentscope",
	enabled = false,
	event = { "User FilePost" }, --"BufReadPost"
	require("mini.indentscope").setup({
		options = {
			-- border = "both",
			-- indent_at_cursor = true,
			try_as_border = true,
			symbol = "╎", --
		},

		-- init = function()
		-- 	vim.api.nvim_create_autocmd("FileType", {
		-- 		pattern = {
		-- 			"Trouble",
		-- 			"alpha",
		-- 			"dashboard",
		-- 			"fzf",
		-- 			"help",
		-- 			"lazy",
		-- 			"mason",
		-- 			"neo-tree",
		-- 			"notify",
		-- 			"snacks_dashboard",
		-- 			"snacks_notif",
		-- 			"snacks_terminal",
		-- 			"snacks_win",
		-- 			"toggleterm",
		-- 			"trouble",
		-- 		},
		-- 		callback = function()
		-- 			vim.b.miniindentscope_disable = true
		-- 		end,
		-- 	})
		-- end,
	}),
}
