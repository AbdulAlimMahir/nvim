return {
	"stevearc/conform.nvim",
	lazy = true,
	cmd = "ConformInfo",
	event = "BufWritePre",
	keys = {
		{
			"<leader>cF",
			function()
				require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
			end,
			mode = { "n", "v" },
			desc = "Format Injected Langs",
		},
	},
	opts = {
		timeout_ms = 3000,
		async = false, -- not recommended to change
		quiet = false, -- not recommended to change
		lsp_format = "fallback", -- not recommended to change
		formatters_by_ft = {
			html = { "prettierd" },
			css = { "biome-check" },
			javascript = { "biome-check" },
			typescript = { "biome-check" },
			javascriptreact = { "biome-check" },
			typescriptreact = { "biome-check" },
			json = { "biome-check" },
			yaml = { "prettierd" },
			markdown = { "prettierd" },
			graphql = { "prettierd" },
			lua = { "stylua" },
			python = { "black" },
		},
		format_on_save = {
			lsp_fallback = true,
			async = false,
			timeout_ms = 1000,
		},
	},
}
