return {
	"cjodo/convert.nvim",
	dependencies = "MunifTanjim/nui.nvim",
	cmd = { "ConvertFindNext", "ConvertFindCurrent", "ConvertAll" },
	config = function()
		require("convert").setup({
			keymaps = {
				focus_next = { "<Down>", "<Tab>" },
				focus_prev = { "<Up>", "<S-Tab>" },
				close = { "<Esc>", "qq" },
				submit = { "<CR>", "<Space>" },
			},
		})
	end,
	require("Configs.keymaps").Convert(),
}
