return {
	"echasnovski/mini.nvim",
	-- lazy = true,
	event = "User LazyFile",
	version = false, -- [*]Stable, [false]Main
	config = function()
		require("Plugins.Mini.ai")
		require("Plugins.Mini.bracketed")
		-- require("Plugins.Mini.clue")
		require("Plugins.Mini.comment")
		-- require("Plugins.Mini.completion")
		require("Plugins.Mini.diff")
		require("Configs.keymaps").MiniFiles()
		require("Plugins.Mini.files")
		require("Plugins.Mini.icons")
		require("Plugins.Mini.jump")
		require("Plugins.Mini.jump2d")
		require("Plugins.Mini.move")
		require("Plugins.Mini.operators")
		require("Plugins.Mini.pairs")
		require("Plugins.Mini.splitjoin")
		require("Plugins.Mini.surround")
		require("Plugins.Mini.tabline")
	end,
}
