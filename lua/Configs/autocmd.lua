
local autocmd = vim.api.nvim_create_autocmd
-------------------------------
--|> NvChad autocmds <| --
autocmd({ "UIEnter", "BufReadPost", "BufNewFile" }, {
	group = vim.api.nvim_create_augroup("NvFilePost", { clear = true }),
	callback = function(args)
		local file = vim.api.nvim_buf_get_name(args.buf)
		local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })

		if not vim.g.ui_entered and args.event == "UIEnter" then
			vim.g.ui_entered = true
		end

		if file ~= "" and buftype ~= "nofile" and vim.g.ui_entered then
			vim.api.nvim_exec_autocmds("User", { pattern = "FilePost", modeline = false })
			vim.api.nvim_del_augroup_by_name("NvFilePost")

			vim.schedule(function()
				vim.api.nvim_exec_autocmds("FileType", {})

				if vim.g.editorconfig then
					require("editorconfig").config(args.buf)
				end
			end)
		end
	end,
})

-------------------------------
--|> Yank Highlight
autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
	pattern = "*",
})

-------------------------------
--|> Neovim's Terminal
autocmd("TermOpen", {
	pattern = "*",
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.signcolumn = "no" -- Hide sign column
		-- vim.opt_local.cursorline = false -- Disable cursorline
	end,
})

-------------------------------
--|> Dynamically set background for Lazy and Mason
-- local function set_plugin_backgrounds()
-- 	-- Get the background color from the current colorscheme
-- 	local normal_bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg or "#1e1efe"
-- 	local normal_fg = vim.api.nvim_get_hl(0, { name = "Normal" }).fg or "#DCf7BA"

-- 	-- Apply the background color to Lazy and Mason highlight groups
-- 	vim.api.nvim_set_hl(0, "LazyNormal", { bg = normal_bg, fg = normal_fg }) -- Adjust 'fg' as needed
-- 	vim.api.nvim_set_hl(0, "MasonNormal", { bg = normal_bg, fg = normal_fg })
-- end

-- -- Run the function on colorscheme change
-- vim.api.nvim_create_autocmd("ColorScheme", {
-- 	pattern = "*",
-- 	callback = set_plugin_backgrounds,
-- })
-- -- Run the function on startup
-- set_plugin_backgrounds()
