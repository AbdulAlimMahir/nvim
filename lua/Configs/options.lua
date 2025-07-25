local opts = {
	autoindent = true,
	backup = false,
	clipboard = "unnamedplus",
	cmdheight = 0, -- only need the commandline when typing command
	colorcolumn = "", --defined in "lukas-reineke/virt-column.nvim"
	completeopt = { "menuone", "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 0, -- so that `` is visible in markdown files
	confirm = true, -- confirm to save changes before exiting modified buffer
	cursorline = true,
	cursorlineopt = "both", -- line, number, both(default), screenline
	expandtab = true, -- convert tabs into spaces
	fileencoding = "utf-8", -- the encoding written to a file
	-- guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,sm:block-blinkwait175-blinkoff150-blinkon175",
	-- guicursor = "n-v-ve-i:block,c-ci:ver50,r-cr:hor100", --mode(s):arg  modes{ n-v-ve-i-r-cr-i-ci-o-sm-a } arg{ hor/ver{char height/width}  }
	-- guifont = "JetBrainsMono Nerd Font", -- the font used in graphical neovim
	foldlevelstart = 99, -- open files with all folds open
	foldtext = "", -- keep the first line of folded section visible
	foldmethod = "expr", -- assign fold based on expressions
	foldexpr = "v:lua.vim.treesitter.foldexpr()",
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- make search case-insensitive
	inccommand = "split", -- when performing substitution, show preview at the bottom
	incsearch = true, -- make search act like search in modern browsers
	laststatus = 3,
	list = true, -- Enable display of whitespace
	mouse = "a", -- disable mouse in neovim
	number = true, -- display the current line number
	numberwidth = 3, -- width of line numbers Coloumn
	path = ".,,**", -- find-like operations works recursively
	pumblend = 15, -- pop up menu blend
	pumheight = 8, -- pop up menu height
	pumwidth = 20,
	relativenumber = true, -- display relative line numbers
	ruler = false,
	scrolloff = 99, -- keep cursorline in the middle
	shiftwidth = 2, -- the number of spaces for each indentation
	showcmd = false, -- false
	showmode = false, -- mode will be shown by statusline
	showtabline = 0, -- hide tabline
	sidescrolloff = 8, -- minimul number of columns to the left and right of cursor
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	smartcase = true, -- but if our search contains uppercase(s), it becomes case-sensitive
	smartindent = true, -- automatic indentations
	softtabstop = 2,
	spelllang = { "en_us", "bangla" },
	splitbelow = true, -- when splitting horizontally, new window goes below
	splitright = true, -- when splitting vertically, new window goes to the right
	swapfile = false, -- do not create a swap file
	tabstop = 2, -- the number of spaces for each tab
	termguicolors = true,
	--011111-022222222-033333333-044444444-055555555-066666666-077777777-088888888-099999999
	textwidth = 80,
	timeoutlen = 300, -- time for user to finish a key combination
	title = true, --
	titlelen = 0, -- do not shorten title
	undofile = false, -- undo is limited to the current session
	updatetime = 200, -- faster completion
	virtualedit = "block", -- enable highlighting empty spaces
	winborder = "single",
	wrap = false, -- do not wrap lines because it is ugly
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

	---|>Terminal
	shell = "pwsh",
	shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command",
	shellquote = "",
	shellxquote = "",
	fillchars = {
		eob = " ", -- removes annoying tilde at the bottom of short files
		fold = "-", -- replace dots with horizontal line to indicate folded sections
		horiz = "─",
		horizdown = "┬",
		horizup = "┴",
		stl = " ",
		vert = "│",
		verthoriz = "┼",
		vertleft = "┤",
		vertright = "├",
	},
	listchars = {
		eol = " ",
		space = " ",
		tab = " ",
		trail = "~",
	},
}

for key, val in pairs(opts) do
	vim.opt[key] = val
end

vim.opt.shortmess:append("sI") -- c
vim.opt.whichwrap:append("<>[]hl")
vim.opt.iskeyword:append("-")
vim.o.sessionoptions = vim.o.sessionoptions .. ",localoptions"

-- disable some default providers
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

vim.g.luarocks_python = "luarocks" -- Or provide the full path to the `luarocks` executable if needed
vim.g.netrw_banner = 0
vim.g.netrw_mouse = 2

vim.g.completion_chain_complete_list = {
	org = {
		{ mode = "omni" },
	},
}
vim.cmd("autocmd FileType org setlocal iskeyword+=:,#,+")

-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has("win32") ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath("data"), "mason", "bin" }, sep) .. delim .. vim.env.PATH
