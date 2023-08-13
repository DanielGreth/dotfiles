vim.opt.background = "dark"
vim.opt.backup = false                             -- Creates a backup file
vim.opt.clipboard = "unnamedplus"                  -- Allows neovim to access the system clipboard
vim.opt.cmdheight = 1                              -- More space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" }    -- Show popup menu, also when there only is one item, make the user select, used for cmp
vim.opt.conceallevel = 0                           -- Text is shown normally (default: 0)
vim.opt.fileencoding = "utf-8"                     -- Encoding used when writing file (default: "", which means utf-8)
vim.opt.hlsearch = true                            -- Highlight all matches on previous search pattern (e.g. when using / or ?)
vim.opt.incsearch = true                           -- Highlight all matches while typing the query
vim.opt.ignorecase = true                          -- Case-insensitive searching
vim.opt.smartcase = true                           -- Overwrite ignorecase, when specifically searching for capitalized letters
vim.opt.infercase = true                           -- For completion in insert mode
vim.opt.mouse = "a"                                -- Allow the mouse to be used in neovim
vim.opt.pumheight = 10                             -- Height of popup menu
vim.opt.showmode = false                           -- Do not show mode at the bottom e.g. --INSERT--, since a plugin takes care of this now
vim.opt.showtabline = 2                            -- Always show tabline, need for lightline-bufferline
vim.opt.smartindent = true                         -- Auto indent
vim.opt.tabstop = 3                                -- Tabstop and shiftwidth needs to have the same value
vim.opt.shiftwidth = 3                             -- This together with tabstop and expandtab, makes <Tab> = N spaces
vim.opt.expandtab = true                           -- Use the appropriate number of spaces to insert a <Tab>
vim.opt.splitbelow = true                          -- When splitting a window the new window is to the right
vim.opt.splitright = true                          -- When splitting a window the new window is below
vim.opt.swapfile = false                           -- Creates a swapfile
vim.opt.termguicolors = true                       -- Use gui colors in term, required for gruvbox and hexokinase, also is supported in ST
vim.opt.timeoutlen = 1000                          -- Time in ms to wait for a mapped sequence to complete
vim.opt.ttimeoutlen = 50                           -- Timeout in ms for key codes, also the time used for going from insert mode to normal
vim.opt.undofile = true                            -- Enable persistent undo
vim.opt.guicursor = "i:block"                      -- Set the cursor to also be a block in insert-mode
vim.opt.cursorline = true                          -- Highlight the current line
vim.opt.number = true                              -- Show line number
vim.opt.relativenumber = true                      -- Line numbers are relative to current line
vim.opt.laststatus = 3                             -- Only the last window will always have a status line
vim.opt.showcmd = true                             -- Show partial command in the last line of the screen, if terminal is slow, turn off
vim.opt.ruler = false                              -- Hide the line a column number of the cursor position, since it is taken care of by plugin
vim.opt.wrap = false                               -- Do not wrap lines
vim.opt.scrolloff = 10                             -- Minimum number of lines to keep above or below the cursor
vim.opt.sidescrolloff = 10                         -- Minimum number of columns to keep to the left or right of the cursor, if wrap is false
vim.opt.sidescroll = 1                             -- Minimal number of columns to scroll horizontally
vim.opt.belloff = all                              -- No bell sounds whatsoever
vim.opt.showmatch = true                           -- Show matching brackets
vim.opt.list = true                                -- Show invisible characters
vim.opt.listchars:append({ extends = "»"  })
vim.opt.listchars:append({ precedes = "«" })
vim.opt.listchars:append({ tab = ">-" })
vim.opt.listchars:append({ trail = "·" })
vim.opt.fillchars:append({ vert = "│" })
vim.opt.fillchars:append({ eob = " "})
vim.opt.whichwrap:append( "b,s,<,>,[,]" )          -- Space, backspace, left- and right arrow, is allowed to wrap lines
vim.opt.shortmess:append "c"                       -- Hide all completion messages, e.g. ""-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found"
vim.opt.iskeyword:append("-")                      -- Treat words with '-' as single words

vim.opt.path:append "**"                           -- Search down into subfolders, provides <Tab> completion for all file-related tasks
vim.opt.wildmenu = true                            -- Enable <Tab> completion in menu
vim.opt.wildignore:append { ".git", ".hg", ".svn" }
vim.opt.wildignore:append { "*.aux", "*.out", "*.toc" }
vim.opt.wildignore:append { "*.o" ,"*.obj", "*.exe", "*.dll", "*.manifest", "*.rbc", "*.class" }
vim.opt.wildignore:append { "*.ai", "*.bmp", "*.gif", "*.ico", "*.jpg", "*.jpeg", "*.png", "*.psd", "*.webp" }
vim.opt.wildignore:append { "*.avi", "*.divx", "*.mp4", "*.webm", "*.mov", "*.m2ts", "*.mkv", "*.vob", "*.mpg", "*.mpeg" }
vim.opt.wildignore:append { "*.mp3", "*.oga", "*.ogg", "*.wav", "*.flac" }
vim.opt.wildignore:append { "*.eot", "*.otf", "*.ttf", "*.woff" }
vim.opt.wildignore:append { "*.doc", "*.pdf", "*.cbr", "*.cbz" }
vim.opt.wildignore:append { "*.zip", "*.tar.gz", "*.tar.bz2", "*.rar", "*.tar.xz", "*.kgb" }
vim.opt.wildignore:append { "*.swp", ".lock", ".DS_Store", "._*" }
vim.opt.wildmode = "longest:full,list,full"        --
vim.opt.wildignorecase = true                      -- Case is ignored when completing file names and directories
vim.opt.wildoptions = "pum"                        -- Makes menus a vertical popup menu at the cursor location

vim.opt.updatetime = 500                           -- Annoying option, used by multiple plugins for CursorHold events, also the timer responsible for writing to SWAP (default: 4000 ms)

vim.opt.shell = "/usr/bin/zsh"
