return {
  { "nvim-lua/plenary.nvim", lazy = true },
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- high priority is required
    event = "FileType lua",
    config = true,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { "lazy.nvim" },
        { path = "luvit-meta/library", words = { "vim%.uv" } },
        { path = "LazyVim",            words = { "LazyVim" } },
        { path = "wezterm-types",      mods = { "wezterm" } },
      },
    },
  },
  { "Bilal2453/luvit-meta",  lazy = true },
  {
    "thesimonho/kanagawa-paper.nvim",
    name = "kanagawa-paper",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa-paper")
      vim.cmd.colorscheme("kanagawa-paper-ink")
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPost",
    config = function()
      require("gitsigns").setup()
    end
  },
  {
    "echasnovski/mini.nvim",
    event = "User FilePost", -- "User LazyFile"
    version = "*",           -- [*]Stable, [false]Main
    config = function()
      require("mini.ai").setup()
      require("mini.bracketed").setup()
      require("mini.comment").setup({ options = { ignore_blank_line = true } })
      -- require("mini.diff").setup()
      require("Configs.keymaps").MiniFiles()
      require("mini.files").setup({
        mappings = {
          synchronize = "s",
        },
        options = {
          permanent_delete = false,
        },

        windows = {
          preview = true,
          width_focus = 30,
          width_preview = 60,
        },
      })
      require("mini.icons").setup({
        filetype = {
          lazy = "󰂠",
          mason = "󰟾",
          alpha = "󰀫",
          terminal = "",
        },
      })
      MiniIcons.mock_nvim_web_devicons()
      require("mini.jump").setup()
      -- require("mini.jump2d").setup()
      -- require("mini.misc").setup()
      require("mini.move").setup()
      require("mini.operators").setup()
      require("mini.pairs").setup()
      require("mini.splitjoin").setup()
      require("mini.surround").setup()
      require("mini.tabline").setup()
    end,
  },
  {
    "lukas-reineke/virt-column.nvim",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    opts = {
      char = "╎", --󰮾 󰇝 󱖢  󰙌  ╎
      virtcolumn = "80",
    },
  },
  {
    "folke/edgy.nvim",
    opts = function(_, opts)
      for _, pos in ipairs({ "top", "bottom", "left", "right" }) do
        opts[pos] = opts[pos] or {}
        table.insert(opts[pos], {
          ft = "snacks_terminal",
          size = { height = 0.4 },
          title = "%{b:snacks_terminal.id}: %{b:term_title}",
          filter = function(_buf, win)
            return vim.w[win].snacks_win
                and vim.w[win].snacks_win.position == pos
                and vim.w[win].snacks_win.relative == "editor"
                and not vim.w[win].trouble_preview
          end,
        })
      end
    end,
  },
  {
    "folke/persistence.nvim",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    keys = {
      { "<leader>p", "", desc = " Persistence" },
      { "<leader>ps", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>pS", function() require("persistence").select() end, desc = "Select Session" },
      { "<leader>pl", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>pd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
  },
  {
    "barrett-ruth/live-server.nvim",
    build = "pnpm add -g live-server",
    cmd = { "LiveServerStart", "LiveServerStop" },
    config = true,
    require("Configs.keymaps").LiveServer(),
  },
  {
    "elentok/togglr.nvim",
    keys = { "<leader>ot" },
    opts = {
      key = "<Leader>ot",
      register = "t",
      debug = false,
      values = {
        ["true"] = "false",
        ["True"] = "False",
        ["yes"] = "no",
        ["on"] = "off",
        ["enabled"] = "disabled",
        ["enable"] = "disable",
        ["left"] = "right",
        ["top"] = "bottom",
        ["up"] = "down",
        ["addClass"] = "removeClass",
        ["column"] = "row",
        ["back"] = "fwd",
        ["const"] = "let",
        ["light"] = "dark",
        ["0"] = "1",
        ["+"] = "-",
        [">"] = "<",
        [">="] = "<=",
        ["=="] = "!=",
      },
    },
    -- require("Configs.keymaps").Togglr(),
  },
}
