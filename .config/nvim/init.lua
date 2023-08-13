vim.loader.enable()
require "user.options"
require "user.keymaps"
vim.cmd('source /home/greth/.config/nvim/plug/vim-plug.vim')    -- TODO Remake in lua
require "user.autocommands"
require "user.colorscheme"
require "user.cmp"
require "user.telescope"
require "user.gitsigns"
require "user.treesitter"
require "user.autopairs"
require "user.comment"
require "user.nvim-tree"
require "user.bufferline"
require "user.lualine"
require "user.toggleterm"
require "user.project"
require "user.illuminate"
require "user.indentline"
require "user.alpha"
require "user.lsp"
require "user.dap"

require "user.hexokinase"
require "user.goyo"
require "user.limelight"