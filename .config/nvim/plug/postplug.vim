""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"           LIGHTLINE and BUFFERLINE                   "
" https://github.com/itchyny/lightline.vim             "
" https://github.com/mengelbrecht/lightline-bufferline "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2 " Required by lightline
set noshowmode
set showtabline=2 " Required by bufferline, 2 = always show tabline

let g:lightline = {
   \ 'colorscheme': 'gruvbox',
   \ 'active': {
   \   'left': [ [ 'mode', 'paste' ],
   \             [ 'readonly', 'filename', 'modified' ] ],
   \   'right': [ [ 'lineinfo' ],
   \              [ 'percent' ],
   \              [ 'charvaluehex', 'fileformat', 'fileencoding', 'filetype' ] ]
   \ },
   \ 'tabline': {
   \   'left': [ [ 'buffers' ] ],
   \   'right': [ [ 'gitbranch', 'smarttabs'] ]
   \ },
   \ 'component_function': {
   \   'filename': 'LightlineFilename',
   \   'fileformat': 'LightlineFileformat',
   \   'filetype': 'LightlineFiletype',
   \   'fileencoding': 'LightlineFileencoding',
   \   'percent': 'LightlinePercent',
   \   'lineinfo': 'LightlineLineinfo',
   \   'readonly': 'LightlineReadonly',
   \   'gitbranch': 'LightlineGitbranch'
   \ },
   \ 'component_expand': {
   \   'buffers': 'lightline#bufferline#buffers',
   \   'smarttabs': 'SmartTabsIndicator'
   \ },
   \ 'component_type': {
   \   'buffers': 'tabsel'
   \ },
   \ 'component': {
   \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
   \   'charvaluehex': '0x%B'
   \ },
   \ 'component_visible_condition': {
   \   'modified': '(&filetype!="help" && (&modified || !&modifiable))',  
   \ },
   \ 'seperator': { 'left': ' ', 'right': ' '  },
   \ 'subseperator': { 'left': ' ', 'right': ' ' }
   \ }
let g:lightline#bufferline#unnamed = 'No Name'   " Name for unnamed buffers
let g:lightline#bufferline#show_number = 2       " Buffers get labeled a number sequentially, which can be used to opened, closed with <Leader># and <Leader>c# 
let g:lightline#bufferline#unicode_symbols = 1   " Enable unicode
let g:lightline#bufferline#enable_devicons = 1   " Enable devicons from nerd fonts

function! s:trim(maxlen, str) abort
   let trimed = len(a:str) > a:maxlen ? a:str[0:a:maxlen] . '..' : a:str
   return trimed
endfunction

function! LightlineFilename() abort
   let l:prefix = expand('%:p') =~? "fugitive://" ? '(fugitive) ' : ''
   let l:maxlen = winwidth(0) - winwidth(0) / 2
   let l:relative = expand('%:.')
   let l:tail = expand('%:t')
   let l:noname = 'No Name'

   if winwidth(0) < 50
      return ''
   endif

   if winwidth(0) < 86
      return l:tail ==# '' ? l:noname : l:prefix . s:trim(l:maxlen, l:tail)
   endif

   return l:relative ==# '' ? l:noname : l:prefix . s:trim(l:maxlen, l:relative)
endfunction

function! LightlinePercent() abort
   if winwidth(0) < 60
      return ''
   endif

   let l:percent = line('.') * 100 / line('$') . '%'
   let l:percentinfo = ' ' . printf('%-4s', l:percent)
   return l:percentinfo
endfunction

function! LightlineFileformat() abort
   return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFileencoding() abort
   return winwidth(0) > 70 ? &fileencoding : ''
endfunction

function! LightlineFiletype() abort
   return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineLineinfo() abort
   if winwidth(0) < 86
      return ''
   endif

   let l:current_line = printf('%-3s', line('.'))
   let l:max_line = printf('%-3s', line('$'))
   let l:char_nr = printf('%-3s', col('.'))
   let l:lineinfo = ' ' . l:current_line . '/' . l:max_line . '  ' . l:char_nr
   return l:lineinfo
endfunction

function! LightlineReadOnly() abort
   let l:char = get(ftmap, &filetype, '')
   return &readonly ? l:char : ''
endfunction

function! LightlineGitbranch() abort
   if exists('*FugitiveHead')
      let maxlen = 20
      let branch = FugitiveHead()
      return branch !=# '' ? ' ' . s:trim(maxlen, branch): ''
   endif
   return FugitiveHead()
endfunction

function! SmartTabsIndicator() abort
   let tabs = lightline#tab#tabnum(tabpagenr())
   let tab_total = tabpagenr('$')
   return tabpagenr('$') > 1 ? ('TABS ' . tabs . '/' . tab_total) : ''
endfunction



""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     HEXOKINASE                       "
" https://github.com/rrethy/vim-hexokinase             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors                       " Needed for both theme and hexokinase (color preview)
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let g:Hexokinase_highlighters = [ 'backgroundfull' ]



""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      GRUVBOX                         "
" https://github.com/morhetz/gruvbox                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:gruvbox_italic = 1
"let g:gruvbox_transparent_bg = 1



""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      NERDTree                        "
" https://github.com/preservim/nerdtree.               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeShowHidden = 1            " Show hidden files by default
" Exit if NERDTree is the only window remaining in the only tab
autocmd BufEnter * if tabpagenr('$') == 1  && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaning in it
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif



""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  NERD Commenter                      "
" https://github.com/preservim/nerdcommenter           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDSpaceDelims = 1               " Add a space after comment character
let g:NERDDefaultAlign = 'left'         " Allign comments to left instead of it following code indentation
let g:NERDCommentWholeLinesInVMode = 1  " Comment out only whole lines
let g:NERDCommentEmptyLines = 1         " Empty lines also gets commented




""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Tagbar                         "
" https://github.com/preservim/tagbar                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_autoshowtag = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      Goyo vim                        "
" https://github.com/junegunn/goyo.vim                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_height = 85
let g:goyo_width = 100
let g:goyo_linenr = 0
" Turn Limelight on / off with Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!



""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  Limelight.vim                       "
" https://github.com/junegunn/limelight.vim            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:limelight_conceal_ctermfg = '#a89984'
let g:limelight_conceal_guifg = '#928374'

" Determines visibility of text out of focus (default: 0.5)
let g:limelight_default_coefficient = 0.7
" Number of preceding / following paragraphs to include (default = 0)
let g:limelight_paragraph_span = 1



""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  YouCompleteMe                       "
" https://github.com/ycm-core/YouCompleteMe            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""









