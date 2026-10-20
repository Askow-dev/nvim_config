local additional_plugins = {
	{'APZelos/blamer.nvim'},
	{'rhysd/git-messenger.vim'},
	{
		'iamcco/markdown-preview.nvim',
		run = function()
			vim.fn['mkdp#util#install']()
		end
	},
}

vim.cmd("command TunnelDown !bash ~/mount_tgb.sh down")

-- User scripts
vim.cmd("source " .. os.getenv("HOME") .. "/.config/nvim/vimscript/user_script.vim")
vim.cmd("colorscheme aquablaze") --themes enfocado, uperl, palenight, catppuccin, onedark, nord, tokyonight, gruvbox, moonbow, kanagawa-wave, darcubox, duskhaven, aquablaze
vim.cmd("set background=dark")

vim.diagnostic.config({ virtual_text = true })

return function(use, tools)
	tools.logger:write('Installing user settings')
	tools.install(use, additional_plugins)
end
