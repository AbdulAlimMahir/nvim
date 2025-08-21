if vim.env.PROF then
	local snacks = vim.fn.stdpath("data") .. "/lazy/snacks.nvim"
	vim.opt.rtp:append(snacks)
	require("snacks.profiler").startup({
		startup = {
			event = "VimEnter", -- stop profiler on this event. Defaults to `VimEnter`
		},
	})
end
require("Configs.options")
require("Configs.autocmd")
require("Configs.keymaps")

require("Projects.statusline").setup()
require("Projects.terminal")

-----------------------
require("Configs.lazy")
