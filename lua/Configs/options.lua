local opts = {
  autochdir = true, -- Use current file dir as working dir.
  autoindent = true,
  backup = false,
  breakindent = true,       -- Wrap indent to match  line start.
  clipboard = "unnamedplus",
  cmdheight = 0,            -- only need the commandline when typing command
  colorcolumn = "80",       --defined in "lukas-reineke/virt-column.nvim"
  completeopt = "noselect", -- mostly just for cmp
  conceallevel = 2,         -- so that `` is visible in markdown files
  confirm = true,           -- confirm to save changes before exiting modified buffer
  copyindent = true,        -- Copy the previous indentation on autoindenting.
  cursorline = true,
  cursorlineopt = "number", -- line, number, both(default), screenline
  expandtab = true,         -- convert tabs into spaces
  fileencoding = "utf-8",   -- the encoding written to a file
  foldenable = true,        -- Enable fold for nvim-ufo.
  foldlevel = 99,           -- open files with all folds open
  foldlevelstart = 99,      -- Start with all code unfolded.
  foldcolumn = "1",         -- Show foldcolumn in nvim 0.9+.
  -- formatoptions = "jcroqlnt", -- tcqj
  grepformat = "%f:%l:%c:%m",
  grepprg = "rg --vimgrep",
  history = 1000,              -- Number of commands to remember in a history table (per buffer).
  hlsearch = true,             -- highlight all matches on previous search pattern
  ignorecase = true,           -- make search case-insensitive
  inccommand = "split",        -- Like "nosplit", but also shows partial off-screen results in a preview window.
  incsearch = true,            -- make search act like search in modern browsers
  infercase = true,            -- Infer cases in keyword completion.
  jumpoptions = "view",
  laststatus = 3,              -- global statusline
  linebreak = true,            -- Wrap lines at convenient points
  list = true,                 -- Enable display of whitespace
  mouse = "a",                 -- mouse allowed in neovim
  mousescroll = "ver:1,hor:0", -- Disables hozirontal scroll in neovim.
  number = true,               -- display the current line number
  numberwidth = 2,             -- width of line numbers Coloumn
  path = ".,,**",              -- find-like operations works recursively
  preserveindent = true,       -- Preserve indent structure as much as possible.
  pumblend = 15,               -- menu blend
  pumheight = 8,               -- menu height
  pumwidth = 20,               -- menu width
  relativenumber = true,       -- display relative line numbers
  ruler = false,
  scrolloff = 999,             -- Setting a high value keep the cursor centered.
  sessionoptions = vim.o.sessionoptions .. ",localoptions",
  shada = "!,'1000,<50,s10,h", -- Remember the last 1000 opened files
  shiftround = true,           -- Round indent
  shiftwidth = 2,              -- the number of spaces for each indentation
  showcmd = false,             -- false
  showmode = false,            -- mode will be shown by statusline
  showtabline = 0,             -- hide tabline
  sidescrolloff = 8,           -- minimul number of columns to the left and right of cursor
  signcolumn = "yes",          -- always show the sign column, otherwise it would shift the text each time
  smartcase = true,            -- but if our search contains uppercase(s), it becomes case-sensitive
  smartindent = true,          -- automatic indentations
  softtabstop = 2,
  splitbelow = true,           -- when splitting horizontally, new window goes below
  splitright = true,           -- when splitting vertically, new window goes to the right
  splitkeep = "screen",        -- Keep the text on the same screen line.
  statuscolumn = [[%!v:lua.require'snacks.statuscolumn'.get()]],
  -- statuscolumn = "%C%l%s",
  swapfile = false, -- do not create a swap file
  tabstop = 2,      -- the number of spaces for each tab
  termguicolors = true,
  textwidth = 80,
  timeoutlen = 400,               -- time for user to finish a key combination
  title = true,                   --
  titlelen = 0,                   -- do not shorten title
  undofile = true,                -- undo is limited to the current session
  undolevels = 500,
  updatetime = 250,               -- faster completion
  virtualedit = "block",          -- enable highlighting empty spaces
  wildmode = "longest:full,full", -- Command-line completion mode
  winborder = "rounded",
  winminwidth = 5,                -- Minimum window width
  wrap = false,                   -- do not wrap lines because it is ugly
  writebackup = false,            -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  ---|>Terminal
  shell = "pwsh",
  shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command",
  shellquote = "",
  shellxquote = "",
}
for key, val in pairs(opts) do
  vim.o[key] = val
end

vim.opt.spelllang = "en"
vim.opt.shortmess:append("sI")
vim.opt.whichwrap:append("<>[]")
vim.opt.iskeyword:append("-")

if vim.fn.has("nvim-0.10") == 1 then
  vim.opt.smoothscroll = true
  vim.opt.formatexpr = "v:lua.vim.treesitter.foldexpr()"
  vim.opt.foldmethod = "expr"
  vim.opt.foldtext = ""
else
  vim.opt.foldmethod = "indent"
  vim.opt.foldtext = "v:lua.require'lazyvim.util'.ui.foldtext()"
end

vim.opt.fillchars = {
  diff = "/",
  eob = " ", -- removes annoying tilde at the bottom of short files
  foldopen = "",
  foldclose = "",
  foldsep = " ",
  fold = "-", -- replace dots with horizontal line to indicate folded sections
  horiz = "─",
  horizdown = "┬",
  horizup = "┴",
  stl = " ",
  vert = "│",
  verthoriz = "┼",
  vertleft = "┤",
  vertright = "├",
}
vim.opt.listchars = {
  eol = " ",
  space = " ",
  tab = " ",
  trail = "~",
}

local g = {
  -- disable some default providers
  loaded_node_provider = 0,
  loaded_python3_provider = 0,
  loaded_perl_provider = 0,
  loaded_ruby_provider = 0,

  luarocks_python = "luarocks", -- Or provide the full path to the `luarocks` executable if needed
  netrw_banner = 0,
  netrw_mouse = 2,
  snacks_animate = true,
}
for key, val in pairs(g) do
  vim.g[key] = val
end

vim.g.completion_chain_complete_list = {
  org = {
    { mode = "omni" },
  },
}

-- vim.cmd("autocmd FileType org setlocal iskeyword+=:,#,+")

-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has("win32") ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath("data"), "mason", "bin" }, sep) .. delim .. vim.env.PATH
