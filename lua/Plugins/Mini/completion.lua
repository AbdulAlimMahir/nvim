return {
	"echasnovski/mini.completion",
	lazy = true,
	event = { "InsertEnter" }, -- BufReadPost, BufNewFile, UIEnter
	dependencies = { "rafamadriz/friendly-snippets" },
	opts = {
		-- Delay (debounce type, in ms) between certain Neovim event and action.
		-- This can be used to (virtually) disable certain automatic actions by
		-- setting very high delay time (like 10^7).
		delay = { completion = 100, info = 100, signature = 50 },

		-- Configuration for action windows:
		-- - `height` and `width` are maximum dimensions.
		-- - `border` defines border (as in `nvim_open_win()`).
		window = {
			info = { height = 25, width = 80, border = "single" },
			signature = { height = 25, width = 80, border = "single" },
		},

		-- Way of how module does LSP completion
		lsp_completion = {
			-- `source_func` should be one of 'completefunc' or 'omnifunc'.
			source_func = "completefunc",

			-- `auto_setup` should be boolean indicating if LSP completion is set up
			-- on every `BufEnter` event.
			auto_setup = true,

			-- A function which takes LSP 'textDocument/completion' response items
			-- and word to complete. Output should be a table of the same nature as
			-- input items. Common use case is custom filter/sort.
		},

		-- Module mappings. Use `''` (empty string) to disable one. Some of them
		-- might conflict with system mappings.
		mappings = {
			force_twostep = "<C-Space>", -- Force two-step completion
			force_fallback = "<A-Space>", -- Force fallback completion
		},

		-- Whether to set Vim's settings for better experience (modifies
		-- `shortmess` and `completeopt`)
		set_vim_settings = true,
	},
}
