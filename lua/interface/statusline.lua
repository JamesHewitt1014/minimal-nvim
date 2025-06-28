local statusline = require 'lualine'

local branch = {
	'branch',
	icon = {'', align='left'}
}

local diagnostics = {
	'diagnostics',
	symbols = {
		error = ' ',
		warn = ' ',
		info = ' ',
		hint = ' '
	},
}

local filename = {
	'filename',
	symbols = {
		modified = '',
		readonly = ''
	}
}

local filetype = {
	'filetype',
	colored = true,
	icon_only = false,
	icon = { align = 'left'},
}

statusline.setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		globalstatus = true, --Don't know how I feel about that
		section_separators = {
			left = '',
			right = ''
		},
		component_separators = '',
	},
	sections = {
			lualine_a = {{'mode', icons_enabled= true}},
			-- lualine_b = {'branch', 'diff', 'diagnostics'},
			lualine_b = {filename},
			lualine_c = { branch, diagnostics},
			lualine_x = {'location', 'encoding', filetype},
			lualine_y = {},
			lualine_z = {'progress'}
	},
}

