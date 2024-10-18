return {
    { -- Useful plugin to show you pending keybinds.
      'folke/which-key.nvim',
      event = 'VimEnter', -- Sets the loading event to 'VimEnter'
      config = function() -- This is the function that runs, AFTER loading
		require('which-key').add(
				{
					{'<leader>l', desc = "Language Tools", icon = ""},
					{'<leader>g', desc = "Git Tools", icon = ""},
					{'<leader>w', desc = "Window Management"},
					{'<leader>T', icon = ""},
					{'<leader>m', icon = ""},
					{'<leader>n', icon = ""},
					{'gx', hidden = true },
				}
			)
      end,
    },
  }
