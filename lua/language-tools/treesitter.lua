-- https://github.com/nvim-treesitter/nvim-treesitter/blob/main/README.md#Supported-features

local later = MiniDeps.later
local treesitter = require('nvim-treesitter')

later(treesitter.setup {
	--Directory to install parsers and queries 
	install_dir = vim.fn.stdpath('data') .. '/site',
})

-- List all languages that you want treesitter have parsers for
treesitter.install({'lua', 'rust'})

-- Enable highlighting in filetypes
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'rs', 'lua' }, -- Add file names here (i.e. rs, lua, go, etc)
  callback = function() vim.treesitter.start() end,
})

--TODO: Do I want to add keymaps for ':Inspect' and ':InspectTree' 
