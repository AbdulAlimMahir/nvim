return {
  "saghen/blink.cmp",
  version = "1.*",
  event = "InsertEnter",
  opts_extend = {
    "sources.completion.enabled_providers",
    "sources.compat",
    "sources.default",
  },
  opts = {
    keymap = {
      ["<C-y>"] = { "accept", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback" },
      ["<C-n>"] = { "select_next", "fallback" },

      ["<C-d>"] = { "show", "show_documentation", "hide_documentation" },
      ["<Tab>"] = { "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },
    },

    appearance = {
      highlight_ns = vim.api.nvim_create_namespace('blink_cmp'),
      nerd_font_variant = "mono",
    },
    completion = {
      accept = {
        auto_brackets = {
          enabled = true, -- experimental auto-brackets support
        },
      },
      documentation = { auto_show = true, auto_show_delay_ms = 200 },
      menu = {
        draw = {
          treesitter = { "lsp" },
        },
      },
    },
    signature = { enabled = false },
    snippets = { preset = "luasnip" },
    sources = {
      default = { "lsp", "lazydev", "snippets", "buffer", "path" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
      },
    },
    term = {
      enabled = false,
      keymap = { preset = 'inherit' }, -- Inherits from top level `keymap` config when not set
      sources = {},
      completion = {
        trigger = {
          show_on_blocked_trigger_characters = {},
          show_on_x_blocked_trigger_characters = nil, -- Inherits from top level `completion.trigger.show_on_blocked_trigger_characters` config when not set
        },
        -- Inherits from top level config options when not set
        list = {
          selection = {
            -- When `true`, will automatically select the first item in the completion list
            preselect = nil,
            -- When `true`, inserts the completion item automatically when selecting it
            auto_insert = nil,
          },
        },
        -- Whether to automatically show the window when new completion items are available
        menu = { auto_show = nil },
        -- Displays a preview of the selected item on the current line
        ghost_text = { enabled = nil },
      }
    },
    fuzzy = {
      implementation = 'lua',
      max_typos = function(keyword) return math.floor(#keyword / 4) end,
      use_frecency = true,
      use_proximity = true,
      use_unsafe_no_lock = false,
      sorts = {
        'score',
        'sort_text',
      },

      prebuilt_binaries = {
        download = true,
        ignore_version_mismatch = false,
        force_version = nil,
        force_system_triple = nil,
        proxy = {
          from_env = true,
          url = nil,
        },
      },
    },
  },
  { "romgrk/fzy-lua-native",       build = "make" },
  { "L3MON4D3/LuaSnip",            version = "v2.*" },
  { "rafamadriz/friendly-snippets" },
}
