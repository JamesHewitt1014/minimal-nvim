-- EDITOR OPTIONS
-- See `:help vim.opt`
-- For more options, you can see `:help option-list`

-- LEADER KEY
-- Must be set before plugins are loaded.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- GUI / FONT OPTIONS
vim.g.have_nerd_font = true -- Set to true if you have a Nerd Font installed
vim.opt.termguicolors = true -- Needed for some terminals to display themes correctly

-- CLIPBOARD and FILE HISTORY
vim.opt.clipboard = 'unnamedplus' -- Sets neovim to use system clipboard, on macOS / Windows might be 'unnamed' instead.
vim.opt.undofile = true -- Save undo history
-- Do :checkhealth or :h clipboard to check if NVIM has clipboard access

-- Highlight / Flash selection when copying text - autocommand (see ':help lua-guide-autocommands')
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- LINE NUMBERS
vim.opt.number = true -- Sets vim to use absolute line numbers
-- Alternative for relative numbers is: vim.o.relativenumber = true
vim.opt.signcolumn = 'yes'

-- MOUSE
vim.opt.mouse = 'a' -- enable the mouse

-- CURSOR
vim.opt.cursorline = true -- highlight line your cursor is on
vim.opt.scrolloff = 10 -- minimium number of lines to keep above and below the cursor

-- INDENTATION
vim.opt.breakindent = true -- Allows lines to overflow
vim.opt.tabstop = 4 -- Tab Size - Vim default is 8, VSCode default is 4
vim.opt.shiftwidth = 4 -- Indentation using vim commands
vim.opt.list = true -- Sets how neovim will display certain whitespace characters in the editor. See `:help 'list'` and `:help 'listchars'`
vim.opt.listchars = { tab = '  ', trail = '·' } --  

-- VIM Search Settings
vim.opt.ignorecase = true -- Ignore case-sensitive search with /?
vim.opt.smartcase = true -- When true = If include one or more capital letters then be case sensitive
vim.opt.hlsearch = true -- Highlight on search
vim.keymap.set('n', '<ESC>', '<cmd>nohlsearch<CR>') -- Clear search highlight when pressing escape

-- SPLIT SCREEN
-- Defaults for how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-------------------------------------------------------------------------------- DONT KNOW????

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time (Displays which-key popup sooner)
vim.opt.timeoutlen = 300

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'
