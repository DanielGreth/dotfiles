-- Treesitter
require("nvim-treesitter.configs").setup({
   ensure_installed = { "c", "cpp", "vim", "latex", "lua", "bash", "json", "gitignore", "make", "markdown", "python"},
   highlight = {
      enable = true,
      disable = { "latex" },
      additional_vim_regex_highlighting = false,
   },

})
