local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- sourcing config files.
require('settings')
require('maps')

local current_lsp = {}
table.insert(current_lsp, 'perlpls') -- perlpls, perlls, perlnavigator
table.insert(current_lsp, 'pyright') -- pyright

local configuration_files = {
	'plugins',
	'theme',
	'user_settings',
	'lsp',
}

local tools = require('tools')

return require('packer').startup({
	function(use)
  	use 'wbthomason/packer.nvim'
	for _,configuration in pairs(configuration_files) do
		require(configuration)(use, tools, current_lsp)
    end

  	if packer_bootstrap then
  		require('packer').sync()
		vim.cmd('TSInstall markdown, lua, python, perl')
		vim.cmd('MasonInstall pyright, perlpls')
  	end
end,
config = {
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "single" })
        end
    }
}})

-- post-instalm commands :
-- :TSInstall markdown, lua, python, perl
-- :MasonInstall pyright, perlpls
