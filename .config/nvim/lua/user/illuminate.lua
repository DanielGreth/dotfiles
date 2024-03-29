local status_ok, illuminate = pcall(require, "illuminate")
if not status_ok then 
   return
end

vim.g.Illuminate_ftblacklist = { 'alpha', 'NvimTree' }
vim.api.nvim_set_keymap('n', '<Leader>æ', '<cmd>lua require"illuminate".next_reference{wrap=true}<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<Leader>ø', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<CR>', {noremap=true})

illuminate.configure {
   providers = {
      "lsp",
      "treesitter",
      "regex",
   },
   delay = 200,
   filter_denylist = {
      "dirvish",
      "fugitive",
      "alpha",
      "NvimTree",
      "packer",
      "neogitstatus",
      "Trouble",
      "lir",
      "Outline",
      "spectre_panel",
      "toggleterm",
      "DressingSelect",
      "TelescopePrompt",
   },
   filetypes_allowlist = {},
   modes_denylist = {},
   modes_allowlist = {},
   providers_regex_syntax_denylist = {},
   providers_regex_syntax_allowlist = {},
   under_cursor = true,
}
