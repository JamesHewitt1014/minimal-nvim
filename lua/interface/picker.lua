function my_custom_picker()
  vim.ui.select({ "Option 1", "Option 2", "Option 3" }, {
    prompt = "Choose an option:",
  }, function(choice)
    print("You picked: " .. (choice or "nothing"))
  end)
end

return {
  enabled = true,
  sources = {
    explorer = {
			--NOTE: cli tool 'fd' is required for search in the file explorer
			auto_close = true,
      win = {
				list = {
					keys = {
      			--Disable keybinds I don't like
						["<c-c>"] = "",
						["<c-t>"] = "",
						["<leader>/"] = ""
					}
					--TODO: Maybe configure the file exporer keybinds a bit more
				}
      }
    },
		buffers = {
			layout = { preset = "sidebar", preview = false },
			focus = "list",
			win = {
				list = {
					keys = {	["c"] = { "bufdelete"	}} -- Close buffer
					--TODO: More work on the keybinds
				}
			}
		},
		lsp_symbols = {
			layout = { preset = "sidebar", preview = false },
			tree = true,
		}
  },
	icons = {
		tree = {
			vertical = "  ",--"│ ",
			middle   = "  ",--"├╴",
			last     = "  ",--"└╴",
		},
	}
}
