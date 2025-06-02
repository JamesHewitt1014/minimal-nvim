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
})
require('mini.pairs').setup() --Bracket matching
require('mini.icons').setup() --Icon provider
require('interface.highlight')
require('interface.startscreen')
require('interface.keymap-hints')
add_plugin({source = 'nvim-lualine/lualine.nvim'})
require('interface.statusline')

--TODO: Come back to this...
--add_plugin({source = "lewis6991/gitsigns.nvim"})
--require('interface.git-intergration')

-- [LANGUAGE TOOLS]

-- LSP for Neovim Config
add_plugin({source = 'folke/lazydev.nvim'})

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
		'jay-babu/mason-nvim-dap.nvim',
		'nvim-neotest/nvim-nio'
	}
})
require('language-tools.debugger')

-- [THEMES]
require('interface/themes')

-- PLUGINS I MIGHT ADD
-- DAP / DAP UI

-- TODO: Configure Debugger keybinds
-- TODO: Setup theme manager (also check out mini.colors & lush.nvim)
-- TODO: Tweak file explorer / picker options & keymaps
-- TODO: Tweak diagnostics
-- TODO: Finish setting up GIT Support
