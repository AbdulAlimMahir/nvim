require("Configs.options")
require("Configs.autocmd")
require("Configs.keymaps")
-- require("Configs.cmdUtils")

--|>[ Projects ]<|--
require("Projects.statusline").setup()
require("Projects.floaterm")
-- require("Projects.theme_picker").load_last_theme()

-----------------------
require("Configs.lazy")
-----------------------

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

-- Static plugin specs (all lazy by default)
local plugins = {
	-- Catppuccin
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
		config = function()
			require("Themes.catppuccin")
		end,
	},
	-- Kanagawa-Paper
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa-paper",
		lazy = true,
		config = function()
			require("Themes.kanagawa")
		end,
	},
}

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
		-- Load with high priority for the current theme
		require("lazy").load({ plugins = { last_theme }, priority = 1000 })
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

-- Theme picker function with Telescope
local function theme_picker()
	local themes = get_themes_from_folder()
	table.insert(themes, { name = "slate", colorscheme = "slate" })

	if #themes == 0 then
		print("No themes found in lua/Themes/")
		return
	end

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Select Theme",
			finder = require("telescope.finders").new_table({
				results = themes,
				entry_maker = function(entry)
					return {
						value = entry,
						display = entry.name,
						ordinal = entry.name,
					}
				end,
			}),
			sorter = require("telescope.config").values.generic_sorter({}),
			attach_mappings = function(prompt_bufnr)
				local actions = require("telescope.actions")
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = require("telescope.actions.state").get_selected_entry()
					if selection then
						local theme = selection.value
						if theme.name ~= "slate" then
							require("lazy").load({ plugins = { theme.name }, priority = 1000 })
						end
						vim.cmd("colorscheme " .. theme.colorscheme)
						save_theme(theme.name)
						print("Theme set to: " .. theme.name)
					end
				end)
				return true
			end,
			layout_strategy = "vertical",
			layout_config = {
				height = 0.3,
				width = 0.4,
				prompt_position = "top",
				mirror = true,
			},
		})
		:find()
end

-- Load last theme on startup
load_last_theme()

-- Keymap to open theme picker
vim.keymap.set("n", "<leader>tt", function()
	theme_picker()
end, { desc = "Open Theme Picker" })
