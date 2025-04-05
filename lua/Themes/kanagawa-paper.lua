return {
	"thesimonho/kanagawa-paper.nvim",
	name = "kanagawa-paper",
	lazy = true,
	-- priority = 1000,
	config = function()
		require("kanagawa-paper").setup({
			undercurl = true,
			transparent = true,
			gutter = false,
			diag_background = true,
			dim_inactive = true, --Disabled when transparent
			terminal_colors = true,
			cache = true,

			styles = {
				comment = { italic = true },
				functions = { italic = true, bold = false },
				keyword = { italic = false, bold = false },
				statement = { italic = false, bold = false },
				type = { italic = true, bold = false },
			},
			-- override default palette and theme colors
			colors = {
				palette = {},
				theme = {
					ink = {},
					canvas = {},
				},
			},
			-- adjust overall color balance for each theme [-1, 1]
			color_offset = {
				ink = { brightness = 0, saturation = 0 },
				canvas = { brightness = 0, saturation = 0 },
			},
			-- override highlight groups
			-- overrides = function(colors)
			-- 	return {}
			-- end,

			-- uses lazy.nvim, if installed, to automatically enable needed plugins
			auto_plugins = true,
			-- enable highlights for all plugins (disabled if using lazy.nvim)
			all_plugins = package.loaded.lazy == nil,
			-- manually enable/disable individual plugins.
			-- check the `groups/plugins` directory for the exact names
			plugins = {
				blink = true,
				gitsigns = true,
				lazy = true,
				mini = true,
				noice = true,
				nvim_dap_ui = true,
				render_markdown = true,
				snacks = true,
				telescope = true,
				trouble = true,
				which_key = true,
			},

			-- enable integrations with other applications
			integrations = {
				-- automatically set wezterm theme to match the current neovim theme
				wezterm = {
					enabled = true,
					-- neovim will write the theme name to this file
					-- wezterm will read from this file to know which theme to use
					path = (os.getenv("TEMP") or "/tmp") .. "/nvim-theme",
				},
			},
		})
		-- vim.cmd.colorscheme("kanagawa-paper-ink")
	end,
}
