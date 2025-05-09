return {
	"stevearc/conform.nvim",
	dependencies = { "mason.nvim" },
	cmd = "ConformInfo",
	event = { "BufWritePre" },
	opts = {
		formatters_by_ft = {
			html = { "prettierd" },
			css = { "prettierd" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			json = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescriptreact = { "prettierd" },
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
