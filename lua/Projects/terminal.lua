vim.api.nvim_create_autocmd("TermOpen", {
	-- pattern = "*",
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
		vim.opt.signcolumn = "no" -- Hide sign column
		-- vim.opt_local.cursorline = false -- Disable cursorline
	end,
})

vim.keymap.set("n", "<space>tt", function()
	vim.cmd.new()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 15)
end)
