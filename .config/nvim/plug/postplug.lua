-- Treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter
require("nvim-treesitter.configs").setup({
   ensure_installed = { "c", "cpp", "vim", "latex", "lua", "bash", "json", "gitignore", "make", "markdown", "python"},
   highlight = {
      enable = true,
      disable = { "latex" },
      additional_vim_regex_highlighting = false,
   },

})

-- Ellisonleao Gruvbox (tree sitter support)
-- https://github.com/ellisonleao/gruvbox.nvim
require("gruvbox").setup({
   undercurl = true,
   underline = true,
   bold = true,
   italic = true,
   strikethrough = true,
   invert_selection = false,
   invert_signs = false,
   invert_tabline = false,
   invert_intend_guides = true,
   inverse = true, -- invert background for search, diffs, statuslines and errors
   contrast = "", -- can be "hard", "soft" or empty string
   palette_overrides = {},
   overrides = {},
   dim_inactive = false,
   transparent_mode = false,
})
vim.cmd("colorscheme gruvbox")
