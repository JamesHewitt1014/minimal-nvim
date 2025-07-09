-- Download Mini.nvim - including the plugin manager mini.deps
local path_package = vim.fn.stdpath('data') .. '/site'
local mini_path = path_package .. '/pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    'https://github.com/echasnovski/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
end

require('mini.deps').setup({path = { package = path_package }})
local add_plugin = MiniDeps.add

-- [USER INTERFACE]
add_plugin({source = 'folke/snacks.nvim'})
require('snacks').setup({
	picker    = require('interface/picker'),
	explorer  = {enabled = true}, --File Explorer just calls picker.explorer - for config see interface/picker
	terminal  = {enabled = true},
	scroll    = {enabled = true},
	notifier  = {enabled = false}, -- TODO: Decide if keeping this or not...
	indent    = {enabled = false},
	bigfile   = {enabled = false},
	-- statuscolumn = {
	-- 	left = {'fold', 'mark', 'sign'},
	-- 	right = {'fold', 'git'},
	-- 	folds = {
	-- 		open = true,
	-- 		git_hl = false,
	-- 	},
	-- 	refresh = 50,
	-- }
})

require('mini.notify').setup()
require('mini.pairs').setup() --Bracket matching
require('interface.icons')
require('interface.highlight')
require('interface.startscreen')
require('interface.keymap-hints')
add_plugin({source = 'nvim-lualine/lualine.nvim'})
require('interface.statusline')

-- [LANGUAGE TOOLS]
add_plugin({
	source = 'mason-org/mason-lspconfig.nvim',
	depends = {
		'mason-org/mason.nvim',
		'neovim/nvim-lspconfig',
	}
})
require('language-tools.ls-manager')

add_plugin({source = 'saghen/blink.cmp'})
require('language-tools.autocomplete')

add_plugin({
	source = 'nvim-treesitter/nvim-treesitter',
	checkout = 'main',
})
require('language-tools.treesitter')

add_plugin({
	source = 'rcarriga/nvim-dap-ui',
	depends = {
		'mfussenegger/nvim-dap',
		'mason-org/mason.nvim',
		--'jay-babu/mason-nvim-dap.nvim', --I can't get this to work
		'leoluz/nvim-dap-go',
		'nvim-neotest/nvim-nio'
	}
})
require('language-tools.debugger')

-- [THEMES]
add_plugin({source = 'zaldih/themery.nvim'})
require('interface/themes')

-- PLUGINS I MIGHT ADD
-- TODO: Checkout harpoon or similar
-- TODO: Setup theme manager (also check out mini.colors & lush.nvim)
			-- https://github.com/zaldih/themery.nvim
-- TODO: Tweak diagnostics (maybe checkout trouble.nvim)
-- TODO: Tweak file explorer / picker options & keymaps
			-- Switch to Mini.Files & Mini.Picker
-- TODO: Configure Debugger and Debugger keybinds

-- MAYBE
-- TODO: Setup folding behaviour
-- TODO: Any adjustments to UI - themes, icons, layouts(pickers + keymap hints)
