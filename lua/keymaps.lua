local map = vim.keymap.set

-- [[WINDOW MANAGEMENT]]
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

map('n', '<leader>wh', ':new<Enter>', { desc = 'New Horizontal Window' })
map('n', '<leader>wv', ':vertical:new<Enter>', { desc = 'New Vertical Window' })
map('n', '<leader>wx', '<C-w>x', { desc = 'Switch windows around'})

-- [[PICKERS]]
-- Wrapping picker functions to avoid potential issues
local buffers = function() Snacks.picker.buffers() end
local grep = function() Snacks.picker.grep() end
local search_files = function() Snacks.picker.files() end
local file_explorer = function() Snacks.explorer.open() end
local lsp_symbols_tree = function() Snacks.picker.lsp_symbols() end

map("n", "<leader><leader>", buffers, {desc = "Open files"})
map("n", "<leader>s", grep, {desc = "Search (Grep)"})
map("n", "<leader>f", search_files, {desc = "Files"})
map("n", "<leader>ls", lsp_symbols_tree, {desc = ""})

map("", "<tab>", file_explorer)
--TODO: Maybe configure the file exporer keybinds a bit more

--TODO: Replace this with a theme picker
map("", "<leader>p", my_custom_picker)
map("n", "<leader>T", Snacks.picker.colorschemes, {desc="Themes"})

--TODO: 
-- I want a lsp symbols tree to appear in sidebar
-- Go through :h snacks-picker and see what else I want

-- [[NVIM TERMINAL]]
local terminal = function() Snacks.terminal.toggle() end
map("n", "<leader>t", terminal, {desc=" Terminal"})

-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
-- vim.keymap.set('n', '<leader>t', ':new<Enter>:terminal<Enter>i', {desc = ' Open Terminal'})

-- [[DIAGNOSTICS]]
vim.keymap.set('n', '<leader>le', vim.diagnostic.setloclist, { desc = 'Show Errors (diagnostics)' })
--TODO: Move my floating window function here...
--also figure out what I want in the way of diagnostics
--do I want to use Snacks Notifier

-- [[QUALITY OF LIFE IMPROVEMENTS]]
vim.keymap.set('n', '<C-s>', ':update<Enter>')
vim.keymap.set('i', '<C-s>', '<Esc>:update<Enter>')

-- Ctrl-backspace in insert to delete a word (Ctrl-w in insert mode deletes a word)
vim.keymap.set('i','<C-H>','<C-w>')  -- Some terminals map BS to Ctrl-H
vim.keymap.set('i','<C-BS>','<C-w>')

-- [[DISABLE]]
vim.keymap.set('n', 's', '<nop>') -- s is just a worse version of c
vim.keymap.set('n', 'S', '<nop>') -- S is just a worse version of cc
vim.keymap.set('n', 'gx', '<nop>') -- Is also disabled from showing in 'which-key' plugin

-- [[LSP]]
-- NOTE: Autocomplete keybinds are under "language-tools/autocomplete"
map('n', 'K', vim.lsp.buf.hover, { desc = "Hover Documentation"})

map('n', '<leader>lr', vim.lsp.buf.rename, { desc = "Rename"})
map('n', '<leader>la', vim.lsp.buf.code_action, { desc = "Code Action" })
map('n', '<leader>lf', vim.lsp.buf.format, { desc = "Format Code" })

--TODO: Convert to snacks-picker
-- vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, { desc = "Goto Definitions" })
-- vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = "Goto References" })
-- vim.keymap.set('n', 'gI', require('telescope.builtin').lsp_implementations, { desc = "Goto Implementations" })
-- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "Goto Declaration" })
-- vim.keymap.set('n', '<leader>lD', require('telescope.builtin').lsp_type_definitions, { desc = "Type Definitions" })
