return {
    { -- Useful plugin to show you pending keybinds.
      'folke/which-key.nvim',
      event = 'VimEnter', -- Sets the loading event to 'VimEnter'
      config = function() -- This is the function that runs, AFTER loading
		local which_key = require('which-key')
		which_key.setup({
				preset = "helix", -- Classic or Helix
				win = {
					border = "none",
				}
			})
		which_key.add(
				{
					{'<leader>l', desc = "Language Tools", icon = ""},
					{'<leader>g', desc = "Git Tools", icon = ""},
					{'<leader>w', desc = "Window Management"},
					{'<leader>ld', desc = "Debug (GO-Only)"},
					{'<leader>T', icon = ""},
					{'<leader>m', icon = ""},
					{'<leader>n', icon = ""},
					{'gx', hidden = true },
				}
			)
      end,
    },
  }
