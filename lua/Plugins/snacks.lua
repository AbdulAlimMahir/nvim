return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    animate = {
      enabled = vim.fn.has("nvim-0.10") == 1,
      easing = "linear",
      fps = 60,
      duration = 60,
    },
    bigfile = { enabled = true },
    bufdelete = { enabled = true },
    dashboard = require("Plugins.Snacks.dashboard"),
    dim = { enabled = true },
    explorer = { enabled = true },
    git = {
      width = 0.6,
      height = 0.6,
      border = "rounded",
      title = " Git Blame ",
      title_pos = "center",
      ft = "git",
    },
    gitbrowse = { enabled = true },
    health = { enabled = true },
    image = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    layout = { enabled = true },
    lazygit = { enabled = true },
    notifier = { enabled = true },
    notify = { enabled = true },
    picker = { enabled = true },
    profiler = { enabled = true },
    quickfile = { enabled = true, exclude = { "latex" } },
    rename = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { refresh = 300 },
    -- styles = require("Plugins.Snacks.styles"),
    terminal = { enabled = true },
    -- toggle = { enabled = true },
    util = { enabled = true },
    win = { enabled = true },
    words = { enabled = true },
    zen = { enabled = true },
  },
  keys = {
    { "<leader>s", "", desc = " Snacks" },
    { "<leader>sb", "", desc = " Snack.Buffers" },
    {
      "<leader>sbL",
      function()
        Snacks.picker.buffers()
      end,
      desc = " Buffers",
    },
    {
      "<leader>sbc",
      function()
        require("snacks").bufdelete()
      end,
      desc = " Close Buffer",
    },
    {
      "<leader>sbr",
      function()
        require("snacks").rename.rename_file()
      end,
      desc = " Rename File",
    },
    {
      "<leader>se",
      function()
        Snacks.explorer()
      end,
      desc = " Explorer",
    },
    { "<leader>sg", "", desc = " Snacks.Git" },
    {
      "<leader>sgb",
      function()
        require("snacks").gitbrowse()
      end,
      desc = " Git Browse",
    },
    {
      "<leader>sgB",
      function()
        require("snacks").git.blame_line()
      end,
      desc = " Git Blame Line",
    },
    {
      "<leader>sgh",
      function()
        require("snacks").lazygit.log_file()
      end,
      desc = " Lazygit Current File History",
    },
    {
      "<leader>sgL",
      function()
        require("snacks").lazygit()
      end,
      desc = " Lazygit",
    },
    {
      "<leader>sgl",
      function()
        require("snacks").lazygit.log()
      end,
      desc = "Lazygit Log (cwd)",
    },
    {
      "<c-/>",
      function()
        require("snacks").terminal()
      end,
      desc = " Toggle Terminal",
    },
    {
      "<c-_>",
      function()
        require("snacks").terminal()
      end,
      desc = "which_key_ignore",
    },
    {
      "]]",
      function()
        require("snacks").words.jump(vim.v.count1)
      end,
      desc = " Next Reference",
      mode = { "n", "t" },
    },
    {
      "[[",
      function()
        require("snacks").words.jump(-vim.v.count1)
      end,
      desc = " Prev Reference",
      mode = { "n", "t" },
    },
    { "<leader>sG", "", desc = " Snacks.Grep" },
    {
      "<leader>sGf",
      function()
        Snacks.picker.smart()
      end,
      desc = " Grep Files",
    },
    {
      "<leader>sGs",
      function()
        Snacks.picker.grep()
      end,
      desc = " Grep Strings",
    },
    { "<leader>sn", "", desc = " Snacks.Notifications" },
    {
      "<leader>snh",
      function()
        require("snacks").notifier.show_history()
      end,
      desc = " Notification History",
    },
    {
      "<leader>snc",
      function()
        require("snacks").notifier.hide()
      end,
      desc = " Clear Notifications",
    },
    {
      "<leader>sc",
      function()
        require("snacks").picker.colorschemes()
      end,
      desc = " Snacks Colorscheme Picker",
    },
  },
}
