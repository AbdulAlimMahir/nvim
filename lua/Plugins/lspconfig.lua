return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"saghen/blink.cmp", -- Ensure Blink is integrated
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	event = { "BufReadPre" },

	config = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		local lspconfig = require("lspconfig")
		require("mason-lspconfig").setup({
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,

			--|> Custom LSP Configs <|--
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

			["powershell_es"] = function()
				lspconfig.powershell_es.setup({
					capabilities = capabilities,
					-- cmd = {
					-- 	"pwsh",
					-- 	"-NoLogo",
					-- 	"-NoProfile",
					-- 	"-Command",
					-- 	"Import-Module PowerShellEditorServices; Start-EditorServices -HostName 'nvim' -HostProfileId 'nvim' -HostVersion '1.0.0' -LogLevel 'Information' -LogPath '$HOME/.cache/nvim/pses.log' -SessionDetailsPath '$HOME/.cache/nvim/pses.session.json'",
					-- },
					settings = {
						powershell = {
							codeFormatting = { preset = "OTBS" },
						},
					},
					root_dir = lspconfig.util.root_pattern("PSScriptAnalyzerSettings.psd1", ".git"),
					single_file_support = true,
				})
			end,
		})

		--|> Setup Blink
		require("blink.cmp").setup({
			sources = {
				default = { "lsp", "buffer", "path", "snippets" },
			},
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
