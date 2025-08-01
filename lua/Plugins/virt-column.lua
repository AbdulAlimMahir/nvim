return {
	"lukas-reineke/virt-column.nvim",
	event = { "BufReadPost", "BufNewFile", "BufWritePre" },
	opts = {
		char = "╎", --󰮾 󰇝 󱖢  󰙌  ╎
		virtcolumn = "80",
	},
}
