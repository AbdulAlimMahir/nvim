return {
	-- Mason core
	{
		"williamboman/mason.nvim",
		event = "VeryLazy",
		config = function()
			require("mason").setup({
				log_level = vim.log.levels.INFO,
				max_concurrent_installers = 1,
				registries = {
					"github:mason-org/mason-registry",
				},
				providers = {
					"mason.providers.registry-api",
					"mason.providers.client",
				},
				ui = {
					check_outdated_packages_on_open = true,
					---|>Border single, double, rounded, none, solid, shadow
					border = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" },
					width = 0.6,
					height = 0.8,
					icons = {
						package_installed = "󰄴",
						package_pending = "󰦗",
						package_uninstalled = "󰄰",
					},
				},
				keymaps = {
					toggle_package_expand = "<CR>",
					install_package = "i",
					update_package = "u",
					check_package_version = "c",
					update_all_packages = "U",
					check_outdated_packages = "C",
					uninstall_package = "X",
					cancel_installation = "<C-c>",
					apply_language_filter = "<C-f>",
					toggle_package_install_log = "<CR>",
					toggle_help = "g?",
				},
			})
		end,
	},

	-- Mason LSP bridge
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
		config = function()
			require("mason-lspconfig").setup({
				automatic_installation = true,
				ensure_installed = {
					"bashls", --Bash
					"biome", --JSon, JavaScript, TypeScript
					"clangd", --C/C++
					"cssls", --CSS,SCSS,LESS
					"html", --HTML
					"lua_ls", --Lua (formerly "sumneko_lua")
					"marksman", --Markdown LSP
					"powershell_es", --PowerShell Script
					"pyright", --Python LS
					"tailwindcss", --Tailwind CSS
					"taplo", --TOML
					"ts_ls", --TypeScript
				},
			})
		end,
	},

	-- Mason tool installer (DAPs, linters, formatters)
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				auto_update = true,
				run_on_start = true,
				start_delay = 300,
				debounce_hours = 12,
				ensure_installed = {
					---|>(3)DAP
					"codelldb", --C, C++, Rust, Zig
					"cpptools", --C, C++, Rust
					"js-debug-adapter", --JavaScript, TypeScript
					---|>(4)Linter
					"cpplint", --C,C++
					"gitlint",
					"htmlhint", --HTML
					"jsonlint", --JSON
					"markdownlint", --Markdown
					"pylint", --Python
					"selene", --Lua, Luau
					"stylelint", --CSS, Sass, SCSS, LESS
					---|>(5)Formatter
					"black", --Python
					"prettierd", --prettier in CLI Deamon
					"stylua", --Lua
				},
			})
		end,
	},
}
