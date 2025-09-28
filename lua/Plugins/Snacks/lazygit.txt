-- HACK: Read LazyGit Docs @ https://github.com/folke/snacks.nvim/blob/main/docs/lazygit.md

return {
	configure = true,
	config = {
		os = { editPreset = "nvim-remote" },
		gui = {
			nerdFontsVersion = "3",
		},
	},
	theme_path = vim.fs.normalize(vim.fn.stdpath("cache") .. "/lazygit-theme.yml"),
	-- Theme for lazygit
	theme = {
		[241] = { fg = "Special" },
		activeBorderColor = { fg = "MatchParen", bold = true },
		cherryPickedCommitBgColor = { fg = "Identifier" },
		cherryPickedCommitFgColor = { fg = "Function" },
		defaultFgColor = { fg = "Normal" },
		inactiveBorderColor = { fg = "FloatBorder" },
		optionsTextColor = { fg = "Function" },
		searchingActiveBorderColor = { fg = "MatchParen", bold = true },
		selectedLineBgColor = { bg = "Visual" }, -- set to `default` to have no background colour
		unstagedChangesColor = { fg = "DiagnosticError" },
	},
	win = {
		style = "lazygit",
	},
}
