return {
	"windwp/nvim-ts-autotag",
	event = "InsertEnter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		-- Filetypes to enable autotagging for
		filetypes = {
			"html",
			"css",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"markdown",
		},
		-- Configuration options
		autotag = {
			enable_close = true, -- Auto-close tags
			enable_rename = true, -- Auto-rename matching tags
			enable_close_on_slash = true, -- Close tags when typing </
			skip_tags = { -- Tags that don’t need closing
				"area",
				"base",
				"br",
				"col",
				"embed",
				"hr",
				"img",
				"input",
				"link",
				"meta",
				"source",
				"track",
				"wbr",
			},
		},
	},
}
