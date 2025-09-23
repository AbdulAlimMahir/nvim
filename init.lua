require("Configs.options")
require("Configs.autocmd")
require("Configs.keymaps")

require("Projects.statusline").setup()
require("Projects.terminal")
require("Plugins")
-----------------------
require("Configs.lazy")
vim.cmd.colorscheme("kanagawa-paper-ink")
