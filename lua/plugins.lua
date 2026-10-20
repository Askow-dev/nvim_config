local opts = { noremap=true, silent=true }

return function(use, tools)
	tools.logger:write('Installing plugins')
    -- This plugin adds indentation guides to all lines (including empty lines).
    use {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufEnter",
        config = function()
            require("plugins/indent-blankline")
        end
    }

    -- This plugin show trailing whitespace.
    use {
        "ntpeters/vim-better-whitespace",
        event = "BufRead",
        config = function()
            require("plugins/better-whitespace")
        end
    }

    -- Icons.
    use {
		'nvim-tree/nvim-web-devicons',
        -- "kyazdani42/nvim-web-devicons",
        --"ryanoasis/vim-devicons",
        event = "BufEnter"
    }

    -- Bufferline.
    use {
        "akinsho/nvim-bufferline.lua",
		branch ='main',
        after = "nvim-web-devicons",
        --after = "vim-devicons",
		requires = 'nvim-tree/nvim-web-devicons',
        config  = function()
            require("plugins/bufferline")
        end
    }

    -- Statusline.
    use {
        "nvim-lualine/lualine.nvim",
		requires = { 'nvim-tree/nvim-web-devicons', opt = true},
		--requires = { 'ryanoasis/vim-devicons', opt = true},
		-- requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        after = "nvim-bufferline.lua",
        config = function ()
			require('lualine').setup(require("plugins/lualine"))
			--require('nvim-treesitter.ts_utils')
        end
    }

    -- TreeSitter.
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        event = "BufEnter",
		branch = 'master',
        cmd = {
            "TSInstall",
            "TSInstallSync",
            "TSBufEnable",
            "TSBufToggle",
            "TSEnableAll",
            "TSInstallFromGrammer",
            "TSToggleAll",
            "TSUpdate",
            "TSUpdateSync"
        },
        config = function()
            require("plugins/treesitter")
        end
    }

    -- Colorizer (for highlighting color codes).
    use {
        "norcalli/nvim-colorizer.lua",
        event = "BufEnter",
        config = function()
            require("plugins/colorize")
            vim.cmd("ColorizerAttachToBuffer")
        end
    }

    -- Startup screen.
    use {
        "glepnir/dashboard-nvim",
        cmd = {
            "Dashboard",
            "DashboardChangeColorscheme",
            "DashboardFindFile",
            "DashboardFindHistory",
            "DashboardFindWord",
            "DashboardNewFile",
            "DashboardJumpMarks",
            "SessionLoad",
            "SessionSave"
        },
		commit = "a36b3232c98616149784f2ca2654e77caea7a522",
        setup = function()
            require("plugins/dashboard")
        end
    }

    use {
        "nvim-lua/plenary.nvim",
    }

	-- Telescope
    use {
        "nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
        cmd = "Telescope"
    }
    use {
        "nvim-lua/popup.nvim",
        after = "telescope-fzf-native.nvim"
    }
	use {
		"nvim-telescope/telescope.nvim",
		after = "popup.nvim",
		config = function ()
			require("plugins/telescope")
			require('telescope_delta')
		end
	}


    -- View and search LSP symbols, tags in Neovim.
    use {
        "liuchengxu/vista.vim",
        cmd = "Vista",
        config = function ()
            require("plugins/vista")
        end
    }

    -- Terminal.
    use {
        "akinsho/nvim-toggleterm.lua",
		branch ='main',
        cmd = "ToggleTerm",
        config = function()
            require("plugins/toggleterm")
        end
    }

    -- Git signs.
    use {
        "lewis6991/gitsigns.nvim",
		tag = 'release',
        event = "BufRead",
        config = function()
			require('gitsigns').setup {
				signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
				numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
				attach_to_untracked = true,
				current_line_blame = false,
				sign_priority = 1,
				update_debounce = 100,
				max_file_length = 40000,
			}
        end
    }

    -- Auto closes.
    use {
        "windwp/nvim-autopairs",
    --    after = "nvim-cmp",
        config = function()
            require("nvim-autopairs").setup()
        end
    }

    -- Scrollbar.
    use {
        "dstein64/nvim-scrollview",
        event = "BufRead",
        config = function()
            require("plugins/nvim-scroll")
        end
    }

    -- WhichKey is a lua plugin that displays a popup with possible
    -- key bindings of the command you started typing.
    use {
        "folke/which-key.nvim",
        event = "VimEnter",
        config = function()
            require("which-key").setup()
        end
    }

    -- match-up is a plugin that lets you highlight, navigate, and operate on sets of matching text.
    use {
        "andymass/vim-matchup",
        event = "BufRead"
    }

    -- With this plugin you can resize Neovim buffers easily.
    use {
        "artart222/vim-resize",
        event = "BufEnter"
    }

	use {
		'pablos123/shellcheck.nvim',
    	config = function ()
			require('shellcheck-nvim').setup {}
		end
	}
end
