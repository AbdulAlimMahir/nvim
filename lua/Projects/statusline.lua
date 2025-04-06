local M = {}
--|>-----| Sections |-----<|--
--|> bufferCount
M.bufferCount = function()
	local buffers = vim.fn.execute("ls")
	local count = 0
	for line in string.gmatch(buffers, "[^\r\n]+") do
		if string.match(line, "^%s*%d+") then
			count = count + 1
		end
	end
	return "%#bufferCount# " .. " " .. count .. ""
end
--|> file name
M.file_name = function()
	local devicons = require("nvim-web-devicons") -- Ensure this plugin is installed
	local filename = vim.fn.expand("%:t") -- Get the current filename
	local file_ext = vim.fn.expand("%:e") -- Get the file extension
	local file_icon, icon_color = devicons.get_icon_color(filename, file_ext, { default = true })
	local is_modified = vim.bo.modified
	local file_name_bg = vim.api.nvim_get_hl(0, { name = "file_name" }).bg or "NONE"
	local icon_highlight = "StatuslineFileIcon"
	local buf_ft = vim.bo.filetype -- Filetype of current buffer
	local buf_type = vim.bo.buftype -- Check special buffer type (e.g., terminal)

	local special_names = {
		["alpha"] = "Alpha", -- For Alpha plugin
		["mason"] = "Mason", -- For Mason plugin
		["lazy"] = "Lazy", -- For Lazy plugin
		["terminal"] = "Terminal", -- For terminal buffers
	}

	-- Handle special cases or default to regular file name
	local display_name
	if buf_type == "terminal" then
		display_name = special_names["terminal"]
	elseif special_names[buf_ft] then
		display_name = special_names[buf_ft]
	else
		display_name = vim.fn.expand("%:t") -- Get file name
	end
	vim.api.nvim_set_hl(0, icon_highlight, { fg = icon_color, bg = file_name_bg, bold = true })
	return string.format(
		" %%#%s# %s %%#file_name#%s ",
		icon_highlight,
		file_icon or "",
		display_name .. (is_modified and " " or "")
	)
end

--|>git branch
M.git_branch = function()
	local branch = vim.b.gitsigns_head
	if not branch then
		return ""
	end
	local status = vim.b.gitsigns_status_dict or {}
	local added, changed, removed = status.added or 0, status.changed or 0, status.removed or 0
	return table.concat({
		"%#GitBranch#  ", -- Branch icon and name
		branch,
		" ",
		added > 0 and "%#GitAdded# " .. added .. " " or "", -- Green for added
		removed > 0 and "%#GitRemoved#󰍷 " .. removed .. " " or "", -- Red for removed
		changed > 0 and "%#GitChanged#󱗝 " .. changed .. " " or "", -- Yellow for changed
	})
end

--|> contexts [Python]
M.contexts = function()
	if vim.bo.filetype ~= "python" then
		return ""
	end
	local ts_ok, ts = pcall(require, "nvim-treesitter")
	if not ts_ok then
		return ""
	end

	local context = ts.statusline({
		type_patterns = { "class", "function", "method" },
		transform_fn = function(line)
			return line:gsub("class%s*", ""):gsub("def%s*", ""):gsub(":%s*$", ""):gsub("%s*[%(%{%[].*[%]%}%)]*%s*$", "")
		end,
		separator = " -> ",
		allow_duplicates = false,
	})
	return context and "%#contexts#" .. context .. " " or ""
end

--|> assign highlight group to the separator
M.separator = function()
	return "%#separator#%= "
end

--|> Lazy & Mason <|--
M.lazy_updates = function()
	local lazy_ok, lazy_status = pcall(require, "lazy.status")
	if not lazy_ok or not lazy_status.has_updates() then
		return ""
	end
	local count = tonumber(lazy_status.updates():match("%d+")) or 0
	return count > 0 and "%#lazyUpdates# 󰒲 " .. count .. " " or ""
end

--|> diagnostics
M.diagnostics = function()
	local diagnostics = vim.diagnostic.get(0)
	if #diagnostics == 0 then
		return ""
	end

	local counts = { E = 0, W = 0, H = 0, I = 0 }
	for _, diag in ipairs(diagnostics) do
		if diag.severity == vim.diagnostic.severity.ERROR then
			counts.E = counts.E + 1
		elseif diag.severity == vim.diagnostic.severity.WARN then
			counts.W = counts.W + 1
		elseif diag.severity == vim.diagnostic.severity.HINT then
			counts.H = counts.H + 1
		elseif diag.severity == vim.diagnostic.severity.INFO then
			counts.I = counts.I + 1
		end
	end

	local parts = {}
	if counts.E > 0 then
		table.insert(parts, "%#StatuslineE#  " .. counts.E)
	end
	if counts.W > 0 then
		table.insert(parts, "%#StatuslineW#  " .. counts.W)
	end
	if counts.H > 0 then
		table.insert(parts, "%#StatuslineH#  " .. counts.H)
	end
	if counts.I > 0 then
		table.insert(parts, "%#StatuslineI#  " .. counts.I)
	end
	return table.concat(parts, "") .. " "
end

--|> bufferLSP
M.bufferLSP = function()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if #clients == 0 then
		return "%#bufferLSP# 󱏎 LSP "
	end
	local names = {}
	for _, client in ipairs(clients) do
		table.insert(names, client.name)
	end
	return "%#bufferLSP# 󰒓 " .. table.concat(names, ", ") .. " "
end

--|> current mode
M.current_mode = function()
	local mode = vim.fn.mode()
	local mode_icons = {
		n = " ",
		v = " ",
		i = "󰣕 ",
		r = " ",
		t = " ",
		V = "󰝠 ",
		c = " ",
		S = "󱈄 ",
		R = " ",
		[""] = " ",
	}
	return "%#mode# " .. (mode_icons[mode] or " ")
end

--|>-----| structure |-----<|--
M.setup = function()
	_G.Status_line = function()
		return table.concat({
			M.bufferCount(),
			M.file_name(),
			M.git_branch(),
			M.contexts(),
			M.separator(),
			M.lazy_updates(),
			M.diagnostics(),
			M.bufferLSP(),
			M.current_mode(),
		})
	end

	--|>-----| colors |-----<|--
	local function get_color(group, attr)
		local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
		return hl and hl[attr] or nil
	end

	-- Dynamically set colors for the statusline
	local function set_statusline_colors()
		local bg = get_color("Normal", "bg")
		local fg = get_color("Normal", "fg")
		local visual = get_color("Visual", "bg")
		local accent = get_color("String", "fg") or 142 -- Green for added
		local muted = get_color("Comment", "fg") or 245 -- Muted gray for branch
		local removed_fg = get_color("Error", "fg") or 167 -- Red for removed
		local changed_fg = get_color("DiffChange", "fg") or get_color("Special", "fg") or 214 -- Yellow-ish for changed

		local group_styles = {
			-- names inside %# #
			bufferCount = { fg = visual, bg = accent, bold = true },
			file_name = { fg = fg, bg = visual },

			GitBranch = { fg = fg, bg = bg }, -- Muted color for branch
			GitAdded = { fg = accent, bg = bg }, -- Green for added
			GitRemoved = { fg = removed_fg, bg = bg }, -- Red for removed
			GitChanged = { fg = changed_fg, bg = bg }, -- Yellow for changed

			contexts = { fg = accent, bg = "None" },
			separator = { fg = muted, bg = "None" },
			separator_insert = { fg = accent, bg = "None" },
			separator_visual = { fg = muted, bg = "None" },

			lazyUpdates = { fg = "#2E7DE9", bg = bg },
			StatuslineE = { fg = get_color("DiagnosticError", "fg"), bg = bg, bold = true },
			StatuslineW = { fg = get_color("DiagnosticWarn", "fg"), bg = bg, bold = true },
			StatuslineH = { fg = get_color("DiagnosticHint", "fg"), bg = bg, bold = true },
			StatuslineI = { fg = get_color("DiagnosticInfo", "fg"), bg = bg, bold = true },
			bufferLSP = { fg = fg, bg = visual },
			mode = { fg = visual, bg = accent },
		}

		-- Apply the styles
		for group, style in pairs(group_styles) do
			vim.api.nvim_set_hl(0, group, style)
		end
	end

	------------------------------------------------
	vim.opt.statusline = "%!v:lua.Status_line()"
	set_statusline_colors()

	vim.api.nvim_create_autocmd({ "ColorScheme", "User" }, {
		pattern = { "*", "LazyUpdateCompleted" },
		callback = function()
			set_statusline_colors()
			vim.cmd("redrawstatus")
		end,
	})
end

return M
