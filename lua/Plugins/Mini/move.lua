return {
	-- "echasnovski/mini.move",
	event = { "BufReadPost", "BufNewFile" },
	require("mini.move").setup({
		mappings = {
			-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
			left = "<M-h>",
			right = "<M-l>",
			up = "<M-k>",
			down = "<M-j>",

			-- Move current line in Normal mode
			line_left = "<M-h>",
			line_right = "<M-l>",
			line_up = "<M-k>",
			line_down = "<M-j>",
		},

		-- Options which control moving behavior
		options = {
			-- Automatically reindent selection during linewise vertical move
			reindent_linewise = true,
		},
	}),
}
