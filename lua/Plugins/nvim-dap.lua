local M = {
  "mfussenegger/nvim-dap",
  cmd = { "DapContinue", "DapStepOver", "DapStepInto", "DapStepOut", "DapToggleBreakpoint" },
  events = "User MasonLspFileType",
  dependencies = {
    { "nvim-neotest/nvim-nio",           lazy = true, after = "mfussenegger/nvim-dap" },
    { "rcarriga/nvim-dap-ui",            lazy = true, after = "mfussenegger/nvim-dap" },
    { "igorlfs/nvim-dap-view",           lazy = true, after = "mfussenegger/nvim-dap" },
    { "theHamsta/nvim-dap-virtual-text", lazy = true, after = "mfussenegger/nvim-dap" },
    { "jay-babu/mason-nvim-dap.nvim",    lazy = true, after = "mfussenegger/nvim-dap" },
  },
}
function M.config()
  local dap = require("dap")
  vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "error", linehl = "", numhl = "" })

  -- ADAPTERS
  dap.adapters["local-lua"] = {
    type = "executable",
    command = "node",
    enrich_config = function(config, on_config)
      if not config["extensionPath"] then
        local c = vim.deepcopy(config)
        -- 💀 If this is missing or wrong you'll see
        -- "module 'lldebugger' not found" errors in the dap-repl when trying to launch a debug session
        c.extensionPath = "/absolute/path/to/local-lua-debugger-vscode/"
        on_config(c)
      else
        on_config(config)
      end
    end,
  }
  dap.adapters.python = function(cb, config)
    if config.request == 'attach' then
      ---@diagnostic disable-next-line: undefined-field
      local port = (config.connect or config).port
      ---@diagnostic disable-next-line: undefined-field
      local host = (config.connect or config).host or '127.0.0.1'
      cb({
        type = 'server',
        port = assert(port, '`connect.port` is required for a python `attach` configuration'),
        host = host,
        options = {
          source_filetype = 'python',
        },
      })
    else
      cb({
        type = 'executable',
        command = 'path/to/virtualenvs/debugpy/bin/python',
        args = { '-m', 'debugpy.adapter' },
        options = {
          source_filetype = 'python',
        },
      })
    end
  end
  dap.adapters.node2 = {
    type = "executable",
    command = "node-debug2-adapter",
    -- args = {os.getenv('HOME') .. '/.zinit/plugins/microsoft---vscode-node-debug2.git/out/src/nodeDebug.js'},
    -- args =  { vim.fn.stdpath('data') .. '/mason/packages/node-debug2-adapter/out/src/nodeDebug.js' },
    args = {},
  }
  dap.configurations.javascript = {
    {
      name = "Launch",
      type = "node2",
      request = "launch",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      console = "integratedTerminal",
    },
    {
      -- For this to work you need to make sure the node process is started with the `--inspect` flag.
      name = "Attach to process",
      type = "node2",
      request = "attach",
      restart = true,
      -- port = 9229
      processId = require("dap.utils").pick_process,
    },
  }
  dap.configurations.typescript = dap.configurations.javascript
end

return M
