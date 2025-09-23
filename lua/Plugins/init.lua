return {
  { "nvim-lua/plenary.nvim",       lazy = true },
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- high priority is required
    event = "FileType lua",
    config = true,
  },
  { "nvim-tree/nvim-web-devicons", opts = {} },
  {
    "folke/which-key.nvim",
    cmd = { "WhichKey" },
    event = "VeryLazy",
    opts = {
      preset = "helix", -- classic, modern, helix
      delay = 100,
      layout = {
        width = { min = 30, max = 90 }, -- min and max width of the columns
      },
      icons = {
        separator = "", -- symbol used between a key and it's label
        group = "+ ",   -- symbol prepended to a group
        mappings = false,
      },
      disable = {
        ft = { "TelescopePrompt" },
      },
    },
  },
  {
    "folke/trouble.nvim",
    enabled = true,
    cmd = "Trouble",
    dependencies = {
      "folke/todo-comments.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      auto_close = true,    -- auto close when there are no items
      auto_preview = false, -- automatically open preview when on an item
      modes = {
        diagnostics = {
          auto_open = true,
          auto_preview = false,
        },
      },
    },
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
  { "Bilal2453/luvit-meta", lazy = true },
  {
    "thesimonho/kanagawa-paper.nvim",
    name = "kanagawa-paper",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      dim_inactive = true, --Disabled when transparent
      cache = true,
      plugins = {
        blink = true,
        gitsigns = true,
        lazy = true,
        mini = true,
        noice = true,
        nvim_dap_ui = true,
        render_markdown = true,
        snacks = true,
        telescope = true,
        trouble = true,
        which_key = true,
      },
      integrations = {
        wezterm = {
          enabled = true,
          path = (os.getenv("TEMP") or "/tmp") .. "/nvim-theme",
        },
      },
    },
  },
  {
    "folke/noice.nvim",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" }, --"VeryLazy",
    dependencies = {
      { "MunifTanjim/nui.nvim", after = "folke/noice.nvim" },
    },
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        message = {
          enabled = true,
          view = "mini",
        },
      },
      presets = {
        bottom_search = true,         -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = true,            -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true,        -- add a border to hover docs and signature help
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTelescope", "TodoTrouble" },
    keys = {
      { "<leader>tq", "<cmd>TodoQuickFix<cr>",  desc = "Todo QuickFix" },
      { "<leader>tl", "<cmd>TodoLocList<cr>",   desc = "Todo LocList" },
      { "<leader>ts", "<cmd>TodoTelescope<cr>", desc = "Todo Telescope" },
    },
    opts = {},
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPost",
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
    "stevearc/conform.nvim",
    lazy = true,
    cmd = "ConformInfo",
    event = "BufWritePre",
    keys = {
      {
        "<leader>cF",
        function()
          require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
        end,
        mode = { "n", "v" },
        desc = "Format Injected Langs",
      },
    },
    opts = {
      timeout_ms = 3000,
      async = false,           -- not recommended to change
      quiet = false,           -- not recommended to change
      lsp_format = "fallback", -- not recommended to change
      formatters_by_ft = {
        html = { "prettierd" },
        css = { "biome-check" },
        javascript = { "biome-check" },
        typescript = { "biome-check" },
        javascriptreact = { "biome-check" },
        typescriptreact = { "biome-check" },
        json = { "biome-check" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        graphql = { "prettierd" },
        lua = { "stylua" },
        python = { "black" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    },
  },
  {
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
    require("Configs.keymaps").snacks()
  },
  {
    "mfussenegger/nvim-lint",
    event = "BufWritePost",
    config = function()
      require("lint").linters_by_ft = {
        bash = { "bash" },
        html = { "htmlhint" },
        css = { "stylelint" },
        javascript = { "biomejs" },      --eslint_d
        typescript = { "biomejs" },      -- eslint_d
        javascriptreact = { "biomejs" }, --eslint_d
        typescriptreact = { "biomejs" }, --eslint_d
        json = { "biomejs" },            -- "jsonlint","biomels/biomejs",
        python = { "pylint" },
      }
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        group = vim.api.nvim_create_augroup("lint", { clear = true }),
        callback = function()
          require("lint").try_lint()
        end,
      })
      ------------------------------------------------
      vim.keymap.set("n", "<leader>ll", function()
        require("lint").try_lint()
      end, { desc = "Trigger Linting Here" })
    end,
  },
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      filetypes = {
        "*",
        mason = { names = false, RGB = false },
        lazy = { names = false, RGB = false },
      },
      user_default_options = {
        names = false,     -- "Name" codes like Blue or blue
        RGB = true,        -- #RGB hex codes
        RRGGBB = true,     -- #RRGGBB hex codes
        RRGGBBAA = true,   -- #RRGGBBAA hex codes
        AARRGGBB = true,   -- 0xAARRGGBB hex codes
        rgb_fn = true,     -- CSS rgb() and rgba() functions
        hsl_fn = true,     -- CSS hsl() and hsla() functions
        css = true,        -- features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true,     -- *functions*: rgb_fn, hsl_fn
        tailwind = "both", -- boolean|'normal'|'lsp'|'both'.
        tailwind_opts = {
          update_names = true,
        },
        sass = { enable = true, parsers = { "css" } }, -- Enable sass colors
        virtualtext = "󱓻", --  󱓻 ■ 
        always_update = true,
      },
    },
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
      ui = {
        width = 0.6,
        height = 0.8,
        icons = {
          package_installed = "󰄴",
          package_pending = "󰦗",
          package_uninstalled = "󰄰",
        },
      },
    }
  },

  -- Mason LSP bridge
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {
      automatic_installation = true,
      ensure_installed = {
        "bashls",        --Bash
        "biome",         --JSon, JavaScript, TypeScript
        "clangd",        --C/C++
        "cssls",         --CSS,SCSS,LESS
        "html",          --HTML
        "lua_ls",        --Lua (formerly "sumneko_lua")
        "marksman",      --Markdown LSP
        "powershell_es", --PowerShell Script
        "pyright",       --Python LS
        "tailwindcss",   --Tailwind CSS
        "taplo",         --TOML
        "ts_ls",         --TypeScript
      },
    }
  },

  -- Mason tool installer (DAPs, linters, formatters)
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      auto_update = true,
      run_on_start = true,
      start_delay = 300,
      debounce_hours = 12,
      ensure_installed = {
        ---|>(3)DAP
        "codelldb",                  --C, C++, Rust, Zig
        "cpptools",                  --C, C++, Rust
        "js-debug-adapter",          --JavaScript, TypeScript
        "local-lua-debugger-vscode", --Lua
        ---|>(4)Linter
        "cpplint",                   --C,C++
        "gitlint",
        "htmlhint",                  --HTML
        "jsonlint",                  --JSON
        "markdownlint",              --Markdown
        "pylint",                    --Python
        "selene",                    --Lua, Luau
        "stylelint",                 --CSS, Sass, SCSS, LESS
        ---|>(5)Formatter
        "black",                     --Python
        "prettierd",                 --prettier in CLI Deamon
        "stylua",                    --Lua
      },
    }
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
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {},
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
