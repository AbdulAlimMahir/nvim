return {
  "neovim/nvim-lspconfig",
  event = "User MasonLspFileType",
  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()
    local lspconfig = require("lspconfig")
    require("mason-lspconfig").setup({
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,

      --|> Custom LSP Configs <|--
      ["html"] = function()
        lspconfig.html.setup({
          capabilities = capabilities,
          filetypes = { "html", "templ" }, -- plural
          root_dir = lspconfig.util.root_pattern("package.json", ".git"),
          settings = {},
          init_options = {
            provideFormatter = true, -- fixed typo
            embeddedLanguages = { css = true, javascript = true },
            configurationSection = { "html", "css", "javascript" },
          },
        })
      end,
      ["lua_ls"] = function()
        lspconfig.lua_ls.setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              runtime = { version = "LuaJIT" },
              completion = { callSnippet = "Replace" },
              workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            },
          },
        })
      end,

      ["powershell_es"] = function()
        lspconfig.powershell_es.setup({
          capabilities = capabilities,
          -- cmd = {
          -- 	"pwsh",
          -- 	"-NoLogo",
          -- 	"-NoProfile",
          -- 	"-Command",
          -- 	"Import-Module PowerShellEditorServices; Start-EditorServices -HostName 'nvim' -HostProfileId 'nvim' -HostVersion '1.0.0' -LogLevel 'Information' -LogPath '$HOME/.cache/nvim/pses.log' -SessionDetailsPath '$HOME/.cache/nvim/pses.session.json'",
          -- },
          settings = {
            powershell = {
              codeFormatting = { preset = "OTBS" },
            },
          },
          root_dir = lspconfig.util.root_pattern("PSScriptAnalyzerSettings.psd1", ".git"),
          single_file_support = true,
        })
      end,
    })

    --|> Setup Blink
    require("blink.cmp").setup({
      sources = {
        default = { "lsp", "buffer", "path", "snippets" },
      },
    })

    --|> Diagnostics configuration
    vim.diagnostic.config({
      virtual_text = { spacing = 4, prefix = "●", source = "if_many" },
      virtual_lines = false,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.HINT] = "󰌵 ",
          [vim.diagnostic.severity.INFO] = " ",
        },
      },
      inlay_hints = {
        enabled = true,
        exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
      },
      codelens = {
        enabled = false,
      },
      capabilities = {
        workspace = {
          fileOperations = {
            didRename = true,
            willRename = true,
          },
        },
      },
      float = {
        source = true,
        header = "Diagnostics",
        prefix = " ",
        focusable = true,
        style = "minimal",
        border = "single",
      },
    })
  end,
}
