local autocmd = vim.api.nvim_create_autocmd
local function augroup(name)
<<<<<<< HEAD
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
=======
	return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
>>>>>>> 8bd7cd2ba9090bc335c41acd09b11e45de9db629
end

-------------------------------
---|>NvChad_event "User FilePost"
<<<<<<< HEAD
-- user event that loads after UIEnter + only if file buf is there
autocmd({ "UIEnter", "BufReadPost", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("NvFilePost", { clear = true }),
  callback = function(args)
    local file = vim.api.nvim_buf_get_name(args.buf)
    local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })

    if not vim.g.ui_entered and args.event == "UIEnter" then
      vim.g.ui_entered = true
    end

    if file ~= "" and buftype ~= "nofile" and vim.g.ui_entered then
      vim.api.nvim_exec_autocmds("User", { pattern = "FilePost", modeline = false })
      vim.api.nvim_del_augroup_by_name("NvFilePost")

      vim.schedule(function()
        vim.api.nvim_exec_autocmds("FileType", {})

        if vim.g.editorconfig then
          require("editorconfig").config(args.buf)
        end
      end)
    end
  end,
=======
autocmd({ "UIEnter", "BufReadPost", "BufNewFile" }, {
	group = vim.api.nvim_create_augroup("NvFilePost", { clear = true }),
	callback = function(args)
		local file = vim.api.nvim_buf_get_name(args.buf)
		local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })

		if not vim.g.ui_entered and args.event == "UIEnter" then
			vim.g.ui_entered = true
		end

		if file ~= "" and buftype ~= "nofile" and vim.g.ui_entered then
			vim.api.nvim_exec_autocmds("User", { pattern = "FilePost", modeline = false })
			vim.api.nvim_del_augroup_by_name("NvFilePost")

			vim.schedule(function()
				vim.api.nvim_exec_autocmds("FileType", {})

				if vim.g.editorconfig then
					require("editorconfig").config(args.buf)
				end
			end)
		end
	end,
>>>>>>> 8bd7cd2ba9090bc335c41acd09b11e45de9db629
})

---|>LazyVim_event "User LazyFile"
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile", "BufWritePre" }, {
<<<<<<< HEAD
  group = vim.api.nvim_create_augroup("LazyFile", { clear = true }),
  callback = function()
    vim.api.nvim_exec_autocmds("User", { pattern = "LazyFile" })
  end,
=======
	group = vim.api.nvim_create_augroup("LazyFile", { clear = true }),
	callback = function()
		vim.api.nvim_exec_autocmds("User", { pattern = "LazyFile" })
	end,
>>>>>>> 8bd7cd2ba9090bc335c41acd09b11e45de9db629
})

---|>Filetype specific event for LSP,Linter,TS,DAP "MasonLspFiletype"
autocmd({ "FileType" }, {
<<<<<<< HEAD
  group = vim.api.nvim_create_augroup("MasonLspFiletype", { clear = true }),
  pattern = {
    "lua",
    "c",
    "c++",
    "ps1",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "tsx",
    "html",
    "css",
    "scss",
    "less",
    "python",
  },
  callback = function(args)
    vim.api.nvim_exec_autocmds("User", {
      pattern = "MasonLspFiletype",
      data = { filetype = args.match },
    })
  end,
=======
	group = vim.api.nvim_create_augroup("MasonLspFiletype", { clear = true }),
	pattern = {
		"lua",
		"c",
		"c++",
		"ps1",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"html",
		"css",
		"scss",
		"less",
		"python",
	},
	callback = function(args)
		vim.api.nvim_exec_autocmds("User", {
			pattern = "MasonLspFiletype",
			data = { filetype = args.match },
		})
	end,
>>>>>>> 8bd7cd2ba9090bc335c41acd09b11e45de9db629
})

-------------------------------
---|>snacks.rename
autocmd("User", {
<<<<<<< HEAD
  pattern = "MiniFilesActionRename",
  callback = function(event)
    require("snacks").rename.on_rename_file(event.data.from, event.data.to)
  end,
})

---|>Yank_Highlight
-- autocmd("TextYankPost", {
--   group = augroup("highlight_yank"),
--   callback = function()
--     (vim.hl or vim.highlight).on_yank()
--   end,
-- })

---|> Check if we need to reload the file when it changed
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime"),
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
=======
	pattern = "MiniFilesActionRename",
	callback = function(event)
		Snacks.rename.on_rename_file(event.data.from, event.data.to)
	end,
})
autocmd("User", {
	pattern = "OilActionsPost",
	callback = function(event)
		if event.data.actions.type == "move" then
			Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
		end
	end,
})

---|>Yank_Highlight
autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		(vim.hl or vim.highlight).on_yank()
	end,
})

---|> Check if we need to reload the file when it changed
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	group = augroup("checktime"),
	callback = function()
		if vim.o.buftype ~= "nofile" then
			vim.cmd("checktime")
		end
	end,
>>>>>>> 8bd7cd2ba9090bc335c41acd09b11e45de9db629
})

---|> resize splits if window got resized
autocmd({ "VimResized" }, {
<<<<<<< HEAD
  group = augroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
=======
	group = augroup("resize_splits"),
	callback = function()
		local current_tab = vim.fn.tabpagenr()
		vim.cmd("tabdo wincmd =")
		vim.cmd("tabnext " .. current_tab)
	end,
>>>>>>> 8bd7cd2ba9090bc335c41acd09b11e45de9db629
})

---|> go to last loc when opening a buffer
autocmd("BufReadPost", {
<<<<<<< HEAD
  group = augroup("last_loc"),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
=======
	group = augroup("last_loc"),
	callback = function(event)
		local exclude = { "gitcommit" }
		local buf = event.buf
		if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
			return
		end
		vim.b[buf].lazyvim_last_loc = true
		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
>>>>>>> 8bd7cd2ba9090bc335c41acd09b11e45de9db629
})

---|> close some filetypes with <q>
autocmd("FileType", {
<<<<<<< HEAD
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "checkhealth",
    "dbout",
    "gitsigns-blame",
    "grug-far",
    "help",
    "lspinfo",
    "neotest-output",
    "neotest-output-panel",
    "neotest-summary",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.schedule(function()
      vim.keymap.set("n", "q", function()
        vim.cmd("close")
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end, {
        buffer = event.buf,
        silent = true,
        desc = "Quit buffer",
      })
    end)
  end,
=======
	group = augroup("close_with_q"),
	pattern = {
		"PlenaryTestPopup",
		"checkhealth",
		"dbout",
		"gitsigns-blame",
		"grug-far",
		"help",
		"lspinfo",
		"neotest-output",
		"neotest-output-panel",
		"neotest-summary",
		"notify",
		"qf",
		"spectre_panel",
		"startuptime",
		"tsplayground",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.schedule(function()
			vim.keymap.set("n", "q", function()
				vim.cmd("close")
				pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
			end, {
				buffer = event.buf,
				silent = true,
				desc = "Quit buffer",
			})
		end)
	end,
>>>>>>> 8bd7cd2ba9090bc335c41acd09b11e45de9db629
})

---|> make it easier to close man-files when opened inline
autocmd("FileType", {
<<<<<<< HEAD
  group = augroup("man_unlisted"),
  pattern = { "man" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
  end,
=======
	group = augroup("man_unlisted"),
	pattern = { "man" },
	callback = function(event)
		vim.bo[event.buf].buflisted = false
	end,
>>>>>>> 8bd7cd2ba9090bc335c41acd09b11e45de9db629
})

---|> wrap and check for spell in text filetypes
autocmd("FileType", {
<<<<<<< HEAD
  group = augroup("wrap_spell"),
  pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
=======
	group = augroup("wrap_spell"),
	pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
>>>>>>> 8bd7cd2ba9090bc335c41acd09b11e45de9db629
})

---|> Fix conceallevel for json files
autocmd({ "FileType" }, {
<<<<<<< HEAD
  group = augroup("json_conceal"),
  pattern = { "json", "jsonc", "json5" },
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
=======
	group = augroup("json_conceal"),
	pattern = { "json", "jsonc", "json5" },
	callback = function()
		vim.opt_local.conceallevel = 0
	end,
>>>>>>> 8bd7cd2ba9090bc335c41acd09b11e45de9db629
})

-------------------------------
---|>neovim_terminal
autocmd("TermOpen", {
<<<<<<< HEAD
  pattern = "*",
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"  -- Hide sign column
    vim.opt_local.cursorline = false -- Disable cursorline
  end,
=======
	pattern = "*",
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.signcolumn = "no" -- Hide sign column
		-- vim.opt_local.cursorline = false -- Disable cursorline
	end,
>>>>>>> 8bd7cd2ba9090bc335c41acd09b11e45de9db629
})
