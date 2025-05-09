require("Configs.options")
require("Configs.autocmd")
require("Configs.keymaps")

--|>[ lua/Projects ]<|--
require("Projects.statusline").setup()
require("Projects.floaterm")

-----------------------
require("Configs.lazy")
-----------------------
-- vim.cmd.colorscheme("kanagawa-paper-ink")
-- require("Projects.theme_picker")
