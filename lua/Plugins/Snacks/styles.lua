-- HACK: Read Styles Docs @ https://github.com/folke/snacks.nvim/blob/main/docs/styles.md

return {
	snacks_image = {
		relative = "cursor",
		border = "rounded",
		focusable = false,
		backdrop = false,
		row = 1,
		col = 1,
		-- width/height are automatically set by the image size unless specified below
	},
	notification = {
		border = "rounded",
		zindex = 100,
		ft = "markdown",
		wo = {
			winblend = 5,
			wrap = false,
			conceallevel = 2,
			colorcolumn = "",
		},
		bo = { filetype = "snacks_notif" },
	},
	notification_history = {
		ight = "Normal:SnacksNotifierHistory",
	},
	keys = { q = "close" },
	border = "rounded",
	zindex = 100,
	width = 0.6,
	height = 0.6,
	minimal = false,
	title = " Notification History ",
	title_pos = "center",
	ft = "markdown",
	bo = { filetype = "snacks_notif_history", modifiable = false },
	-- wo = { winhighl },
}
