-- HACK: Read Dim Docs @ https://github.com/folke/snacks.nvim/blob/main/docs/dim.md

return {
	enabled = true,
	scope = {
		min_size = 5,
		max_size = 20,
		siblings = true,
	},
	animate = {
		enabled = vim.fn.has("nvim-0.10") == 1,
		easing = "outQuad",
		duration = {
			step = 20, -- ms per step
			total = 300, -- maximum duration
		},
	},
	filter = function(buf)
		return vim.g.snacks_dim ~= false and vim.b[buf].snacks_dim ~= false and vim.bo[buf].buftype == ""
	end,
}
