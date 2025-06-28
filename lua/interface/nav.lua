-- Alternative Navigation - Setup at some point to replace snacks.nvim

local MiniPick = require('mini.pick')
MiniPick.setup({
	mappings = {
		--stop = '<C-q>'
	}
})

local file_manager = require("mini.files")
file_manager.setup()

local mini_extras = require('mini.extra')
mini_extras.setup()

local function Mini_file_search()
	MiniPick.builtin.files({tool='fd'})
end

local function Mini_file_grep()
	MiniPick.builtin.grep_live({tool='rg'})
end

local map = vim.keymap.set
map("n", "<leader>f", Mini_file_search, {desc = "Search (Files)"})
map("n", "<leader>s", Mini_file_grep, {desc = "Search (Grep)"})
map("n", "<tab>", file_manager.open, {desc = "Search (Files)"})

-- Add harpoon or similar

