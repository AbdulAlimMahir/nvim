local M = {}
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
local function map(mode, l, r, desc)
	vim.keymap.set(mode, l, r, { desc = desc })
end
-------------------------------------------------------------------------------
--|>[ A ]<|--
--<> auto-sessions 󱣪
M.Autosession = function()
	map("n", "<leader>a", "", "A")
	map("n", "<leader>aS", ":SessionSearch<CR>", "Sessions")
	map("n", "<leader>ad", ":Autosession delete<CR>", "Delete Session")
	map("n", "<leader>ap", ":SessionPurgeOrphaned<CR>", "Purge Empty Sessions")
	map("n", "<leader>ar", ":SessionRestore<CR>", "Restore Session")
	map("n", "<leader>as", ":SessionSave<CR>", "Save Session")
end

-------------------------------------------------------------------------------
--|>[ B ]<|--
--<> bufferline 
map("n", "<leader>b", "", "B")
map("n", "<leader>bh", ":bprev<CR>", " Previous")
map("n", "<leader>bl", ":bnext<CR>", " Next")
map("n", "<leader>bp", ":bnext ", " Go to Buffer")
-- map("n", "<leader>bq", ":bdelete<CR>", "󰅙 Current")
-------------------------------------------------------------------------------
--|>[ C ]<|--
--<> Code Action
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Actions")

--<> Conform 󰗈
M.Conform = function()
	map("n", "<leader>c", "", "C")
	map({ "n", "v" }, "<leader>cf", function()
		require("conform").format({
			lsp_fallback = true,
			async = false,
			timeout_ms = 1000,
		})
	end, "Format File or Range(v)")
end

--<> Volt -> Minty
-- map("n", "<leader>cp", function()
-- 	require("minty.huefy").open()
-- end, "Color Picker")

-------------------------------------------------------------------------------
--|>[ D ]<|--
--<> Diagnostics
map("n", "<leader>d", "", "D")
map("n", "<leader>dl", vim.diagnostic.open_float, "Show line diagnostics")
map("n", "dh", function()
	vim.diagnostic.get_prev_pos()
end, "Go to previous diagnostic")
map("n", "dl", function()
	vim.diagnostic.get_next_pos()
end, "Go to next diagnostic")
map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
map("n", "gK", vim.lsp.buf.hover, "Show documentation for what is under cursor")

-------------------------------------------------------------------------------
--|>[ E ]<|--

-------------------------------------------------------------------------------
--|>[ F ]<|--
--<> Neovim's Terminal
M.floaterm = function()
	vim.keymap.set("n", "<leader>ft", ":Floaterm<CR>", { desc = " FloaTerm" })
	vim.keymap.set("n", "<leader>fH", ":split | terminal<CR>", { desc = " Horizontal Terminal" })
	vim.keymap.set("n", "<leader>fV", ":vsplit | terminal<CR>", { desc = " Vertical Terminal" })

	-- Terminal mode keymaps
	local opts = { buffer = 0 }
	vim.api.nvim_create_autocmd("TermOpen", {
		pattern = "term://*",
		callback = function()
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
			vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
			vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
			vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)
			vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
		end,
	})
end
-------------------------------------------------------------------------------
--|>[ G ]<|--

-------------------------------------------------------------------------------
--|>[ H ]<|--
--|> Harpoon2
M.harpoon = function()
	map("n", "<leader>h", "", "H")
	map("n", "<leader>hl", function()
		local harpoon = require("harpoon")
		harpoon.ui:toggle_quick_menu(harpoon:list())
	end, { desc = "󱠿 Harpoons" })

	map("n", "<leader>ha", function()
		require("harpoon"):list():add()
	end, { desc = "󱡀 Add Harpoon" })

	for _, idx in ipairs({ 1, 2, 3, 4, 5 }) do
		vim.keymap.set("n", string.format("<space>h%d", idx), function()
			require("harpoon"):list():select(idx)
		end, { desc = "󱡁 Aim Harpoon" })
	end
	map("n", "<leader>hh", function()
		require("harpoon"):list():prev()
	end, { desc = "󱡀 Previous" })

	map("n", "<leader>hl", function()
		require("harpoon"):list():next()
	end, { desc = "󱡀 Next" })
end

-------------------------------------------------------------------------------
--|>[ I ]<|--

-------------------------------------------------------------------------------
--|>[ J ]<|--

-------------------------------------------------------------------------------
--|>[ K ]<|--

-------------------------------------------------------------------------------
--|>[ L ]<|--
--<> LazyGit 󰊢
M.LazyGit = function()
	map("n", "<leader>l", "", "L")
	map("n", "<leader>lG", ":LazyGit<CR>", "Open LazyGit")
end
--<> Live-Server
M.LiveServer = function()
	map("n", "<leader>ls", ":LiveServerStart<CR>", "󱜠 Start Server")
	map("n", "<leader>lx", ":LiveServerStop<CR>", " Stop Server")
	map("n", "<leader>lt", ":LiveServerToggle<CR>", "Toggle Server")
end

--<> LSP
map("n", "<leader>lr", vim.lsp.buf.rename, "Smart rename")
map("n", "<leader>lr", ":LspRestart<CR>", "Restart LSP")

-------------------------------------------------------------------------------
--|>[ M ]<|--
map("n", "<leader>m", "", "M")

--<> Markdown-Preview
M.mdPreview = function()
	map("n", "<leader>mp", ":MarkdownPreviewToggle<CR>", "Markdown Preview")
end
--<>Mini.Files
M.MiniFiles = function()
	map("n", "<leader>mf", function()
		require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
	end, "Open mini.files (Directory of Current File)")
	map("n", "<leader>mF", function()
		require("mini.files").open(vim.uv.cwd(), true)
	end, "Open mini.files (cwd)")
end

--<>MiniSessions
M.MiniSessions = function()
	map("n", "<leader>ms", MiniSessions.select, "Mini Sessions")
	map("n", "<leader>mw", function()
		local buf_name = vim.fn.bufname("%")
		local buf_count = #vim.fn.getbufinfo({ buflisted = 1 })
		local session_name = string.format("%s_%d_buffers", buf_name:gsub("[^%w]", "_"), buf_count)
		MiniSessions.write(session_name)
	end, "Save Session")
	map("n", "<leader>md", function()
		MiniSessions.delete()
	end, "Delete Sessions")
end
-------------------------------------------------------------------------------
--|>[ N ]<|--
-- map("n", "<leader>n", "", "N")
--<> nvimtree
M.NvimTree = function()
	map("n", "<leader>nt", ":NvimTreeToggle<CR>", "File Explorer")
	map("n", "<leader>nf", ":NvimTreeFindFileToggle<CR>", "󰈞 Toggle on Buffer")
	map("n", "<leader>nc", ":NvimTreeCollapse<CR>", "Collapse file explorer")
	map("n", "<leader>nr", ":NvimTreeRefresh<CR>", " Refresh File Explorer")
end

-------------------------------------------------------------------------------
--|>[ O ]<|--
--<>Options
map("n", "<leader>o", "", "O")
map(
	"n",
	"<leader>oC",
	":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})<CR>",
	"Nvim Configs Directory"
)
map("n", "<leader>oh", ":nohl<CR>", "󰉥 Clear Highlights")
map("n", "<leader>ow", ":%s/<C-r><C-w>/", "Replace cursor Word")
map("v", "<leader>ow", '"hy:%s/<C-r>h//g<left><left>', "Replace cursor Word")

--<>Convert.nvim
M.Convert = function()
	map({ "n", "v" }, "<leader>cn", "<cmd>ConvertFindNext<CR>", "Find next convertable unit")
	map({ "n", "v" }, "<leader>cc", "<cmd>ConvertFindCurrent<CR>", "Find convertable unit in current line")
	map({ "n", "v" }, "<leader>ca", "<cmd>ConvertAll<CR>", "Convert all of a specified unit")
end

--<> Oil.nvim
M.Oil = function()
	map("n", "<leader>-", ":Oil<CR>", "Open Oil")
end

-- --<> Theme Picker
-- M.themePicker = function()
-- 	map("n", "<leader>oc", ":lua require('Projects.theme_picker').pick_theme()<CR>", "Colorschemes")
-- 	map("n", "<leader>oC", ":lua require('Projects.theme_picker').current_theme()<CR>", "Current Colorschemes")
-- end

--<> Togglr
M.Togglr = function()
	map({ "n", "v" }, "<leader>ot", ":lua require('togglr').toggle_word()<CR>", " Toggle Cursor Word")
end

-------------------------------------------------------------------------------
--|>[ P ]<|--
-- map("n", "<leader>ps", function()
-- 	require("snacks").profiler.scratch()
-- end, "Profiler Scratch Buffer")

-------------------------------------------------------------------------------
--|>[ Q ]<|--

-------------------------------------------------------------------------------
--|>[ R ]<|--
-------------------------------------------------------------------------------
--|>[ S ]<|--
map("n", "<leader>s", "", "S")
--|> Split Windows 󰨑
map("n", "<leader>sv", ":vsplit<CR>", " Vertical Split")
map("n", "<leader>sh", ":split<CR>", " Horizontal Split")
map("n", "<leader>se", ":split=<CR>", "󰇽 Equal Split")
map("n", "<leader>sx", ":close<CR>", "󰱝 Close Split")

--|> source config
map("n", "<leader>sp", ":so %<CR>", "󰑓 Config") -- reload neovim config

--|>Sort selected
map("v", "<leader>sS", ":sort<CR>", " Sort Selected")

--<>Substitute
M.Substitute = function()
	map("n", "sm", require("substitute").operator, "Substitute with motion")
	map("n", "ss", require("substitute").line, "Substitute line")
	map("n", "sS", require("substitute").eol, "Substitute to end of line")
	map("v", "sv", require("substitute").visual, "Substitute in visual mode")
end
-------------------------------------------------------------------------------
--|>[ T ]<|--
map("n", "<leader>t", "", "t")
--|> telescope
M.telescope = function()
	map("n", "<leader>tb", function()
		require("telescope.builtin").buffers(require("telescope.themes").get_ivy({
			sort_mru = true,
			sort_lastused = true,
			initial_mode = "normal",
			layout_config = {
				height = 0.5,
				width = 0.5,
				preview_width = 0.5,
			},
		}))
	end, "Telescope Buffers")
	map("n", "<leader>db", ":Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics")
	-- map("n", "<leader>te", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", "󰈞 Files")
	map("n", "<leader>tf", function()
		require("telescope.builtin").find_files()
	end, " Files in CWD")
	map("n", "<leader>tg", function()
		require("telescope.builtin").git_files()
	end, " Files in Git")
	map("n", "<leader>tr", function()
		require("telescope.builtin").oldfiles()
	end, "󱋢 Recent Files")
	map("n", "<leader>ts", function()
		require("telescope.builtin").live_grep()
	end, " Grep in CWD")
	map("n", "<leader>tc", function()
		require("telescope.builtin").grep_string()
	end, "󱄧 Grep String in CWD")
	map("n", "<leader>t/", function()
		require("telescope.builtin").current_buffer_fuzzy_find()
	end, "Find in here")
	map("n", "<leader>th", function()
		require("telescope.builtin").help_tags()
	end, " Help")
	map("n", "gR", function()
		require("telescope.builtin").lsp_references()
	end, "Show LSP references")
	map("n", "gd", function()
		require("telescope.builtin").lsp_definitions()
	end, "Show LSP definitions")
	map("n", "gi", function()
		require("telescope.builtin").lsp_implementations()
	end, "Show LSP implementations")
	map("n", "gt", function()
		require("telescope.builtin").lsp_type_definitions()
	end, "Show LSP type definitions")
end

--<> ToggleTerm
M.ToggleTerm = function()
	-- map("n", "<leader>T", "", "T")
	map("n", "<leader>tf", ":toggleterm direction=float<cr>", "terminal")
	map("n", "<leader>tf", ":toggleterm direction=float<cr>", "terminal")
end

--<> Tabs 󰓩
map("n", "<leader>Ts", ":tabs<CR>", "Tabs")
map("n", "<Tab>", ":tabnext<CR>", " Next Tab")
map("n", "<S-Tab>", ":tabprevious<CR>", " Previous Tab")
map("n", "<leader>Tx", ":tabclose<CR>", "󰅙 Current Tab")
map("n", "<leader>Tn", ":tabnew<CR>", " New Tab")
map("n", "<leader>TN", ":tabnew %<CR>", " Buffer in New Tab")

--<> trouble
M.trouble = function()
	map("n", "<leader>t", ":Trouble<CR>", "Troubles Diagnosis")
	map("n", "<leader>tx", ":TroubleToggle<CR>", "Trouble list")
	map("n", "<leader>tw", ":TroubleToggle workspace_diagnostics<CR>", "Workspace Diagnostics")
	map("n", "<leader>td", ":TroubleToggle document_diagnostics<CR>", "Document Diagnostics")
	map("n", "<leader>tq", ":TroubleToggle quickfix<CR>", "Quickfix List")
	map("n", "<leader>tl", ":TroubleToggle loclist<CR>", "Location List")
	-- map("n", "<leader>tt", ":TodoTrouble<CR>", "ToDo in Trouble")
end

-------------------------------------------------------------------------------
--|>[ U ]<|--

-------------------------------------------------------------------------------
--|>[ V ]<|--

-------------------------------------------------------------------------------
--|>[ W ]<|--

-----------C--------------------------------------------------------------------
--|>[ X ]<|--

-------------------------------------------------------------------------------
--|>[ Y ]<|--

-------------------------------------------------------------------------------
--|>[ Z ]<|--

-------------------------------------------------------------------------------
--|>[ Without a Leader ]<|--
map("n", "<C->", "", "CTRL")
--<> Split Navigation
map("n", "<C-h>", ":wincmd h<cr>", " Move to Split")
map("n", "<C-j>", ":wincmd j<cr>", " Move to Split")
map("n", "<C-k>", ":wincmd k<cr>", " Move to Split")
map("n", "<C-l>", ":wincmd l<cr>", " Move to Split")
--|> Terminal Navigation
map("t", "<C-h>", "<C-\\><C-N><C-h>", " Left Terminal")
map("t", "<C-j>", "<C-\\><C-N><C-j>", " Bottom Terminal")
map("t", "<C-k>", "<C-\\><C-N><C-k>", " Top Terminal")
map("t", "<C-l>", "<C-\\><C-N><C-l>", " Right Terminal")
--<> JK JK
map("i", "jk", "<Esc>")
map("i", "kj", "<Esc>")
--<>Line Up/Down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
--<> jump half & center
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
--<> Center on Next/Previous
-- map("n", "n", "nzz")
-- map("n", "N", "Nzz")
--<> Center on Next/Previous Jump
map("n", "<C-o>", "<C-o>zz")
map("n", "<C-i>", "<C-i>zz")

-- Extract Colors
M.Colors = function()
	map("n", "<leader>uc", ":ExtractColors<CR>", "Extract Colors")
end
return M
