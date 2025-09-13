-- HACK: Read Dashboard Docs @ https://github.com/folke/snacks.nvim/blob/main/docs/dashboard.md
return {
<<<<<<< HEAD
  width = 32,
  pane_gap = 4,                                                                -- empty columns between vertical panes
  autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
  preset = {
    -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
    pick = "telescope.nvim",
    keys = {
      { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
      { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
      { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
      {
        icon = " ",
        key = "c",
        desc = "Config",
        action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
      },
      { icon = " ", key = "s", desc = "Restore Session", section = "session" },
      { icon = " ", key = "q", desc = "Quit", action = ":qa" },
    },

    -- "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏",
    -- [[
    -- 🭽▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔🭾
    --▕           NVIM DASHBOARD           ▏
    -- 🭼▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁🭿
    -- ]]
    header = [[
───────────────────────────────────
 NVIM DASHBOARD
───────────────────────────────────]],
  },
  formats = {
    icon = function(item)
      if item.file and item.icon == "file" or item.icon == "directory" then
        return M.icon(item.file, item.icon)
      end
      return { item.icon, width = 2, hl = "icon" }
    end,
    footer = { "%s", align = "center" },
    header = { "%s", align = "center" },
    file = function(item, ctx)
      local fname = vim.fn.fnamemodify(item.file, ":~")
      fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
      if #fname > ctx.width then
        local dir = vim.fn.fnamemodify(fname, ":h")
        local file = vim.fn.fnamemodify(fname, ":t")
        if dir and file then
          file = file:sub(-(ctx.width - #dir - 2))
          fname = dir .. "/…" .. file
        end
      end
      local dir, file = fname:match("^(.*)/(.+)$")
      return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } } or { { fname, hl = "file" } }
    end,
  },
  sections = {
    { section = "header" },
    { section = "keys",   gap = 0, padding = 1 },
    { section = "startup" },
  },
=======
	width = 32,
	row = nil, -- dashboard position. nil for center
	col = nil, -- dashboard position. nil for center
	pane_gap = 4, -- empty columns between vertical panes
	autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
	preset = {
		-- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
		-- pick = nil ,
		keys = {
			{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
			{ icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
			{ icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
			{
				icon = " ",
				key = "c",
				desc = "Config",
				action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
			},
			{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
			{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
		},
		header = [[
::::::::::::::::::::::::::::::::
::     ╔╗╔┌─┐┌─┐╦  ╦┬┌┬┐      ::
::     ║║║├┤ │ │╚╗╔╝││││      ::
::     ╝╚╝└─┘└─┘ ╚╝ ┴┴ ┴      ::
::::::::::::::::::::::::::::::::]],
	},
	formats = {
		icon = function(item)
			if item.file and item.icon == "file" or item.icon == "directory" then
				return M.icon(item.file, item.icon)
			end
			return { item.icon, width = 2, hl = "icon" }
		end,
		footer = { "%s", align = "center" },
		header = { "%s", align = "center" },
		file = function(item, ctx)
			local fname = vim.fn.fnamemodify(item.file, ":~")
			fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
			if #fname > ctx.width then
				local dir = vim.fn.fnamemodify(fname, ":h")
				local file = vim.fn.fnamemodify(fname, ":t")
				if dir and file then
					file = file:sub(-(ctx.width - #dir - 2))
					fname = dir .. "/…" .. file
				end
			end
			local dir, file = fname:match("^(.*)/(.+)$")
			return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } } or { { fname, hl = "file" } }
		end,
	},
	sections = {
		{ section = "header" },
		{ section = "keys", gap = 1, padding = 1 },
		{ section = "startup" },
	},
>>>>>>> 8bd7cd2ba9090bc335c41acd09b11e45de9db629
}
