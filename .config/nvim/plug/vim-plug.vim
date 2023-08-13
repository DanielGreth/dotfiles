" Plug Setup {{{
" vim-plug automation, see the wiki:
" https://github.com/junegunn/vim-plug/wiki/tags
" Thanks to github.com/rickprice for xdg directories integration

" Set up variables
let g:xdg_config_home = $XDG_CONFIG_HOME
let g:xdg_data_home = $XDG_DATA_HOME
let g:plug_github_url = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
let g:autoload_plug = '/autoload/plug.vim'

" Find correct locations
if len(g:xdg_data_home) == 0
   let g:plug_location = $HOME . '/.local/share/nvim/site'
   let g:plugin_location = $HOME . '/.local/share/nvim/plugged'
else
   let g:plug_location = g:xdg_data_home . '/nvim/site'
   let g:plugin_location = g:xdg_data_home . '/nvim/plugged'
endif

" Install vim-plug if not found
if empty(glob(g:plug_location . g:autoload_plug))
   execute '!curl -fLo ' . g:plug_location . g:autoload_plug . ' --create-dirs ' . g:plug_github_url
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)')) | PlugInstall --sync | source $MYVIMRC | endif

" Shorthand to upgrade all plugins, including Plug
command! PU PlugUpdate | PlugUpgrade

" }}}
" {{{ Plugins
call plug#begin(g:plugin_location)
   Plug 'nvim-lua/plenary.nvim'
   Plug 'windwp/nvim-autopairs'
   Plug 'numToStr/Comment.nvim'
   Plug 'JoosepAlviste/nvim-ts-context-commentstring'
   Plug 'nvim-tree/nvim-web-devicons'
   Plug 'nvim-tree/nvim-tree.lua', { 'on': 'NvimTreeToggle' }
   Plug 'akinsho/bufferline.nvim'
   Plug 'moll/vim-bbye'
   Plug 'nvim-lualine/lualine.nvim'
   Plug 'akinsho/toggleterm.nvim'
   Plug 'ahmedkhalf/project.nvim'
   Plug 'lukas-reineke/indent-blankline.nvim'
   Plug 'goolord/alpha-nvim'
   Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
   Plug 'junegunn/limelight.vim', { 'on': 'Goyo' }
   Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
   Plug 'preservim/tagbar'

""""" Telescope
   Plug 'nvim-telescope/telescope.nvim'
   Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

""""" Themes / colorschemes
   Plug 'ellisonleao/gruvbox.nvim'

""""" Treesitter
   Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

""""" LSP Support
   Plug 'williamboman/mason.nvim'
   Plug 'williamboman/mason-lspconfig.nvim'
   Plug 'neovim/nvim-lspconfig'
   Plug 'jose-elias-alvarez/null-ls.nvim'
   Plug 'RRethy/vim-illuminate'
   Plug 'SmiteshP/nvim-navic'

""""" Code completion
   Plug 'hrsh7th/nvim-cmp'
   Plug 'hrsh7th/cmp-buffer'
   Plug 'hrsh7th/cmp-path'
   Plug 'hrsh7th/cmp-cmdline'
   Plug 'saadparwaiz1/cmp_luasnip'
   Plug 'hrsh7th/cmp-nvim-lsp'
   Plug 'hrsh7th/cmp-nvim-lua'
   Plug 'hrsh7th/cmp-emoji'
   Plug 'onsails/lspkind.nvim'

""""" Snippet
   Plug 'L3MON4D3/LuaSnip'
   "Plug ''

""""" Git
   Plug 'lewis6991/gitsigns.nvim'

""""" Mass commenting
"   Plug 'preservim/nerdcommenter'


call plug#end()
"}}}
