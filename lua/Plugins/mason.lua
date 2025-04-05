return {
	"williamboman/mason.nvim",
	cmd = { "Mason" },
	event = "BufReadPre",
	dependencies = {
		{ "williamboman/mason-lspconfig.nvim", event = "BufReadPre" },
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
	},
	config = function()
		require("mason").setup({
			registries = {
				"github:mason-org/mason-registry",
			},
			providers = {
				"mason.providers.registry-api",
				"mason.providers.client",
			},
			max_concurrent_installers = 3,
			ui = {
				check_outdated_packages_on_open = true,
				border = "rounded", --single, double, rounded, none, solid, shadow
				width = 0.7,
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
			-- (2) LSP
			automatic_installation = true,
			ensure_installed = {
				"html", --HTML
				"cssls", --CSS,SCSS,LESS
				"phpactor", --PHP (Intelephense)
				"tailwindcss", --Tailwind CSS
				"lua_ls", --Lua (formerly "sumneko_lua")
				"clangd", --C/C++
				"pyright", --Python LS
				"ts_ls", --TypeScript
				"taplo", --TOML
				"eslint", --JavaScript, TypeScript
				"bashls", --Bash
				"vimls", --VimScript
				"yamlls", --YAML
				"jedi_language_server", --Django (Python)
				"marksman", --Markdown LSP
				"powershell_es", --PowerShell Script
			},
		})

		require("mason-tool-installer").setup({
			automatic_installation = true,
			ensure_installed = {
				-- (3) DAP
				"codelldb", --C, C++, Rust, Zig
				"cpptools", --C, C++, Rust
				"js-debug-adapter", --JavaScript, TypeScript
				-- (4) Linter
				"htmlhint", --HTML
				"stylelint", --CSS, Sass, SCSS, LESS
				"jsonlint", --JSON
				"selene", --Lua, Luau
				"pylint", --Python
				"eslint_d", --JavaScript, TypeScript
				"markdownlint", --Markdown
				"gitlint",
				-- (5) Formatter
				"black", --Python
				"stylua", --Lua
				"yamlfmt", --YAML
				-- "prettier", --Angular, CSS, Flow, GraphQL, HTML, JSON, JSX, JavaScript, LESS, Markdown, SCSS, TypeScript, Vue, YAML
				"prettierd", --prettier in CLI Deamon
			},
		})
	end,
}
