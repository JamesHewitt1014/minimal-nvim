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
require('mini.notify').setup()
require('mini.pairs').setup() --Bracket matching
require('mini.icons').setup() --Icon provider
require('interface.highlight')
require('interface.startscreen')
require('interface.keymap-hints')
add_plugin({source = 'nvim-lualine/lualine.nvim'})
require('interface.statusline')
add_plugin({source = 'chentoast/marks.nvim'})
require('marks').setup({
	default_mappings = true,
	signs = true,
	mappings = {
		set = "m",
		toggle = "m.",
		delete_line = "dm",
		delete_buf = "<leader>md",
		preview = false,
		next = false,
		prev = false,
	},
	bookmark_0 = {
		sign = ""
	}
})

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
		--'jay-babu/mason-nvim-dap.nvim', --I can't get this to work
		'leoluz/nvim-dap-go',
		'nvim-neotest/nvim-nio'
	}
})
require('language-tools.debugger')

-- [THEMES]
require('interface/themes')

-- PLUGINS I MIGHT ADD
-- DAP / DAP UI

-- TODO: Do I want marks.nvim or something similar (i.e. Markit, Harpoon, Arrow, etc)
-- 					I'm not happy with it
-- TODO: Setup theme manager (also check out mini.colors & lush.nvim)
-- TODO: Tweak diagnostics
-- TODO: Tweak file explorer / picker options & keymaps
-- TODO: Configure Debugger keybinds
-- TODO: Setup folding behaviour
-- TODO: Any adjustments to UI - themes, layouts(pickers + keymap hints)
