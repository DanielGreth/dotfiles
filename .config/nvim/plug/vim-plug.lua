-- Plug Setup {{{

-- Set up variables
xdg_config_home = os.getenv("XDG_CONFIG_HOME")
xdg_data_home = os.getenv("XDG_DATA_HOME")
plug_github_url = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
autoload_plug = '/autoload/plug.vim'

-- Find correct locations
if xdg_data_home == nil then
   plug_location = os.getenv("HOME") ..'/.local/share/nvim/site'
   plugin_location = os.getenv("HOME") .. '/.local/share/nvim/plugged'
else
   plug_location = xdg_data_home .. '/nvim/site'
   plugin_location = xdg_data_home .. '/nvim/plugged'
end

-- Install vim-plug if not found
--if then
  -- os.execute("sh -c 'curl -fLo " .. "${" .. xdg_data_home .. ":)
--end

-- Run PlugInstall if there are missing plugins
vim.api.nvim_create_autocmd({ "VimEnter" }, {
   callback = function()
      if vim.fn.len(vim.fn.filter(vim.fn.value(plugs), '!isdirectory(v:val.dir)')) then

      end
   end,
})

-- }}}
-- Plugins {{{
local Plug = vim.fn['plug#']

vim.call('plug#begin', '')



vim.call('plug#end')
-- }}}
