return {
  -- Mason core
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
      ui = {
        border = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" },
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
        "codelldb",           --C, C++, Rust, Zig
        "cpptools",           --C, C++, Rust
        "js-debug-adapter",   --JavaScript, TypeScript
        ---|>(4)Linter
        "cpplint",            --C,C++
        "gitlint",
        "htmlhint",           --HTML
        "jsonlint",           --JSON
        "markdownlint",       --Markdown
        "pylint",             --Python
        "selene",             --Lua, Luau
        "stylelint",          --CSS, Sass, SCSS, LESS
        ---|>(5)Formatter
        "black",              --Python
        "prettierd",          --prettier in CLI Deamon
        "stylua",             --Lua
      },
    }
  },
}
