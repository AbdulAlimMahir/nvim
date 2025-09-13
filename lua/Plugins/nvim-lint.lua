return {
	"mfussenegger/nvim-lint",
	event = "User MasonLspFileType", --{ "BufWritePost", "BufReadPost", "InsertLeave" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			html = { "htmlhint" },           --htmlhint
			css = { "stylelint" },
			javascript = { "biomejs" },      --eslint_d
			typescript = { "biomejs" },      -- eslint_d
			javascriptreact = { "biomejs" }, --eslint_d
			typescriptreact = { "biomejs" }, --eslint_d
			json = { "biomejs" },            -- "jsonlint","biomels/biomejs",
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
