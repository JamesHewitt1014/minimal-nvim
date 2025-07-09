function My_custom_picker()
  vim.ui.select({ "Option 1", "Option 2", "Option 3" }, {
    prompt = "Choose an option:",
  }, function(choice)
    print("You picked: " .. (choice or "nothing"))
  end)
end

require('mini.pick').setup()
require('mini.extra').setup()

-- Wrapping functions to avoid potential issues
Grep = function() Snacks.picker.grep() end
Search_files = function() Snacks.picker.files() end
File_explorer = function() Snacks.explorer.open() end
Help_picker = function() Snacks.picker.help() end
Buffers = function() Snacks.picker.buffers() end
Icons = function() Snacks.picker.icons() end
Layouts = function() Snacks.picker.picker_layouts() end
All_pickers = function() Snacks.picker() end

--Config
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
