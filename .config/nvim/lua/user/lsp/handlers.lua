local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
   return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
--M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities) -- Depricated use line below
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

M.setup = function()
   local signs = {
      { name = "DiagnosticSignError", text = "" },
      { name = "DiagnosticSignWarn", text = "" },
      { name = "DiagnosticSignHint", text = "" },
      { name = "DiagnosticSignInfo", text = "" },
   }

   for _, sign in ipairs(signs) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
   end

   local config = {
      virtual_text = false, -- disable virtual text
--      virtual_text = {
--         source = "if_many",
--      },
      signs = {
         active = signs, -- show signs
      },
      update_in_insert = true,
      underline = true,
      severity_sort = true,
      float = {
         focusable = true,
         style = "minimal",
         border = "rounded",
         source = "always",
         header = "",
         prefix = "",
      },
   }

   vim.diagnostic.config(config)

   vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
   })

   vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "rounded",
   })
end

local function lsp_keymaps(bufnr)
   local opts = { noremap = true, silent = true }
   local keymap = vim.api.nvim_buf_set_keymap
   keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
   keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
   keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
   keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
   keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
   keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
   keymap(bufnr, "n", "<Leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<CR>", opts)
   keymap(bufnr, "n", "<Leader>li", "<cmd>LspInfo<CR>", opts)
   keymap(bufnr, "n", "<Leader>lI", "<cmd>LspInstallInfo<CR>", opts)
   keymap(bufnr, "n", "<Leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
   keymap(bufnr, "n", "<Leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>", opts)
   keymap(bufnr, "n", "<Leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<CR>", opts)
   keymap(bufnr, "n", "<Leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
   keymap(bufnr, "n", "<Leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
   keymap(bufnr, "n", "<Leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
end

M.on_attach = function(client, bufnr)
   if client.name == "sumneko_lua" then
      client.server_capabilities.documentFormattingProvider = false
   end

   if client.server_capabilities.documentSymbolProvider then   -- Used by lualine to show current function if the language server supports it
      local navic = require("nvim-navic")
      navic.attach(client, bufnr)
   end

   lsp_keymaps(bufnr)
   local status_ok, illuminate = pcall(require, "illuminate")
   if not status_ok then
      return
   end
   illuminate.on_attach(client)

   vim.api.nvim_create_autocmd("CursorHold", { -- Responsible for showing diagnostic on cursor hold, after 'updatetime' seconds (check options.lua)
   buffer = bufnr,
   callback = function()
      local opts = {
         focusable = false,
         close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
         border = 'rounded',
         source = 'always',
         prefix = ' ',
         scope = 'cursor',
      }
      vim.diagnostic.open_float(nil, opts)
   end
})
end

return M
