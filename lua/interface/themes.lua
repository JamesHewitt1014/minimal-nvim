local add_plugin, later = MiniDeps.add, MiniDeps.later

add_plugin({source = 'bluz71/vim-moonfly-colors'})
add_plugin({source = 'catppuccin/nvim'})
add_plugin({source = 'rebelot/kanagawa.nvim'})
add_plugin({source = 'EdenEast/nightfox.nvim'})
add_plugin({source = 'folke/tokyonight.nvim'})
add_plugin({source = 'xero/miasma.nvim'})
add_plugin({source = 'ribru17/bamboo.nvim'})
add_plugin({source = 'sainnhe/gruvbox-material'})

require("themery").setup({
	themes = {
		{
			name = "gruvbox",
			colorscheme = "gruvbox-material"
		},
		{
			name = "tokyonight",
			colorscheme = "tokyonight"
		},
		{
			name = "bamboo",
			colorscheme = "bamboo-vulgaris"
		},
		{
			name = "miasma",
			colorscheme = "miasma"
		},
		{
			name = "carbonfox",
			colorscheme = "carbonfox"
		},
		{
			name = "duskfox",
			colorscheme = "duskfox"
		},
		{
			name = "nordfox",
			colorscheme = "nordfox"
		},
		{
			name = "catppuccin",
			colorscheme = "catppuccin-macchiato"
			-- or do I want mocha
		},
		{
			name = "moonfly",
			colorscheme = "moonfly"
		},
		{
			name = "kanagawa dragon",
			colorscheme = "kanagawa-dragon"
		},
		{
			name = "kanagawa wave",
			colorscheme = "kanagawa-wave"
		},
	}
})

local themery = require("themery")
