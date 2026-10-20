local lualine_style = 4

local lualine_styles = {
    {
      { left = " ", right = " " },
      { left = "│", right = "│" },
	},
    {
      { left = ' ', right = ''},
      { left = ' ', right = ' '},
    },
    {
      { left = '', right = ''},
      { left = ' ', right = ' '},
    },
    {
      { left = "", right = "" },
      { left = '', right = '' }
    },
    {
      { left = "", right = ""},
      { left = ' ', right = ' '}
    }
}
local settings = {
	options = {
		theme = "auto",
		disabled_filetypes = {
			"toggleterm",
			"vista_kind",
		},

		section_separators = lualine_styles[lualine_style][1],
		component_separators = lualine_styles[lualine_style][2]
	},
	extensions = { "fugitive" },
	sections = {
    	lualine_b = {'branch', 'diff', 'diagnostics'},
		lualine_c = { "os.date('%a %d %b')", 'filename' },
    	lualine_x = {'filetype'},
	},
}
return settings
