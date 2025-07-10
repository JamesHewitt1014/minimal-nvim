local MiniPick = require('mini.pick')
local MiniExtra = require('mini.extra')

MiniExtra.setup()

MiniPick.setup({
	-- mappings = {
	-- 	--stop = '<C-q>'
	-- }
})

-- Replace standard vim ui select with mini.pick
vim.ui.select = MiniPick.ui_select

-- Pickers
function FindFile()
	MiniPick.builtin.files({tool='fd'})
end

function GrepFiles()
	MiniPick.builtin.grep_live({tool='rg'})
end

function SearchHelp()
	MiniPick.builtin.help()
end

function RecentFiles()
	MiniExtra.pickers.oldfiles()
end

function GoToDeclaration()
	MiniExtra.pickers.lsp({scope='declaration'})
end

function GoToImplementation()
	MiniExtra.pickers.lsp({scope='implementation'})
end

function GoToTypeDefinition()
	MiniExtra.pickers.lsp({scope='type_definition'})
end

function GoToReferences()
	MiniExtra.pickers.lsp({scope='references'})
end

function ListSymbols()
	MiniExtra.pickers.lsp({scope='document_symbol'})
end

local function SearchOptions()
	MiniExtra.pickers.options()
end

function My_custom_picker()
  vim.ui.select({ "Option 1", "Option 2", "Option 3" }, {
    prompt = "Choose an option:",
  }, function(choice)
    print("You picked: " .. (choice or "nothing"))
  end)
end
