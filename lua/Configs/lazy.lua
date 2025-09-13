-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

---|>lazy.nvim
require("lazy").setup({
  defaults = {
    lazy = true,     -- should plugins be lazy-loaded?
    version = false, -- always use the latest git commit
  },
  spec = {
    { import = "Plugins" },
  },
  install = {
    missing = true,
    colorscheme = { "habamax" },
  },
  ui = {
    size = { width = 0.6, height = 0.8 },
    wrap = true, -- wrap the lines in the ui
    border = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" }, --single, double, rounded, none, solid, shadow
    backdrop = 80, -- opacity >0 <100
    title_pos = "center", ---@type "center" | "left" | "right"
    pills = true, ---@type boolean
    icons = {
      cmd = "",
      config = "",
      event = "",
      favorite = "",
      ft = "",
      init = "",
      import = "",
      keys = "",
      lazy = "󰂠 ",
      loaded = "",
      not_loaded = "○",
      plugin = "", --
      runtime = "",
      require = "󰢱",
      source = "",
      start = "",
      task = "✔",
    },
  },
  checker = {
    enabled = true,    -- check for plugin updates periodically
    notify = true,     -- get a notification when new updates are found
    frequency = 86400, -- check for updates once per day
    -- check_pinned = true, -- check for pinned packages that can't be updated
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
      reset = true,        -- reset the runtime path to $VIMRUNTIME and your config directory
      disabled_plugins = {
        "2html_plugin",
        "bugreport",
        "compiler",
        "ftplugin",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "matchit",
        "netrw",
        "netrwFileHandlers",
        "netrwPlugin",
        "netrwSettings",
        "optwin",
        "rplugin",
        "rrhelper",
        "spellfile_plugin",
        "synmenu",
        "syntax",
        "tar",
        "tarPlugin",
        "tohtml",
        "tutor",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "editorconfig",
        "man",
        "matchparen",
        "osc52",
      },
    },
  },
})
