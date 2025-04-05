return {
	{
		"vhyrro/luarocks.nvim",
		priority = 1000, -- high priority is required
		event = "FileType lua",
		config = true,
	},

	{ "nvim-tree/nvim-web-devicons", lazy = false },
}
