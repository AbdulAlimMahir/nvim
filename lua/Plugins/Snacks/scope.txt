-- HACK: Read Scope Docs @ https://github.com/folke/snacks.nvim/blob/main/docs/scope.md

return {
	min_size = 2,
	max_size = nil,
	cursor = true, -- when true, the column of the cursor is used to determine the scope
	edge = true, -- include the edge of the scope (typically the line above and below with smaller indent)
	siblings = false, -- expand single line scopes with single line siblings
	filter = function(buf)
		return vim.bo[buf].buftype == ""
	end,
	debounce = 30, -- in ms
	treesitter = {
		enabled = true,
		injections = true, -- include language injections when detecting scope (useful for languages like `vue`)
		blocks = {
			enabled = false, -- enable to use the following blocks
			"function_declaration",
			"function_definition",
			"method_declaration",
			"method_definition",
			"class_declaration",
			"class_definition",
			"do_statement",
			"while_statement",
			"repeat_statement",
			"if_statement",
			"for_statement",
		},
		field_blocks = {
			"local_declaration",
		},
	},
	keys = {
		textobject = {
			ii = {
				min_size = 2, -- minimum size of the scope
				edge = false, -- inner scope
				cursor = false,
				treesitter = { blocks = { enabled = false } },
				desc = "inner scope",
			},
			ai = {
				cursor = false,
				min_size = 2, -- minimum size of the scope
				treesitter = { blocks = { enabled = false } },
				desc = "full scope",
			},
		},
		jump = {
			["[i"] = {
				min_size = 1, -- allow single line scopes
				bottom = false,
				cursor = false,
				edge = true,
				treesitter = { blocks = { enabled = false } },
				desc = "jump to top edge of scope",
			},
			["]i"] = {
				min_size = 1, -- allow single line scopes
				bottom = true,
				cursor = false,
				edge = true,
				treesitter = { blocks = { enabled = false } },
				desc = "jump to bottom edge of scope",
			},
		},
	},
}
