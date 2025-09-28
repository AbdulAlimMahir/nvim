return {
	"neovim/nvim-lspconfig",
	event = "User MasonLspFileType",
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {
				ui = {
					width = 0.6,
					height = 0.8,
					icons = {
						package_installed = "󰄴",
						package_pending = "󰦗",
						package_uninstalled = "󰄰",
					},
				},
			},
		},
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- vim.api.nvim_create_autocmd("LspAttach", {
		-- 	group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
		-- 	callback = function(event)
		-- 		local map = function(keys, func, desc, mode)
		-- 			mode = mode or "n"
		-- 			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		-- 		end
		-- 		map("grn", vim.lsp.buf.rename, "[R]e[n]ame")
		-- 		map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })
		-- 		map("grr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
		-- 		map("gri", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
		-- 		map("grd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
		-- 		map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
		-- 		map("gO", require("telescope.builtin").lsp_document_symbols, "Open Document Symbols")
		-- 		map("gW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Open Workspace Symbols")
		-- 		map("grt", require("telescope.builtin").lsp_type_definitions, "[G]oto [T]ype Definition")
		-- 	end,
		-- })

		vim.diagnostic.config({
			virtual_text = {
				spacing = 2,
				prefix = "●",
				source = "if_many",
				format = function(diagnostic)
					local diagnostic_message = {
						[vim.diagnostic.severity.ERROR] = diagnostic.message,
						[vim.diagnostic.severity.WARN] = diagnostic.message,
						[vim.diagnostic.severity.INFO] = diagnostic.message,
						[vim.diagnostic.severity.HINT] = diagnostic.message,
					}
					return diagnostic_message[diagnostic.severity]
				end,
			},
			virtual_lines = false,
			underline = { severity = vim.diagnostic.severity.ERROR },
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
			inlay_hints = {
				enabled = true,
				exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
			},
			codelens = {
				enabled = false,
			},
			capabilities = {
				workspace = {
					fileOperations = {
						didRename = true,
						willRename = true,
					},
				},
			},
			float = {
				source = true,
				header = "Diagnostics",
				prefix = " ",
				focusable = true,
				style = "minimal",
				border = "rounded",
			},
		})
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		local lspconfig = require("lspconfig")
		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						runtime = { version = "LuaJIT" },
						completion = { callSnippet = "Replace" },
						workspace = { library = vim.api.nvim_get_runtime_file("", true) },
					},
				},
			},
			html = {
				filetypes = { "html", "templ" }, -- plural
				root_dir = lspconfig.util.root_pattern("package.json", ".git"),
				init_options = {
					provideFormatter = true, -- fixed typo
					embeddedLanguages = { css = true, javascript = true },
					configurationSection = { "html", "css", "javascript" },
				},
			},

			powershell_es = {
				settings = {
					powershell = {
						codeFormatting = { preset = "OTBS" },
					},
				},
				root_dir = lspconfig.util.root_pattern("PSScriptAnalyzerSettings.psd1", ".git"),
				single_file_support = true,
			},
		}
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
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
			---|>(3)DAP
			"codelldb", --C, C++, Rust, Zig
			"cpptools", --C, C++, Rust
			"js-debug-adapter", --JavaScript, TypeScript
			"local-lua-debugger-vscode", --Lua
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
		})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
		require("mason-lspconfig").setup({
			ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
			automatic_installation = false,
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
