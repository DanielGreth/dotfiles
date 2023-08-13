local keymap = vim.keymap.set       -- Shorten function name

------------------------------------------ General keybindings
vim.g.mapleader = ","                                                               -- Map the <Leader> key to ','

keymap('n', '<F11>', function()                                                     -- <F11> used for toggeling paste mode, usefull when pasting text and vim tries to indent the text for you
   if vim.opt.paste:get() == false  then
      vim.fn.execute({":set paste"})
   else
      vim.fn.execute({":set nopaste"})
   end
end, { silent = true })


-- Clear highlighting
keymap('n', '<Leader>l', ':nohlsearch<CR>', { silent = true })                      -- ", + l"     Clear highlighting, after a search (\ or ?)

-- Easier navigation for windows
keymap('n', '<C-h>', '<C-w>h', { silent = true })                                   -- "Ctrl + h"  Switch to window to the left
keymap('n', '<C-j>', '<C-w>j', { silent = true })                                   -- "Ctrl + j"  Switch to window below
keymap('n', '<C-k>', '<C-w>k', { silent = true })                                   -- "Ctrl + k"  Switch to window above
keymap('n', '<C-l>', '<C-w>l', { silent = true })                                   -- "Ctrl + l"  Switch to window to the right

-- Open new / close tab page
keymap('n', '<Leader>o', ':tabnew<CR>', { silent = true })                          -- ", + o"     Opens new tab page
keymap('n', '<Leader>p', ':tabclose<CR>', { silent = true })                        -- ", + p"     Closes current tab page

--  Cycle through tab pages
keymap('n', 'gt', ':tabnext<CR>', { silent = true})
keymap('n', 'gT', ':tabprevious<CR>', { silent = true})

-- Open new / close buffer
keymap('n', '<Leader>t', ':vs<CR>:enew<CR>', { silent = true })                     -- ", + t"     Open new empty buffer in vertical split
keymap('n', '<Leader>w', '<cmd>Bdelete!<CR>', { silent = true })                    -- ", + w"     Closes current buffer

-- Cycle through buffers
keymap('n', '<C-Tab>', ':BufferLineCycleNext<CR>', { silent = true })               -- "Ctrl + <Tab>"   Next buffer
keymap('n', '<C-S-Tab>', ':BufferLineCyclePrev<CR>', { silent = true })       -- ", + Shift + <Tab>"  Prev buffer           NOT CURRENTLY WOKRING

-- Go to <Num> buffer                                                               -- ", + <Num>"          Go to <Num> buffer
keymap('n', '<Leader>1', ':BufferLineGoToBuffer 1<CR>',  { silent = true })
keymap('n', '<Leader>2', ':BufferLineGoToBuffer 2<CR>',  { silent = true })
keymap('n', '<Leader>3', ':BufferLineGoToBuffer 3<CR>',  { silent = true })
keymap('n', '<Leader>4', ':BufferLineGoToBuffer 4<CR>',  { silent = true })
keymap('n', '<Leader>5', ':BufferLineGoToBuffer 5<CR>',  { silent = true })
keymap('n', '<Leader>6', ':BufferLineGoToBuffer 6<CR>',  { silent = true })
keymap('n', '<Leader>7', ':BufferLineGoToBuffer 7<CR>',  { silent = true })
keymap('n', '<Leader>8', ':BufferLineGoToBuffer 8<CR>',  { silent = true })
keymap('n', '<Leader>9', ':BufferLineGoToBuffer 9<CR>',  { silent = true })
keymap('n', '<Leader>0', ':BufferLineGoToBuffer 10<CR>', { silent = true })

-- Resize the window
keymap('n', '<C-Up>',    ':resize -1<CR>', { silent = true })                       -- "Ctrl + Up"    Decrease height of current window
keymap('n', '<C-Down>',  ':resize +1<CR>', { silent = true })                       -- "Ctrl + Down"  Increase height of current window
keymap('n', '<C-Left>',  ':vertical resize -1<CR>', { silent = true })              -- "Ctrl + Left"  Decrease width of current window
keymap('n', '<C-Right>', ':vertical resize +1<CR>', { silent = true })              -- "Ctrl + Right" Increase width of current window

-- Move line(s) in normal and visual mode
keymap('n', '<Leader>j', ':move .+1<CR>',    { silent = true })                     -- ", + j" Move a line down in normal mode
keymap('n', '<Leader>k', ':move .-2<CR>',    { silent = true })                     -- ", + k" Move a line up in normal mode
keymap('v', '<Leader>j', ":move '>+1<CR>gv", { silent = true })                     -- ", + j" Move marked lines down in visual mode
keymap('v', '<Leader>k', ":move '<-2<CR>gv", { silent = true })                     -- ", + k" Move marked lines up in visual mode

-- Opening files
keymap('n', '<C-f>', '<C-w>vgf', { silent = true })                                 -- "Ctrl + f" Open file under cursor in vsplit

-- Telescope (used for quickly searching for text or files)
-- Due to telescope-fzf-native it supports fzf syntax
--    Token          Match type                 Description
--    sbtrkt   fuzzy-match                items that match sbtrkt
--    'wild    exact-match                items that include wild
--    ^music   prefix-exact-match         items that start with music
--    .mp3$    suffix-exact-match         items that end with .mp3
--    !fire    inverse-exact-match        items that do not include fire
--    !^music  inverse-prefix-exact-match items that do not start with music
--    !.mp3$   inverse-suffix-exact-match items that do not end with .mp3
-- | (pipe / bar) means 'OR'
keymap('n', '<Leader>ff',  ':Telescope find_files<CR>', { silent = true })           -- ", + ff" Search for a filename in the current working directory (respects .gitignore)
keymap('n', '<Leader>fg',  ':Telescope live_grep<CR>',  { silent = true })           -- ", + fg" Search for a text string in the current working directory (respects .gitignore)
keymap('n', '<Leader>fb',  ':Telescope buffers<CR>',    { silent = true })           -- ", + fb" List open buffers in currrent nvim instance
keymap('n', '<Leader>fp',  ':Telescope projects<CR>',   { silent = true })           -- ", + fp" List projects
keymap('n', '<Leader>fh',  ':Telescope help_tags<CR>',  { silent = true })           -- ", + fh" Search for help tags
keymap('n', '<Leader>fm',  ':Telescope man_pages<CR>',  { silent = true })           -- ", + fm" Search through man pages
keymap('n', '<Leader>fd',  ':Telescope diagnostics bufnr=0<CR>', { silent = true })  -- ", + fd" List diagnostics for current buffer (NOTE: ", + lq" same thing but not in Telescope)
keymap('n', '<Leader>fgg', ':Telescope git_status<CR>', { silent = true })           -- ", + fg" List git status with diff preview

------------------------------------------ Plugins
keymap('n', '<Leader>n', ':NvimTreeToggle<CR>', { silent = true })                  -- Toggle NvimTree
keymap('n', '<Leader>g', ':Goyo<CR>', { silent = true })                            -- Toggle Goyo
keymap('n', '<Leader>m', ':TagbarToggle<CR>', { silent = true })                    -- Toggle Tagbar
keymap('n', '<Leader>b', ':Gitsigns toggle_signs<CR>', { silent = true })           -- Toggle Gitsigns


-- DAP
keymap('n', '<Leader>db', "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { silent = true })
keymap('n', '<Leader>dc', "<cmd>lua require'dap'.continue()<CR>", { silent = true })
keymap('n', '<Leader>di', "<cmd>lua require'dap'.step_into()<CR>", { silent = true })
keymap('n', '<Leader>do', "<cmd>lua require'dap'.step_over()<CR>", { silent = true })
keymap('n', '<Leader>dO', "<cmd>lua require'dap'.step_out()<CR>", { silent = true })
keymap('n', '<Leader>dr', "<cmd>lua require'dap'.repl.toggle()<CR>", { silent = true })
keymap('n', '<Leader>dl', "<cmd>lua require'dap'.run_last()<CR>", { silent = true })
keymap('n', '<Leader>du', "<cmd>lua require'dapui'.toggle()<CR>", { silent = true })
keymap('n', '<Leader>dt', "<cmd>lua require'dap'.terminate()<CR>", { silent = true })

