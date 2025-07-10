--NOTE: Some keybinds are part of their plugin config (i.e. autocomplete, file explorer, debugger)

-- alias for setting keybinds
local map = vim.keymap.set

-- Navigation
map("n", "<tab>", FileExplorerToggle, {desc = "Open File Explorer"})
map("n", "<leader>s", GrepFiles, {desc = "Search (Grep)"})
map("n", "<leader>f", FindFile, {desc = "Search (Files)"})
map("n", "<leader>h", SearchHelp)

-- Window Management
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

--TODO: Do I want to change these (maybe they are fine on Ctrl-W?)
map('n', '<leader>wh', ':new<Enter>', { desc = 'New Horizontal Window' })
map('n', '<leader>wv', ':vertical:new<Enter>', { desc = 'New Vertical Window' })
map('n', '<leader>wx', '<C-w>x', { desc = 'Switch windows around'})

--TODO: Re-add terminal support?

-- Diagnostics
map('n', '<leader>le', vim.diagnostic.setloclist, { desc = 'Show Errors (diagnostics)'})
map('n', '<leader>d', OpenFloatingDiagnostic, {desc = 'Show Errors under cursor'})
map('n', 'gK', ToggleInlineErrors, {desc = 'Toggle Inline Errors'})

-- lsp tools
-- Note: Autocomplete keybinds are under "language-tools/autocomplete"
map('n', 'K', vim.lsp.buf.hover, { desc = "Hover Documentation"})
map('n', '<leader>lr', vim.lsp.buf.rename, { desc = "Rename"})
map('n', '<leader>la', vim.lsp.buf.code_action, { desc = "Code Action" })
map('n', '<leader>lf', vim.lsp.buf.format, { desc = "Format Code" })
map("n", "<leader>ls", ListSymbols, {desc = "List Document Symbols"})

map('n', 'gd', vim.lsp.buf.definition, { desc = "Goto Definitions" })
map('n', 'gD', GoToDeclaration, { desc = "Goto Declaration" })
map('n', 'gr', GoToReferences,{ desc = "Goto References" })
map('n', 'gI', GoToImplementation, { desc = "Goto Implementations" })
map('n', 'gT', GoToTypeDefinition, {desc = "Goto Type Definition"})

-- Other
-- Ctrl-backspace in to delete a word (Ctrl-w in insert mode deletes a word)
map('i','<C-H>','<C-w>')  -- Some terminals map BS to Ctrl-H
map('i','<C-BS>','<C-w>')

-- Disable keybinds I don't use/like
-- Note: vim.keymap.del can't remove all default keybinds
local unbind = vim.keymap.del

map('n', 's', '<nop>') -- s is just a worse version of c
map('n', 'S', '<nop>') -- S is just a worse version of cc

unbind('n', 'grr')
unbind('n', 'gra')
unbind('n', 'grn')
unbind('n', 'gri')
unbind('n', 'gx')
unbind('n', 'gO')
