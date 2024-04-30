-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
      { '<Tab>', ':Neotree reveal<CR>', { silent = true, desc = 'NeoTree reveal' } },
    },
    opts = {
      filesystem = {
        window = {
          mappings = {
            ['<Tab>'] = 'close_window',
            -- Lets remap open close from '\' to 'tab' :) 
          },
        },
      },
    },
  }
