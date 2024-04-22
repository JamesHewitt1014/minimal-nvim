-- [[KEYBINDS]]
-- How to use: vim.keymap.set(mode, keybind, result, options)

-- [[SPLIT WINDOW NAVIGATION]]
-- use CTRL + <hjkl> ti switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Opening new windows
vim.keymap.set('n', '<leader>h', ':new<Enter>', { desc = 'New Horizontal Window' })
vim.keymap.set('n', '<leader>v', ':vertical:new<Enter>', { desc = 'New Vertical Window' })

-- [[NVIM TERMINAL]]
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' }) -- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('n', '<leader>t', ':new<Enter>:terminal<Enter>i', {desc = 'Open Terminal'})

-- [[DIAGNOSTICS]]
vim.keymap.set('n', '<leader>e', vim.diagnostic.setloclist, { desc = 'Show Errors (diagnostics)' })

-- [[QUALITY OF LIFE IMPROVEMENTS]]
vim.keymap.set('n', '<C-s>', ':update<Enter>') --Ctrl+S is for saving
-- Could I also make a Ctrl + backspace ???

-- [[TELESCOPE & LSP FEATURES]] 
-- See lua/plugins/telescope.lua
-- See lua/plugins/language-tools/lsp-config.lua
