return {
	{
		"vhyrro/luarocks.nvim",
		priority = 1000, -- high priority is required
		event = "FileType lua",
		config = true,
	},
	{
		"nvim-neorg/neorg",
		lazy = true, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
		enabled = false,
		version = "*", -- Pin Neorg to the latest stable release
		config = true,
		dependencies = {
			{ "nvim-neorg/lua-utils.nvim", lazy = true, after = "nvim-neorg/neorg" },
			{ "pysan3/pathlib.nvim", lazy = true, after = "nvim-neorg/neorg" },
		},
	},
}
