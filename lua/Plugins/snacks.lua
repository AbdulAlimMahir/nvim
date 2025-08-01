return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		animate = {
			enabled = vim.fn.has("nvim-0.10") == 1,
			easing = "linear", -- linear
			fps = 60,
			duration = 60,
		},
		bigfile = { enabled = true },
		bufdelete = { enabled = true },
		dashboard = require("Plugins.Snacks.dashboard"),
		dim = require("Plugins.Snacks.dim"),
		explorer = require("Plugins.Snacks.explorer"),
		git = {
			width = 0.6,
			height = 0.6,
			border = "rounded",
			title = " Git Blame ",
			title_pos = "center",
			ft = "git",
		},
		gitbrowse = require("Plugins.Snacks.gitbrowse"),
		health = { enabled = true },
		indent = require("Plugins.Snacks.indent"),
		image = require("Plugins.Snacks.image"),
		input = { enabled = true },
		lazygit = require("Plugins.Snacks.lazygit"),
		notifier = require("Plugins.Snacks.notifier"),
		picker = require("Plugins.Snacks.picker"),
		-- profiler = require("Plugins.Snacks.profiler"),
		quickfile = { enabled = true, exclude = { "latex" } },
		scope = require("Plugins.Snacks.scope"),
		scroll = require("Plugins.Snacks.scroll"),
		statuscolumn = require("Plugins.Snacks.statuscolumn"),
		styles = require("Plugins.Snacks.styles"),
		terminal = require("Plugins.Snacks.terminal"),
		toggle = require("Plugins.Snacks.toggle"),
		words = { enabled = true },
	},
	keys = {
		-- {
		-- 	"<leader>.",
		-- 	function()
		-- 		require("snacks").scratch()
		-- 	end,
		-- 	desc = "Toggle Scratch Buffer",
		-- },
		-- {
		-- 	"<leader>S",
		-- 	function()
		-- 		require("snacks").scratch.select()
		-- 	end,
		-- 	desc = "Select Scratch Buffer",
		-- },
		{
			"<leader>bd",
			function()
				require("snacks").bufdelete()
			end,
			desc = "Close Buffer",
		},

		{
			"<leader>or",
			function()
				require("snacks").rename.rename_file()
			end,
			desc = "Rename File",
		},
		{
			"<leader>gB",
			function()
				require("snacks").gitbrowse()
			end,
			desc = "Git Browse",
		},
		{
			"<leader>gb",
			function()
				require("snacks").git.blame_line()
			end,
			desc = "Git Blame Line",
		},
		{
			"<leader>gf",
			function()
				require("snacks").lazygit.log_file()
			end,
			desc = "Lazygit Current File History",
		},
		{
			"<leader>gg",
			function()
				require("snacks").lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>gl",
			function()
				require("snacks").lazygit.log()
			end,
			desc = "Lazygit Log (cwd)",
		},
		{
			"<leader>oN",
			function()
				require("snacks").notifier.hide()
			end,
			desc = "Dismiss All Notifications",
		},
		{
			"<c-/>",
			function()
				require("snacks").terminal()
			end,
			desc = "Toggle Terminal",
		},
		{
			"<c-_>",
			function()
				require("snacks").terminal()
			end,
			desc = "which_key_ignore",
		},
		{
			"]]",
			function()
				require("snacks").words.jump(vim.v.count1)
			end,
			desc = "Next Reference",
			mode = { "n", "t" },
		},
		{
			"[[",
			function()
				require("snacks").words.jump(-vim.v.count1)
			end,
			desc = "Prev Reference",
			mode = { "n", "t" },
		},
		-- {
		-- 	"<leader>N",
		-- 	desc = "Neovim News",
		-- 	function()
		-- 		Snacks.win({
		-- 			file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
		-- 			width = 0.6,
		-- 			height = 0.6,
		-- 			wo = {
		-- 				spell = false,
		-- 				wrap = false,
		-- 				signcolumn = "yes",
		-- 				statuscolumn = " ",
		-- 				conceallevel = 3,
		-- 			},
		-- 		})
		-- 	end,
		-- },
		------------------------------
		{
			"<leader><space>",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart Find Files",
		},
		-- {
		-- 	"<leader>,",
		-- 	function()
		-- 		Snacks.picker.buffers()
		-- 	end,
		-- 	desc = "Buffers",
		-- },
		{
			"<leader>/",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>on",
			function()
				require("snacks").notifier.show_history()
			end,
			desc = "Notification History",
		},
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},
		{
			"<leader>uc",
			function()
				require("snacks").picker.colorschemes()
			end,
			desc = "Snacks Colorscheme Picker",
		},
	},
	-- init = function()
	-- 	vim.api.nvim_create_autocmd("User", {
	-- 		pattern = "VeryLazy",
	-- 		callback = function()
	-- 			-- Setup some globals for debugging (lazy-loaded)
	-- 			-- _G.dd = function(...)
	-- 			-- 	Snacks.debug.inspect(...)
	-- 			-- end
	-- 			-- _G.bt = function()
	-- 			-- 	Snacks.debug.backtrace()
	-- 			-- end
	-- 			vim.print = _G.dd -- Override print to use snacks for `:=` command

	-- 			-- Create some toggle mappings
	-- 			require("snacks").toggle.option("spell", { name = "Spelling" }):map("<leader>us")
	-- 			require("snacks").toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
	-- 			require("snacks").toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
	-- 			require("snacks").toggle.diagnostics():map("<leader>ud")
	-- 			require("snacks").toggle.line_number():map("<leader>ul")
	-- 			require("snacks").toggle
	-- 				.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
	-- 				:map("<leader>uc")
	-- 			require("snacks").toggle.treesitter():map("<leader>uT")
	-- 			require("snacks").toggle
	-- 				.option("background", { off = "light", on = "dark", name = "Dark Background" })
	-- 				:map("<leader>ub")
	-- 			require("snacks").toggle.inlay_hints():map("<leader>uh")
	-- 		end,
	-- 	})
	-- end,
}
