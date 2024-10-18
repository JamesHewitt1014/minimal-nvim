-- [[KEYBINDS]
-- How to use: vim.keymap.set(mode, keybind, result, options)

-- [[NAVIGATION]]
-- Recenter when using Ctrl-U and Ctrl-D
vim.keymap.set('n', '<C-u>','<C-u>zz')
vim.keymap.set('n', '<C-d>','<C-d>zz')

-- [[WINDOW MANAGEMENT]]
-- use CTRL + <hjkl> ti switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Opening new windows
vim.keymap.set('n', '<leader>wh', ':new<Enter>', { desc = 'New Horizontal Window' })
vim.keymap.set('n', '<leader>wv', ':vertical:new<Enter>', { desc = 'New Vertical Window' })
vim.keymap.set('n', '<leader>wx', '<C-w>x', { desc = 'Switch windows around'})

-- Resize windows
vim.keymap.set('n', '<leader>wj', ':res -N', {desc = 'Decrease window size'})
vim.keymap.set('n', '<leader>wk', ':res +N', {desc = 'Increase window size'})

-- Tabs
-- vim.keymap.set('n', '<leader>wt', ':tabnew<CR>', {silent = true, desc = 'Open new tab'})

-- [[NVIM TERMINAL]]
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' }) -- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('n', '<leader>t', ':new<Enter>:terminal<Enter>i', {desc = ' Open Terminal'})

-- [[DIAGNOSTICS]]
vim.keymap.set('n', '<leader>le', vim.diagnostic.setloclist, { desc = 'Show Errors (diagnostics)' })

-- [[QUALITY OF LIFE IMPROVEMENTS]]
-- Ctrl-s to save
vim.keymap.set('n', '<C-s>', ':update<Enter>') --Ctrl+S is for saving
vim.keymap.set('i', '<C-s>', '<Esc>:update<Enter>')
-- Could try <M-s> on MacOs and see if that works with command-s as well? 

-- Ctrl-backspace in insert to delete a word
vim.keymap.set('i','<C-H>','<C-w>')  -- Some terminals map BS to Ctrl-H
vim.keymap.set('i','<C-BS>','<C-w>') -- Ctrl-w in insert mode deletes a word (closer to normal behaviour than '<Esc>dbi')

-- [[DISABLE]]
vim.keymap.set('n', 's', '<nop>') -- s is just a worse version of c
vim.keymap.set('n', 'S', '<nop>') -- S is just a worse version of cc
vim.keymap.set('n', 'gx', '<nop>') -- Is also disabled from showing in 'which-key' plugin

-- [[OTHER KEYBINDS]] 
-- TELESCOPE / Search : See lua/plugins/telescope.lua
-- LSP / Code Completion : lua/plugins/language-tools/lsp-config.lua and lua/plugins/language-tools/code-completion.lua 
-- CLIPBOARD : See lua/options.lua
-- FILE TREE : See lua/plugins/neo-tree.lua
