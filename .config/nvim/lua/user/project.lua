local status_ok, project = pcall(require, "project_nvim")
if not status_ok then
   return
end

project.setup({
   -- Manual mode doesn't automatically change your root directory, so you have
   -- the option to manually do so using ':ProjectRoot' command
   manual_mode = true,

   -- detection_methods = { "lsp", "pattern" }, -- NOTE: lsp detection will get annoying with multiple langs in one project
   detection_methods = { "pattern" },

   -- Patterns used to detect root, dir, when **"paterne"** is in detection_methods
   patterns = { ".git", "Makefile", "package.json" },

   -- Table of LSP clients to ignore by names
   -- eg: { "efm", ... }
   ingore_lsp = {},

   -- Don't calculate root dir on specific directories
   -- eg: { "~/.cargo/*", ... }
   exclude_dirs = {},

   -- Show hidden files in telescope
   show_hidden = true,

   -- When set to false, you will get a message when project.nvim changes your directory
   silent_chdir = false,

   -- What scope to change the directory, valid options are
   -- * global (default)
   -- * tab
   -- * win
   scope_chdir = 'global',

   -- Path where project.nvim will store the project history for use in telescope
   datapath = vim.fn.stdpath("data"),
})

local tele_status_ok, telescope = pcall(require, "telescope")
if not tele_status_ok then
   return
end

telescope.load_extension('projects')
