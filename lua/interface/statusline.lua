local statusline = require 'lualine'
statusline.setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = '',
	},
	sections = {
			lualine_a = {'mode'},
			lualine_b = {'branch', 'diff', 'diagnostics'},
			lualine_c = {'filename'},
			lualine_x = {'encoding', 'filetype', 'selectioncount'},
			lualine_y = {'progress'},
			lualine_z = {'location'}
	},
}
