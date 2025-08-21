return {
	"folke/persistence.nvim",
	-- event = "BufReadPre",
	event = { "BufReadPost", "BufNewFile", "BufWritePre" },
	opts = {},
  -- stylua: ignore
  keys = {
    { "<leader>p", "", desc = " Persistence" },
    { "<leader>ps", function() require("persistence").load() end, desc = "Restore Session" },
    { "<leader>pS", function() require("persistence").select() end,desc = "Select Session" },
    { "<leader>pl", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
    { "<leader>pd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
  },
}
