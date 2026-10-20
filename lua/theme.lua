-- Hide ~ from end of lines.
vim.opt.fillchars = { eob = " " }

local additional_themes = {
	--Themes
	{'drewtempelmeyer/palenight.vim'}, -- usual shit
	{'NLKNguyen/papercolor-theme'}, -- LGTM
	{
		'ellisonleao/gruvbox.nvim',
		config = function()
			require("gruvbox").setup() -- LGTM
		end
	},
	{'arturgoms/moonbow.nvim'}, -- Gruvbox + Ayu
	{'rebelot/kanagawa.nvim'}, -- Kanagawa

	-- Color schemes.
	{'folke/tokyonight.nvim'},
	{'bluz71/vim-nightfly-guicolors'},
	{'bluz71/vim-moonfly-colors'},
	{
		'navarasu/onedark.nvim',
		config = function ()
			require('onedark').setup {
				style = 'deep' -- styles: dark, darker, cool, deep, warm and warmer.
			}
		end
	},
	{'Koalhack/darcubox-nvim'}, -- Gruvbox + Dracula
	{'kbraggins/duskhaven.nvim'},
	{
		os.getenv('HOME') .. '/.config/nvim/custom_plugins/aquablaze.nvim'
	},
}

-- Themes

vim.g.tokyonight_style = "night" -- styles: storm, night and day.
vim.g.enfocado_style = "neon"    -- styles: nature and neon.

return function(use, tools)
	tools.logger:write('Installing themes')
	tools.install(use, additional_themes)
end
