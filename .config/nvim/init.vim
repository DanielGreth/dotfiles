" Neovim config ported from previous vimrc

"""""""""""""""""""
" Plugins
"""""""""""""""""""
" Definitions
source $XDG_CONFIG_HOME/nvim/plug/vim-plug.vim
" Icons
" nothing yet
" Plugins
source $XDG_CONFIG_HOME/nvim/plug/postplug.vim
source $XDG_CONFIG_HOME/nvim/plug/postplug.lua


"""""""""""""""""""
" General settings
"""""""""""""""""""
set background=dark
colorscheme gruvbox

set shell=/usr/bin/zsh
set belloff=all            " No bell sounds whatsoever
set showmatch              " Show matching brackets
set number                 " Show line number
set relativenumber         " Line number becomes relative to current line
set nowrap                 " Do not wrap lines
set scrolloff=10           " Do not let cursor scroll below or above N lines when scrolling
set sidescrolloff=10       " Same as scrolloff but for horizontal
set sidescroll=1           " Minimal number of columns to scroll horizontally
set list                   " Show invisible characters
set listchars=extends:»,precedes:«,tab:␉·,eol:⏎,trail:␠,nbsp:⎵
set fillchars+=vert:│      " Makes split divider seem more like a line, default is the pipe character
set whichwrap=b,s,<,>,[,]  " Space, backspace, left- and right arrow is allowed to wrap lines
set ttimeoutlen=200        " Timeout in ms for key codes, also the time used for going from insert mode to normal
set splitright             " When splitting window the new window is to th right
set splitbelow             " When splitting window the new window is below

set smartindent            " Auto indent
set tabstop=3              " Tabstop and shiftwidth needs to have the same value
set shiftwidth=3           " This together with tabstop and expandtab, makes <Tab> = N spaces
set expandtab

set hlsearch               " Highlight search result (after pressing enter)
set incsearch              " Highlight all patern matches WHILE typing the pattern
set ignorecase             " Ignore case in search patterns
set smartcase              " Override ignorecase, when specifically searching for capitalized letters
set infercase              " For completion in insert mode

set guicursor=i:block      " Set the cursor to also be a block in insert-mode
set cursorline
highlight cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

set path+=**               " Search down into subfolders, provides tab-completion for all file-related tasks
set wildmenu               " Enable <Tab> compleation in menu
set wildignore+=.git,.hg,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
set wildignore+=*.mp3,*.oga,*.ogg,*.wav,*.flac
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.doc,*.pdf,*.cbr,*.cbz
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
set wildignore+=*.swp,.lock,.DS_Store,._*
set wildmode=longest:full,list,full
set wildignorecase
set wildoptions=pum        " Makes menus a vertical pop menu at the cursor location

" When reopening a file, vim will remember where you left
if has ("autocmd")
   au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif



"""""""""""""""""""
" Key mappings
"""""""""""""""""""
" General
let mapleader = ","        " Map the <Leader> key to ','
set pastetoggle=<F11>      " <F11> toggle paste mode, usefull when wanting to paste text to vim correctly
" Toggle NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>
" Toggle Goyo
nnoremap <Leader>g :Goyo<CR>



"""""" Navigation bindings
""" Buffers and windows movement
" Faster scroll
nnoremap J 16gj
nnoremap K 16gk
vnoremap J 16gj
vnoremap K 16gk

" Easier window movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Open selected file to the right
nnoremap <C-w>f <C-w>vgf

""" Tab-page movement
" Open new empty tab-page
nnoremap <Leader>t :tabnew<CR>
" Close current tab-page, unless it is the only one
nnoremap <Leader>w :tabclose<CR>
" Go to next tab-page
nnoremap <Leader><Tab> :tabnext<CR>

" Go to specific tab-page
nnoremap <Leader>1 <Plug>lightline#bufferline#go(1)
nnoremap <Leader>2 <Plug>lightline#bufferline#go(2)
nnoremap <Leader>3 <Plug>lightline#bufferline#go(3)
nnoremap <Leader>4 <Plug>lightline#bufferline#go(4)
nnoremap <Leader>5 <Plug>lightline#bufferline#go(5)
nnoremap <Leader>6 <Plug>lightline#bufferline#go(6)
nnoremap <Leader>7 <Plug>lightline#bufferline#go(7)
nnoremap <Leader>8 <Plug>lightline#bufferline#go(8)
nnoremap <Leader>9 <Plug>lightline#bufferline#go(9)
nnoremap <Leader>0 <Plug>lightline#bufferline#go(10)
" Close specific tab-page
nnoremap <Leader>c1 <Plug>lightline#bufferline#delete(1)
nnoremap <Leader>c2 <Plug>lightline#bufferline#delete(2)
nnoremap <Leader>c3 <Plug>lightline#bufferline#delete(3)
nnoremap <Leader>c4 <Plug>lightline#bufferline#delete(4)
nnoremap <Leader>c5 <Plug>lightline#bufferline#delete(5)
nnoremap <Leader>c6 <Plug>lightline#bufferline#delete(6)
nnoremap <Leader>c7 <Plug>lightline#bufferline#delete(7)
nnoremap <Leader>c8 <Plug>lightline#bufferline#delete(8)
nnoremap <Leader>c9 <Plug>lightline#bufferline#delete(9)
nnoremap <Leader>c0 <Plug>lightline#bufferline#delete(10)
