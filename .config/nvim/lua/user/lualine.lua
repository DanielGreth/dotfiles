local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local status_navic_ok, navic = pcall(require, "nvim-navic")
if not status_navic_ok then
   return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = " ", warn = " " },
  colored = true,
  always_visible = true,
}

local diff = {
  "diff",
  colored = true,
  symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width,
}

local filetype = {
  "filetype",
  icons_enabled = true,
}

local filename = {
   "filename",
   path = 3,
   symbols = {
      modified = '[+]',
      readonly = '[]',
      unnamed = '[No Name]',
      newfile = '[New]',
   },
}

local lineinfo = function()
   local current_line = vim.fn.printf('%-3s', vim.fn.line('.'))
   local char_nr = vim.fn.printf('%-3s', vim.fn.col('.'))
   local lineinfo = ' ' .. current_line .. '  ' .. char_nr
   return lineinfo
end

local spaces = function()
  return " " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

local function lsp_client()
   local buf_clients = vim.lsp.buf_get_clients()
   if next(buf_clients) == nil then
      return ""
   end

   local buf_client_names = {}
   for _, client in pairs(buf_clients) do
      if client.name ~= "null-ls" then
         table.insert(buf_client_names, client.name)
      end
   end
   return "[" .. table.concat(buf_client_names, ", ") .. "]"
end

local function lsp_progress(_, is_active)
   if not is_active then
      return
   end

   local messages = vim.lsp.util.get_progress_messages()
   if #messages == 0 then
      return ""
   end

   local status = {}
   for _, msg in pairs(messages) do
      local title = ""
      if msg.title then
         title = msg.title
      end
      table.insert(status, (msg.percentage or 0) .. "%% " .. title)
   end
   local spinners = { "┣", "┏", "┳", "┓", "┫", "┛", "┻", "┗"}
   local ms = vim.loop.hrtime() / 1000000
   local frame = math.floor(ms / 120) % #spinners
   return table.concat(status, "  ") .. " " .. spinners[frame + 1]
end

lualine.setup {
  options = {
    globalstatus = true,
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", diff, diagnostics },
    lualine_c = {
         filename,
         { navic.get_location, cond = navic.is_available } 
      },
    lualine_x = {
         { lsp_client, icon = "" },
         { lsp_progress },
         spaces
      },
    lualine_y = { filetype, 'encoding', 'fileformat' },
    lualine_z = { lineinfo, 'progress'},
  },
}
