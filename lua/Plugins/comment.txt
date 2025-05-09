return {
	-- ╭─────────────────────────────────────────────────────────╮
	-- │                    COMMENT-BOX.NVIM                     │
	-- ╰─────────────────────────────────────────────────────────╯
	{
		"LudoPinelli/comment-box.nvim",
		cmd = { "CBalbox", "CBlcbox", "CBd", "CBcatalog" },
		keys = {
			{ "<leader>ca", "<cmd>CBalbox<cr>", desc = "Comment Box Auto" },
			{ "<leader>cb", "<cmd>CBlcbox<cr>", desc = "Comment Box Big" },
			{ "<leader>cd", "<cmd>CBd<cr>", desc = "Comment Box Delete" },
			{ "<leader>cl", "<cmd>CBcatalog<cr>", desc = "Comment Box Catalog" },
		},
		opts = {
			line_width = 60,
		},
	},

	-- ╭─────────────────────────────────────────────────────────╮
	-- │                      COMMENT.NVIM                       │
	-- ╰─────────────────────────────────────────────────────────╯
	-- {
	-- 	"numToStr/Comment.nvim",
	-- 	event = { "BufReadPre", "BufNewFile" },
	-- 	dependencies = {
	-- 		{
	-- 			"JoosepAlviste/nvim-ts-context-commentstring",
	-- 			config = function()
	-- 				require("ts_context_commentstring").setup({
	-- 					enable_autocmd = false,
	-- 				})
	-- 			end,
	-- 		},
	-- 	},
	-- },
}
