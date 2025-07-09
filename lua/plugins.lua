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

-- User Interface - Install and setup
require('interface.icons')
require('interface.highlight')
require('interface.keymap-hints')
require('interface.animations')
require('interface.file-explorer')
require('interface.picker')
require('interface.startscreen')

add_plugin({source = 'nvim-lualine/lualine.nvim'})
require('interface.statusline')

-- Language Tools - Install and setup
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
require('interface.themes')

-- PLUGINS TO ADD
-- TODO: Tweak file explorer / picker options & keymaps
-- TODO: Checkout harpoon or similar
-- TODO: Tweak diagnostics (maybe checkout trouble.nvim)
-- TODO: Configure Debugger and Debugger keybinds
-- TODO: adjust keymap hints and icons
