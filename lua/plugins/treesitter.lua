local present, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not present then
	return
end

nvim_treesitter.setup {
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	matchup = {
		enable = true,
	},
	indent = {
		enable = true
	},
	autotag = {
		enable = true
	},
	textobjects = {
		lsp_interop = {
			enable = true,
			border = 'none',
			peek_definition_code = {
				["gO"] = "@function.outer",
				["gM"] = "@class.outer",
			},
		},
	},
}

vim.cmd
[[
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=99
]]
