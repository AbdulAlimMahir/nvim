return {
	right = { "mark", "sign" }, -- priority of signs on the left (high to low)
	left = { "fold", "git" }, -- priority of signs on the right (high to low)
	folds = {
		open = true, -- show open fold icons
		git_hl = true, -- use Git Signs hl for fold icons
	},
	git = {
		-- patterns to match Git signs
		patterns = { "GitSign", "MiniDiffSign" },
	},
	refresh = 500, -- refresh at most every 50ms
}
