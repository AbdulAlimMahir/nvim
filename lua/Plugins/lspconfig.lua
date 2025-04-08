return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"saghen/blink.cmp", -- Ensure Blink is integrated
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	event = { "BufReadPre" },
	opts = {},

	config = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		local lspconfig = require("lspconfig")
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,

			--|>Custom LSP Configs <|--
			["lua_ls"] = function()
				lspconfig.lua_ls.setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							diagnostics = { globals = { "vim" } },
							runtime = { version = "LuaJIT" },
							completion = { callSnippet = "Replace" },
							workspace = { library = vim.api.nvim_get_runtime_file("", true) },
						},
					},
				})
			end,

			-- ["powershell_es"] = function()
			-- 	lspconfig.powershell_es.setup({
			-- 		capabilities = capabilities,
			-- 		filetypes = { "ps1", "psm1", "psd1" },
			-- 		single_file_support = true,
			-- 		bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services",
			-- 		settings = {
			-- 			powershell = {
			-- 				codeFormatting = { preset = "OTBS" },
			-- 			},
			-- 		},
			-- 		init_options = {
			-- 			enableProfileLoading = false,
			-- 		},
			-- 	})
			-- end,
		})

		--|> Diagnostics configuration
		vim.diagnostic.config({
			virtual_text = false, --{ spacing = 4, prefix = "●" },
			virtual_lines = false,
			underline = false,
			update_in_insert = false,
			severity_sort = true,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = "󰌵 ",
					[vim.diagnostic.severity.INFO] = " ",
				},
			},
			float = {
				source = true,
				header = "Diagnostics",
				prefix = " ",
				focusable = true,
				style = "minimal",
				border = "single",
			},
		})
	end,
}
