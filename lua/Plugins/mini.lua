return {
	"echasnovski/mini.nvim",
	event = { "VeryLazy" },
	lazy = true,
	version = false, -- [*]Stable, [false]Main
	config = function()
		require("Plugins.Mini.ai")
		require("Plugins.Mini.bracketed")
		require("Plugins.Mini.comment")
		require("Plugins.Mini.completion")
		require("Plugins.Mini.diff")
		require("Configs.keymaps").MiniFiles()
		require("Plugins.Mini.files")
		-- require("Plugins.Mini.icons")
		require("Plugins.Mini.move")
		require("Plugins.Mini.pairs")
		require("Plugins.Mini.surround")
	end,
}
