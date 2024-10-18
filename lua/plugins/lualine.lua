return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			local statusline = require 'lualine'
			statusline.setup {
				options = {
					icons_enabled = true,
					theme = 'auto',
					component_separators = '',
					-- section_separators = {left = '', right = ''},		
				},
				sections = {
						lualine_a = {'mode'},
						lualine_b = {'branch', 'diff', 'diagnostics'},
						lualine_c = {'filename'},
						lualine_x = {'encoding', 'filetype', 'selectioncount'},
						lualine_y = {'progress'},
						lualine_z = {'location'}
					},
				extensions = {
					'neo-tree',
				}
			}
		end,
	}
}
