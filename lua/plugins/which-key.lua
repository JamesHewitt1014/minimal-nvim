return {
    { -- Useful plugin to show you pending keybinds.
      'folke/which-key.nvim',
      event = 'VimEnter', -- Sets the loading event to 'VimEnter'
      config = function() -- This is the function that runs, AFTER loading
        require('which-key').setup()

        -- normal mode
        require('which-key').register {
          ['<leader>l'] = { name = 'Language Tools', _ = 'which_key_ignore' },
          ['<leader>g'] = { name = 'Git Tools', _ = 'which_key_ignore' },
          ['<leader>ld'] = { name = 'Debug', _ = 'which_key_ignore'},
        }
        -- visual mode
        require('which-key').register({
          ['<leader>h'] = { 'Git [H]unk' },
        }, { mode = 'v' })
      end,
    },
  }
