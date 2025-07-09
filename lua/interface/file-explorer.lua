local MiniFiles = require("mini.files")
MiniFiles.setup({

})

FileExplorerToggle = function()
	if not MiniFiles.close() then MiniFiles.open() end
end


