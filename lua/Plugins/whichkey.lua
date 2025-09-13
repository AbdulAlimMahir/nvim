return {
  "folke/which-key.nvim",
  cmd = { "WhichKey" },
  event = "VeryLazy",
  opts = {
    preset = "helix", -- classic, modern, helix
    delay = 100,
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },
    win = {
      border = "rounded",
      no_overlap = true,
      padding = { 1, 2 }, --[top/bottom 1:3 right/left]
      title = true,
      title_pos = "center",
      zindex = 1000,
    },
    layout = {
      width = { min = 30, max = 90 }, -- min and max width of the columns
      spacing = 3,                    -- spacing between columns
    },
    icons = {
      breadcrumb = "»", -- command line active key combo
      separator = "",   -- symbol used between a key and it's label
      group = "+ ",     -- symbol prepended to a group
      ellipsis = "…",
      mappings = false,
      rules = {},
      colors = true,
      keys = {
        Up = " ",
        Down = " ",
        Left = " ",
        Right = " ",
        C = "󰘴 ",
        M = "󰘵 ",
        D = "󰘳 ",
        S = "󰘶 ",
        CR = "󰌑 ",
        Esc = "󱊷 ",
        ScrollWheelDown = "󱕐 ",
        ScrollWheelUp = "󱕑 ",
        NL = "󰌑 ",
        BS = "󰁮",
        Space = "󱁐 ",
        Tab = "󰌒 ",
        F1 = "󱊫",
        F2 = "󱊬",
        F3 = "󱊭",
        F4 = "󱊮",
        F5 = "󱊯",
        F6 = "󱊰",
        F7 = "󱊱",
        F8 = "󱊲",
        F9 = "󱊳",
        F10 = "󱊴",
        F11 = "󱊵",
        F12 = "󱊶",
      },
    },
    show_help = true,
    show_keys = true,
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
  },
}
