
-- Load terminal keymaps from keymaps.lua
require("Configs.keymaps").floaterm()

-- State management
local state = {
	floating = {
		buf = nil,
		win = nil,
	},
}

-- Create floating terminal window
local function create_floating_window(opts)
	opts = opts or {}
	local width = opts.width or math.floor(vim.o.columns * 0.6)
	local height = opts.height or math.floor(vim.o.lines * 0.7)

	local col = math.floor((vim.o.columns - width) / 2)
	local row = math.floor((vim.o.lines - height) / 2)

	local buf = state.floating.buf
	if not buf or not vim.api.nvim_buf_is_valid(buf) then
		buf = vim.api.nvim_create_buf(false, true)
		state.floating.buf = buf
		vim.bo[buf].bufhidden = "hide" -- Automatically hide buffer
	end

	local win_config = {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
		style = "minimal",
		border = "rounded",
	}

	local win = vim.api.nvim_open_win(buf, true, win_config)
	vim.cmd("startinsert!") -- Start in insert mode
	return win
end

-- Toggle floating terminal
local function toggle_floating_terminal()
	if state.floating.win and vim.api.nvim_win_is_valid(state.floating.win) then
		vim.api.nvim_win_hide(state.floating.win)
		state.floating.win = nil
	else
		state.floating.win = create_floating_window()
		if vim.bo[state.floating.buf].buftype ~= "terminal" then
			vim.fn.termopen(vim.o.shell)
		end
	end
end

vim.api.nvim_create_user_command("Floaterm", toggle_floating_terminal, {})
