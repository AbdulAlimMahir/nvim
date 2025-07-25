return {
	"saghen/blink.cmp",
	version = "*",
	build = "cargo build --release",
	event = { "InsertEnter" },
	opts_extend = {
		"sources.completion.enabled_providers",
		"sources.compat",
		"sources.default",
	},
	dependencies = {
		"rafamadriz/friendly-snippets",
		{
			"folke/lazydev.nvim",
			event = "FileType lua",
			-- ft = "lua",
			cmd = "LazyDev",
			opts = {
				library = {
					{ "lazy.nvim" },
					{ path = "luvit-meta/library", words = { "vim%.uv" } },
					{ path = "LazyVim", words = { "LazyVim" } },
					{ path = "wezterm-types", mods = { "wezterm" } },
				},
			},
		},
		{ "Bilal2453/luvit-meta", lazy = true },
	},
	opts = {
		keymap = {
			["<C-y>"] = { "accept", "fallback" },
			["<C-p>"] = { "select_prev", "fallback" },
			["<C-n>"] = { "select_next", "fallback" },

			["<C-d>"] = { "show", "show_documentation", "hide_documentation" },
			["<Tab>"] = { "snippet_forward", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "fallback" },
		},

		appearance = {
			nerd_font_variant = "mono",
		},
		completion = {
			accept = {
				auto_brackets = {
					enabled = true, -- experimental auto-brackets support
				},
			},
			documentation = { auto_show = true, auto_show_delay_ms = 200 },
			menu = {
				draw = {
					treesitter = { "lsp" },
				},
			},
		},
		signature = { enabled = true },
		sources = {
			default = { "lazydev", "lsp", "buffer", "path", "snippets" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
			},
		},
	},
}
