-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

---|>lazy.nvim
require("lazy").setup({
	root = vim.fn.stdpath("data") .. "/lazy", -- directory where plugins will be installed
	defaults = {
		lazy = false, -- should plugins be lazy-loaded?
		version = nil, -- always use the latest git commit
		cond = nil, ---@type boolean|fun(self:LazyPlugin):boolean|nil
	},
	spec = {
		{ import = "Plugins" },
		{ import = "Themes" },
	}, ---@type LazySpec
	-- local_spec = true, -- load project specific .lazy.lua spec files. They will be added at the end of the spec.
	lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json", -- lockfile generated after running update.
	---@type number? limit the maximum amount of concurrent tasks
	concurrency = jit.os:find("Windows") and (vim.uv.available_parallelism() * 1) or nil,
	git = {
		log = { "-8" }, -- show the last 8 commits
		timeout = 120, -- kill processes that take more than 2 minutes
		url_format = "https://github.com/%s.git",
		filter = true,
	},
	pkg = {
		enabled = true,
		cache = vim.fn.stdpath("state") .. "/lazy/pkg-cache.lua",
		versions = true, -- Honor versions in pkg sources
		sources = {
			"lazy",
			"rockspec",
			"packspec",
		},
	},
	rocks = {
		root = vim.fn.stdpath("data") .. "/lazy-rocks",
		server = "https://nvim-neorocks.github.io/rocks-binaries/",
	},
	-- dev = {
	--   ---@type string | fun(plugin: LazyPlugin): string directory where you store your local plugin projects
	--   path = "~/projects",
	--   ---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
	--   patterns = {},    -- For example {"folke"}
	--   fallback = false, -- Fallback to git when local plugin doesn't exist
	-- },
	install = {
		missing = true,
		colorscheme = { "slate" },
	},
	ui = {
		size = { width = 0.7, height = 0.7 },
		wrap = true, -- wrap the lines in the ui
		border = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" }, --single, double, rounded, none, solid, shadow
		backdrop = 80, -- opacity >0 <100
		title = nil, ---@type string only works when border is not "none"
		title_pos = "center", ---@type "center" | "left" | "right"
		pills = true, ---@type boolean
		icons = {
			cmd = "",
			config = "",
			event = "",
			favorite = "",
			ft = "",
			init = "",
			import = "",
			keys = "",
			lazy = "󰒲",
			loaded = "󰄳",
			not_loaded = "○",
			plugin = "",
			runtime = "",
			require = "󰢱",
			source = "",
			start = "",
			task = "✔",
			list = {
				"●",
				"○",
				"",
				"",
			},
		},
		browser = nil, ---@type string?
		throttle = 20, -- how frequently should the ui process render events
		custom_keys = {
			["<localleader>l"] = {
				function(plugin)
					require("lazy.util").float_term({ "lazygit", "log" }, {
						cwd = plugin.dir,
					})
				end,
				desc = "Open lazygit log",
			},

			["<localleader>t"] = {
				function(plugin)
					require("lazy.util").float_term(nil, {
						cwd = plugin.dir,
					})
				end,
				desc = "Open terminal in plugin dir",
			},
		},
	},
	diff = {
		cmd = "git",
	},
	checker = {
		enabled = true, -- check for plugin updates periodically
		notify = true, -- get a notification when new updates are found
		frequency = 86400, -- check for updates once per day
		check_pinned = true, -- check for pinned packages that can't be updated
	},
	change_detection = {
		enabled = true,
		notify = true, -- get a notification when changes are found
	},
	performance = {
		cache = {
			enabled = true,
		},
		reset_packpath = true, -- reset the package path to improve startup time
		rtp = {
			reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
			paths = {}, -- add any custom paths here that you want to includes in the rtp
			disabled_plugins = {
				"gzip",
				-- "matchit",
				-- "matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
	readme = {
		enabled = true,
		root = vim.fn.stdpath("state") .. "/lazy/readme",
		files = { "README.md", "lua/**/README.md" },
		-- only generate markdown helptags for plugins that dont have docs
		skip_if_doc_exists = true,
	},
	state = vim.fn.stdpath("state") .. "/lazy/state.json", -- state info for checker and other things
	profiling = {
		loader = true,
		require = true,
	},
})
