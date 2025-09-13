<<<<<<< HEAD
require("Configs.autocmd")
require("Configs.options")
=======
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
>>>>>>> 8bd7cd2ba9090bc335c41acd09b11e45de9db629
require("Configs.keymaps")

require("Projects.statusline").setup()
require("Projects.terminal")
<<<<<<< HEAD
require("Plugins")
=======

>>>>>>> 8bd7cd2ba9090bc335c41acd09b11e45de9db629
-----------------------
require("Configs.lazy")
