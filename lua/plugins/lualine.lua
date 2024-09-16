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
					--section_separators = {left = '', right = ''},
					component_separators = { left = "|", right = "|"},
				    -- component_separators = { left = '', right = ''},
				    -- section_separators = { left = '', right = ''},
				},
				extensions = {
					'neo-tree',
				}
			}
		end,
	}
}
