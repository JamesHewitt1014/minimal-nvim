local harpoon = require('harpoon')
harpoon:setup({
	settings = {
		save_on_toggle = true,
	}
})

local harpoon_extensions = require("harpoon.extensions")
harpoon:extend(harpoon_extensions.builtins.highlight_current_file())

function MarkFile()
	harpoon:list():add()
end

function ListFileMarks()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end

-- Wrapper for keymaps
local function goto_mark(index)
	harpoon:list():select(index)
end
GotoMark1 = function() goto_mark(1) end
GotoMark2 = function() goto_mark(2) end
GotoMark3 = function() goto_mark(3) end

-- TODO: 
-- Potential Improvements - see code from harpoon, lasso.nvim, and marks.nvim
-- Write my own version that doesn't require plenary as a dependancy
-- + supports terminals out of the box
-- + also marks improvements (i.e. adds to sign column, easier delete, etc)
-- alternative: could use native marks with number row 1..9 instead then write a script to show a floating window with my numbered marks
