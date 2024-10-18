-- NOTE: Plugins can specify dependencies.
-- The dependencies are proper plugin specifications as well - anything
-- Use the `dependencies` key to specify the dependencies of a particular plugin
return {
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },

      -- Telescope Theme Selector
      'andrew-george/telescope-themes',
    },
    config = function()
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      --  Insert mode: <c-/>
      -- This opens a window that shows you all of the keymaps for the current Telescope picker. This is really useful to discover what Telescope can do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        extensions = {
          ['ui-select'] = { require('telescope.themes').get_dropdown() },
        },
      }
      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
      pcall(require('telescope').load_extension, 'themes')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'

      ---- FILE SEARCH / NAVIGATION ----
      vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Search Files' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Search Open Files' })
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s', function()
        builtin.live_grep {
          grep_open_files = false,
          prompt_title = 'Live Grep in Files',
          -- Different layout than default
          layout_strategy = 'vertical',
          dynamic_preview_title = true,
          layout_config = {
            vertical = {
              width = 0.9,
              height = 0.9,
              preview_height = 0.6,
              preview_cutoff = 0,
            },
          },
          path_display = { 'smart', shorten = { len = 3 } },
        }
      end, { desc = 'Search (Grep) Files' })

      ---- SELECTORS ----
      -- vim.keymap.set('n', '<leader>T', builtin.colorscheme, { desc = ' Change Theme' })
      vim.keymap.set('n', '<leader>T', ':Telescope themes<CR>', { silent = true, desc = 'Change Theme' })
      vim.keymap.set('n', '<leader>m', builtin.marks, { desc = 'Marks' })
      vim.keymap.set('n', '<leader>n', ':TodoTelescope<Enter>', {desc = 'Todos'})

      -- ALL TELESCOPE SELECTORS 
      -- vim.keymap.set('n', '<leader>z', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })

      --Git Pickers
      vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'List git commits' })
      vim.keymap.set('n', '<leader>gl', builtin.git_branches, { desc = 'List git branches' })

      -- vim.keymap.set('n', '<leader>sn', function()
      --   builtin.find_files { cwd = vim.fn.stdpath 'config' }
      -- end, { desc = '[S]earch [N]eovim files' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
