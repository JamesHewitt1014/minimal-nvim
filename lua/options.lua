--NOTE: To set settings for individual file types see "after/ftplugin/<FILETYPE>.lua"

-- DIAGNOSTICS
require('language-tools.diagnostics')

-- GUI
vim.g.have_nerd_font = true
vim.opt.termguicolors = true -- Needed for some terminals to display themes correctly
vim.opt.number = true
vim.opt.signcolumn = 'auto'
vim.opt.cursorline = true -- highlight line your cursor is on
vim.opt.scrolloff = 7 -- minimium number of lines to keep above and below the cursor

-- INDENTATION / WHITESPACE
vim.opt.breakindent = true -- Allows lines to overflow
vim.opt.tabstop = 4 -- Tab Size - Vim default is 8, VSCode default is 4
vim.opt.shiftwidth = 4 -- Amount of whittespace for one level of indentation
vim.opt.list = true
vim.opt.listchars = { tab = '  ', trail = '·' } -- Sets how neovim will display certain whitespace characters in the editor. See `:help 'list'` and `:help 'listchars'`

-- VIM Search Settings
vim.opt.ignorecase = true -- Ignore case-sensitive search with /?
vim.opt.smartcase = true  -- If search includes a capital then make it case senstive
vim.opt.hlsearch = true   -- Highlight on search
vim.opt.incsearch = true  -- Start searching as you type, rather then waiting for submit
vim.keymap.set('n', '<ESC>', '<cmd>nohlsearch<CR>') -- Clear search highlight when pressing escape
vim.opt.inccommand = 'split' -- When using vim :(s)ubstite (search and replace) preview substitutions live in document as you type

-- FILE HISTORY
vim.opt.undofile = true -- Save undo history when document / nvim is closed

-- CLIPBOARD
-- :checkhealth or :h clipboard to check if NVIM has clipboard access
vim.opt.clipboard = 'unnamedplus' -- Sets neovim to use system clipboard (use 'unamed' if having issues)
vim.keymap.set('n', 'd', '"cd') -- Copies into register a copy register instead of the system clipboard
vim.keymap.set('v', 'd', '"cd')
vim.keymap.set('n', 'c', '"cc')
vim.keymap.set('v', 'c', '"cc')
-- Change (d)elete and (c)change to not copy text (no longer cut)
--TODO: Do I want to try standard vim copypaste???

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

--TODO: Better folding?
-- CODE FOLDING
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldcolumn = "0"
-- vim.opt.foldtext = ""
-- vim.opt.foldexpr = "v:lua.vim.lsp.foldexpr()"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
