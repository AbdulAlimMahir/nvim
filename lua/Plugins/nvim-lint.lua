return {
	"mfussenegger/nvim-lint",
	event = { "BufWritePost" },
	ft = {
		"javascript",
		"typescript",
		"javascriptreact",
		"typescriptreact",
		"lua",
		"python",
		"go",
		"c",
		"cpp",
		"html",
		"css",
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			html = { "htmlhint" }, --htmlhint
			css = { "stylelint" },
			javascript = { "eslint_d" }, --eslint_d
			typescript = { "eslint_d" }, -- eslint_d
			json = { "jsonlint" }, -- "jsonlint","biomels/biomejs",
			javascriptreact = { "eslint_d" }, --eslint_d
			typescriptreact = { "eslint_d" }, --eslint_d
			python = { "pylint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
		------------------------------------------------
		vim.keymap.set("n", "<leader>ll", function()
			lint.try_lint()
		end, { desc = "Trigger Linting Here" })
	end,
}
