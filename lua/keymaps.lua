-- alias for setting keybinds
local map = vim.keymap.set

-- [[FILE EXPLORER & NAVIGATION]]
-- For keymaps when using pickers / explorer see 'interface/picker.lua'
map("n", "<tab>", FileExplorerToggle, {desc = "Open File Explorer"})
map("n", "<leader>s", GrepFiles, {desc = "Search (Grep)"})
map("n", "<leader>f", FindFile, {desc = "Search (Files)"})
map("n", "<leader>h", SearchHelp)

-- [[WINDOW MANAGEMENT]]
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

map('n', '<leader>wh', ':new<Enter>', { desc = 'New Horizontal Window' })
map('n', '<leader>wv', ':vertical:new<Enter>', { desc = 'New Vertical Window' })
map('n', '<leader>wx', '<C-w>x', { desc = 'Switch windows around'})

-- [[NVIM TERMINAL]]
-- local terminal = function() Snacks.terminal.toggle() end
-- map("n", "<leader>t", terminal, {desc=" Terminal"})

-- [[DIAGNOSTICS]]
map('n', '<leader>le', vim.diagnostic.setloclist, { desc = 'Show Errors (diagnostics)'})
map('n', '<leader>d', OpenFloatingDiagnostic, {desc = 'Show Errors under cursor'})
map('n', 'gK', ToggleInlineErrors, {desc = 'Toggle Inline Errors'})
--TODO: Modify these keybinds

-- [[LSP]]
-- Autocomplete keybinds are under "language-tools/autocomplete"
-- local lsp_symbols_tree = function() Snacks.picker.lsp_symbols() end
-- local lsp_type_def = function() Snacks.picker.lsp_type_definitions() end
-- local goto_declarations = function() Snacks.picker.lsp_declarations() end
-- local goto_definitions = function() Snacks.picker.lsp_definitions() end
-- local goto_references = function() Snacks.picker.lsp_references() end
-- local goto_implementations = function() Snacks.picker.lsp_implementations() end

map('n', 'K', vim.lsp.buf.hover, { desc = "Hover Documentation"})
-- map("n", "<leader>ls", lsp_symbols_tree, {desc = ""})
map('n', '<leader>lr', vim.lsp.buf.rename, { desc = "Rename"})
map('n', '<leader>la', vim.lsp.buf.code_action, { desc = "Code Action" })
map('n', '<leader>lf', vim.lsp.buf.format, { desc = "Format Code" })
-- map('n', '<leader>lD', lsp_type_def, { desc = "Type Definitions" })
-- map('n', 'gd', goto_definitions, { desc = "Goto Definitions" })
-- map('n', 'gr', goto_references ,{ desc = "Goto References" })
--TODO: Conflict - need to fix up some of my 'g' command keybinds
-- map('n', 'gI', goto_implementations, { desc = "Goto Implementations" })
map('n', 'gD', vim.lsp.buf.declaration, { desc = "Goto Declaration" })

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
