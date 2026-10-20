local M = {}
local lsp_settings = {
	perlnavigator = {
		settings = {
			perlnavigator = {
				enableWarnings = true,
				perltidyProfile = '~/.perltidyrc',
				perlcriticProfile = '',
				perlcriticEnabled = false,
			}
		},
	},
	perlpls = {
		settings = {
			pls = {
				perlcritic = { enabled = true },
				syntax = { enabled = true },
				perltidyrc = '~/.perltidyrc',
			}
		},
	},
	perlls = {
		settings = {},
	},
	pyright = {
		settings = {},
	}
}

function setup (current_lsp)
	M.tools.logger:write('Trying to setup', current_lsp)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})

	if (type(current_lsp) == "string" and current_lsp == "coc") or (type(current_lsp) == "table" and require('tools').has_val(current_lsp, 'coc')) then
		vim.cmd("source " .. os.getenv("HOME") .. "/.config/nvim/vimscript/coc-config.vim")
	end
	for _, lsp in pairs(current_lsp) do
		if lsp ~= 'coc' then
			vim.lsp.config[lsp] = {
				settings = lsp_settings[lsp].settings,
			}
			vim.lsp.enable(lsp)
		end
	end
end

local function getPluginsList (current_lsp)
	M.tools.logger:write('Getting plugin list', current_lsp)
	local lsp_plugins = {
    	-- VsCode like pictograms for lsp.
    	{
    	    "onsails/lspkind.nvim",
    	},
	    {
	        'hrsh7th/nvim-cmp',
			after = 'lspkind.nvim',
	        config = function()
	            require('plugins/cmp')
	        end
	    },
		{
			'nvim-lua/lsp-status.nvim',
		},
		{
	        'hrsh7th/cmp-nvim-lsp',
	        after = 'nvim-cmp'
	    },
	    {
	        'hrsh7th/cmp-buffer',
	        after = 'nvim-cmp'
	    },
	    {
	        'hrsh7th/cmp-path',
	        after = 'cmp-buffer'
	    },
    	{
    	    "neovim/nvim-lspconfig",
    	},
		{
			"mason-org/mason.nvim",
    	    after = "nvim-lspconfig",
			config = function()
				require("mason").setup()
			end,
		},
		{
			"mason-org/mason-lspconfig.nvim",
			after = 'mason.nvim',
			config = function()
				require("mason-lspconfig").setup()
			end,
			last = function(opts)
				setup(opts.lsp_table)
			end,
			opt = {
				lsp_table = current_lsp
			},
		},
	}
	local coc_plugins= {
		{
			'neoclide/coc.nvim',
			branch='release',
		},
		{
			'bmeneg/coc-perl',
    	    after = 'coc.nvim',
        	config = function ()
        	    setup(current_lsp)
        	end
		}
	}
	if type(current_lsp) == 'string' then
		current_lsp = {current_lsp}
	end
	M.tools.logger:write('Returning plugin list', current_lsp)
	if type(current_lsp) == "table" and M.tools.has_val(current_lsp, 'coc') then
		return coc_plugins -- TODO Need to manage when coc is used with other lsp
	else
		return lsp_plugins
	end
end

return function(use, tools, current_lsp)
	M.tools = tools
	local lsp_table = getPluginsList(current_lsp)
	M.tools.logger:write('Installing lsp', lsp_table)
	M.tools.install(use, lsp_table)
end
