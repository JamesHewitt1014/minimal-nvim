local map = vim.keymap.set

-- [[WINDOW MANAGEMENT]]
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

map('n', '<leader>wh', ':new<Enter>', { desc = 'New Horizontal Window' })
map('n', '<leader>wv', ':vertical:new<Enter>', { desc = 'New Vertical Window' })
map('n', '<leader>wx', '<C-w>x', { desc = 'Switch windows around'})

-- [[FILE EXPLORER & NAVIGATION]]
-- Wrapping picker functions to avoid potential issues
local buffers = function() Snacks.picker.buffers() end
local grep = function() Snacks.picker.grep() end
local search_files = function() Snacks.picker.files() end
local file_explorer = function() Snacks.explorer.open() end

map("n", "<leader><leader>", buffers, {desc = "Open files"})
map("n", "<leader>s", grep, {desc = "Search (Grep)"})
map("n", "<leader>f", search_files, {desc = "Files"})
map("", "<tab>", file_explorer)

--TODO: Replace this with a theme picker
map("", "<leader>p", my_custom_picker)
map("n", "<leader>T", Snacks.picker.colorschemes, {desc="Themes"})

local test = function() Snacks.picker() end
map("n", "<leader>h", test, {desc="Test Pickers"})

--TODO: Go through :h snacks-picker and see what else I want

-- [[NVIM TERMINAL]]
local terminal = function() Snacks.terminal.toggle() end
map("n", "<leader>t", terminal, {desc=" Terminal"})

-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
-- vim.keymap.set('n', '<leader>t', ':new<Enter>:terminal<Enter>i', {desc = ' Open Terminal'})

-- [[DIAGNOSTICS]]
map('n', '<leader>le', vim.diagnostic.setloclist, { desc = 'Show Errors (diagnostics)'})
--TODO: Move my floating window function here...
--also figure out what I want in the way of diagnostics
--do I want to use Snacks Notifier

-- [[LSP]]
-- NOTE: Autocomplete keybinds are under "language-tools/autocomplete"
local lsp_symbols_tree = function() Snacks.picker.lsp_symbols() end
local lsp_type_def = function() Snacks.picker.lsp_type_definitions() end
local goto_declarations = function() Snacks.picker.lsp_declarations() end
local goto_definitions = function() Snacks.picker.lsp_definitions() end
local goto_references = function() Snacks.picker.lsp_references() end
local goto_implementations = function() Snacks.picker.lsp_implementations() end

map('n', 'K', vim.lsp.buf.hover, { desc = "Hover Documentation"})
map("n", "<leader>ls", lsp_symbols_tree, {desc = ""})
map('n', '<leader>lr', vim.lsp.buf.rename, { desc = "Rename"})
map('n', '<leader>la', vim.lsp.buf.code_action, { desc = "Code Action" })
map('n', '<leader>lf', vim.lsp.buf.format, { desc = "Format Code" })
map('n', '<leader>lD', lsp_type_def, { desc = "Type Definitions" })
map('n', 'gd', goto_definitions, { desc = "Goto Definitions" })
map('n', 'gr', goto_references ,{ desc = "Goto References" })
--TODO: Conflict - need to fix up some of my 'g' command keybinds
map('n', 'gI', goto_implementations, { desc = "Goto Implementations" })
map('n', 'gD', vim.lsp.buf.declaration, { desc = "Goto Declaration" })

-- [[GIT INTEGRATION]]
local gitsigns = require('gitsigns')
map('n', '<leader>gb', gitsigns.toggle_current_line_blame, { desc = 'Toggle git blame'})
map('n', '<leader>gs', gitsigns.toggle_signs, { desc = "Toggle git signs"})

-- [[OTHER]]
-- Ctrl-backspace in insert to delete a word (Ctrl-w in insert mode deletes a word)
map('i','<C-H>','<C-w>')  -- Some terminals map BS to Ctrl-H
map('i','<C-BS>','<C-w>')
-- Save in insert mode
map('i', '<C-s>', '<Esc>:update<Enter>')

-- Disable keybinds I don't use/like
map('n', 's', '<nop>') -- s is just a worse version of c
map('n', 'S', '<nop>') -- S is just a worse version of cc
map('n', 'gx', '<nop>') -- Is also disabled from showing in 'which-key' plugin
