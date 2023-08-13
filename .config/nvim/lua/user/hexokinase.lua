vim.g['Hexokinase_highlighters'] = { 'backgroundfull' }
-- highlighters can be:
--    'virtual'         (default in neovim)
--    'sign_column'     (not optimal with e.g. gitsigns and diagnostics)
--    'background'
--    'backgroundfull'
--    'foreground'
--    'foregroundfull'

-- Patterns to match for all filetypes
-- can be a comma seperated string or a list of strings
vim.g['Hexokinase_optInPatterns'] = { 'full_hex', 'triple_hex', 'rgb', 'rgba', 'hsl', 'hsla', 'colour_names'}
