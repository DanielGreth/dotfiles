vim.api.nvim_create_autocmd({ "WinEnter" }, {            -- When entering a window enable cursorline
   callback = function()
      vim.opt_local.cursorline = true
   end,
})

vim.api.nvim_create_autocmd({ "WinLeave" }, {            -- When leaving a window disable cursorline
   callback = function()
      vim.opt_local.cursorline = false
   end,
})

vim.api.nvim_create_autocmd({ "BufReadPost" }, {         -- When opening a file, return the cursor where you last left it
   callback = function()
      if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
         vim.fn.execute({"normal! g`\""})
      end
   end,
})


vim.api.nvim_create_autocmd({ "User" }, {                -- Disable lualine and the signcolumn (gitsigns) when entering goyo
   pattern = "GoyoEnter",
   callback = function()
      require('lualine').hide()
      vim.opt.signcolumn = "no"
      vim.fn.execute({"Limelight"})
   end
})

vim.api.nvim_create_autocmd({ "User" }, {                -- Enable lualine and the signcolumn again, when leaving goyo
   pattern = "GoyoLeave",
   callback = function()
      vim.opt.signcolumn = "auto"
      require('lualine').hide({ unhide = true })
      vim.fn.execute({"Limelight!"})
   end
})

--vim.api.nvim_create_autocmd({ "CursorHold" }, {          -- Autocommand for showing automatically showing information for whatever is under the cursor, in normal mode, beware CursorHold triggers after 'updatetime' ms
--   pattern = { "*" },
--   callback = function()
--      if not require("cmp").visible() then
--         local hover_fixed = function()
----            vim.api.nvim_command("set eventignore=CursorHold")
----            vim.api.nvim_command("autocmd CursorMoved ++once set eventignore=\" \" ")
--            vim.lsp.buf.hover({ focusable = false })
--         end
--         hover_fixed()
--      end
--   end
--})
