-- Function to fetch theme names from lua/Themes/
local function get_themes_from_folder()
	local themes_dir = vim.fn.stdpath("config") .. "/lua/Themes/"
	if vim.fn.isdirectory(themes_dir) == 0 then
		vim.fn.mkdir(themes_dir, "p")
		print("Created directory: " .. themes_dir)
	end

	local themes = {}
	local files = vim.fn.readdir(themes_dir) or {}
	for _, file in ipairs(files) do
		if file:match("%.lua$") then
			local theme_name = file:gsub("%.lua$", "")
			table.insert(themes, {
				name = theme_name,
				colorscheme = theme_name == "kanagawa" and "kanagawa" or theme_name,
			})
		end
	end
	return themes
end

-- Path to store the last theme inside lua/Themes/
local theme_file = vim.fn.stdpath("config") .. "/lua/Themes/last_theme.txt"

-- Get the last theme name
local function get_last_theme_name()
	local file = io.open(theme_file, "r")
	if file then
		local theme_name = file:read("*line")
		file:close()
		if theme_name and theme_name ~= "" then
			local themes = get_themes_from_folder()
			for _, theme in ipairs(themes) do
				if theme.name == theme_name then
					return theme_name
				end
			end
		end
	end
	return "slate" -- Default to slate if no valid theme
end

-- Load last theme or default to slate
local function load_last_theme()
	local last_theme = get_last_theme_name()
	if last_theme ~= "slate" then
		require("lazy").load({
			plugins = { last_theme == "kanagawa" and "kanagawa-paper" or last_theme },
			priority = 1000,
		})
		vim.cmd("colorscheme " .. (last_theme == "kanagawa" and "kanagawa" or last_theme))
	else
		vim.cmd("colorscheme slate")
	end
end

-- Save selected theme
local function save_theme(theme_name)
	local file = io.open(theme_file, "w")
	if file then
		file:write(theme_name)
		file:close()
	else
		print("Failed to write to " .. theme_file .. ". Check permissions or path.")
	end
end

-- Theme picker function with vim.ui.select (handled by noice.nvim)
local function theme_picker()
	local themes = get_themes_from_folder()
	table.insert(themes, { name = "slate", colorscheme = "slate" })

	if #themes == 0 then
		print("No Colorscheme found in lua/Themes/")
		return
	end

	local theme_names = vim.tbl_map(function(t)
		return t.name
	end, themes)
	local max_width = 0
	for _, name in ipairs(theme_names) do
		max_width = math.max(max_width, #name)
	end
	local window_width = math.min(max_width + 2, 15)

	vim.ui.select(theme_names, {
		prompt = "Select Colorscheme",
		format_item = function(item)
			return " " .. item
		end,
		telescope = nil,
		kind = "custom",
		winopts = {
			width = window_width,
			height = #themes + 2,
			row = math.floor((vim.o.lines - (#themes + 2)) / 2),
			col = math.floor((vim.o.columns - window_width) / 2),
		},
	}, function(choice, idx)
		if choice then
			local theme = themes[idx]
			if theme.name ~= "slate" then
				require("lazy").load({
					plugins = { theme.name == "kanagawa" and "kanagawa-paper" or theme.name },
					priority = 1000,
				})
			end
			vim.cmd("colorscheme " .. theme.colorscheme)
			save_theme(theme.name)
			print("Colorscheme : " .. theme.name)
		end
	end)
end

-- Load last theme on startup
load_last_theme()

-- Keymap to open theme picker
vim.keymap.set("n", "<leader>sC", function()
	theme_picker()
end, { desc = "Custom Theme Picker" })
