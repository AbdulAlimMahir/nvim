local options = {
	autoindent = true,
	backup = false,
	cmdheight = 1, -- only need the commandline when typing command
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
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- make search case-insensitive
	inccommand = "split", -- when performing substitution, show preview at the bottom
	incsearch = true, -- make search act like search in modern browsers
	laststatus = 3,
	list = true, -- Enable display of whitespace
	mouse = "a", -- disable mouse in neovim
	number = true, -- display the current line number
	numberwidth = 1, -- width of line numbers Coloumn
	pumblend = 10, -- pop up menu blend
	pumheight = 10, -- pop up menu height
	relativenumber = true, -- display relative line numbers
	ruler = false, --
	scrolloff = 12, -- keep cursorline in the middle
	shiftwidth = 2, -- the number of spaces for each indentation
	showcmd = false, -- false
	showmode = false, -- mode will be shown by statusline
	showtabline = 1, -- hide tabline
	sidescrolloff = 8, -- minimul number of columns to the left and right of cursor
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	smartcase = true, -- but if our search contains uppercase(s), it becomes case-sensitive
	smartindent = true, -- automatic indentations
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
	undofile = true, -- undo is limited to the current session
	updatetime = 150, -- faster completion
	virtualedit = "block", -- enable highlighting empty spaces
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

for param, val in pairs(options) do
	vim.opt[param] = val
end

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus" -- neovim uses the system clipboard by default
end)

vim.o.sessionoptions = vim.o.sessionoptions .. ",localoptions"
vim.opt.shortmess:append("c")
vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd("set iskeyword+=-")

vim.g.completion_chain_complete_list = {
	org = {
		{ mode = "omni" },
	},
}
-- add additional keyword chars
vim.cmd("autocmd FileType org setlocal iskeyword+=:,#,+")
vim.g.luarocks_python = "luarocks" -- Or provide the full path to the `luarocks` executable if needed
vim.g.netrw_banner = 0
vim.g.netrw_mouse = 2
