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

"""""""""""""""""""""""""""""" General Tools / Utilities
""""" File explorer
" NERDTree
   Plug 'preservim/nerdtree'

""""" Mass commenting
" NERD Commenter
   Plug 'preservim/nerdcommenter'

""""" Git integration
" fugitive
   Plug 'tpope/vim-fugitive'
" vim-gitgutter
   Plug 'airblade/vim-gitgutter'

""""" Better syntax highlighting
" tree-sitter
   Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

""""" Focus on work
" Goyo.vim
   Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }

" Limelight.vim
   Plug 'junegunn/limelight.vim', { 'on': 'Goyo' }



"""""""""""""""""""""""""""""" Appearance
""""" Themes / colorschemes
" Gruvbox
"   Plug 'morhetz/gruvbox'  
" Gruvbox - but with support for tree sitter
   Plug 'ellisonleao/gruvbox.nvim'

""""" Color preview when editing files
" vim-hexokinase
   Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

""""" Line at the bottom
" lightline
   Plug 'itchyny/lightline.vim'

""""" Line at the top
" lightline-bufferline
   Plug 'mengelbrecht/lightline-bufferline'

""""" Icons for e.g. filetypes and nerdfonts (nerdfonts.com/cheat-sheet)
" vim-devicons
   Plug 'ryanoasis/vim-devicons'



"""""""""""""""""""""""""""""" Programming related
""""" Code completion
" YouCompleteMe
   Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --clangd-completer' }

call plug#end()
"}}}
