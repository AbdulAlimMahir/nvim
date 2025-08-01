return {
	"williamboman/mason.nvim",
	cmd = { "Mason" },
	-- event = "BufReadPre",
	dependencies = {
		{ "williamboman/mason-lspconfig.nvim", event = "BufReadPre" },
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
	},
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
				-- border = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" },
				border = "rounded",
				width = 0.5,
				height = 0.7,
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

		require("mason-lspconfig").setup({
			---|>(2)LSP
			automatic_installation = true,
			ensure_installed = {
				"bashls", --Bash
				"biome", --JSon, JavaScript, TypeScript
				"clangd", --C/C++
				"cssls", --CSS,SCSS,LESS
				-- "eslint", --JavaScript, TypeScript
				"html", --HTML
				-- "jedi_language_server", --Django (Python)
				"lua_ls", --Lua (formerly "sumneko_lua")
				"marksman", --Markdown LSP
				-- "phpactor", --PHP (Intelephense)
				"powershell_es", --PowerShell Script
				"pyright", --Python LS
				"tailwindcss", --Tailwind CSS
				"taplo", --TOML
				"ts_ls", --TypeScript
				-- "vimls", --VimScript
				-- "ast_grep", --C, C++, Rust, Go, Java, Python, C#, JavaScript, JSX, TypeScript, HTML, CSS, Kotlin, Dart, Lua
			},
		})

		require("mason-tool-installer").setup({
			auto_update = true,
			run_on_start = true,
			-- start_delay = 2000, -- 2-second delay to avoid startup lag
			-- debounce_hours = 24, -- Auto-update at most once every 24 hours
			ensure_installed = {
				---|>(3)DAP
				"codelldb", --C, C++, Rust, Zig
				"cpptools", --C, C++, Rust
				"js-debug-adapter", --JavaScript, TypeScript
				---|>(4)Linter
				"cpplint", --C,C++
				-- "eslint_d", --JavaScript, TypeScript
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
			integrations = {
				["mason-lspconfig"] = true,
				["mason-null-ls"] = true,
				["mason-nvim-dap"] = true,
			},
		})
	end,
}
