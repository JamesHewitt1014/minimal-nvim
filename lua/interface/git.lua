add_plugin({source='lewis6991/gitsigns.nvim'})
local gitsigns = require('gitsigns')
gitsigns.setup({
	signcolumn = false
})

local map = vim.keymap.set
map('n', '<leader>gb', gitsigns.toggle_current_line_blame, { desc = 'Toggle git blame'})
map('n', '<leader>gs', gitsigns.toggle_signs, { desc = "Toggle git signs"})
