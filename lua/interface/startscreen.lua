local startscreen = require('mini.starter')
startscreen.setup({
	evalute_single = true,
	header = "Hello World",
	items = {
			{name = "New File", action = ":enew", section = ""},
			{name = "Open File", action = FindFile, section = ""},
			{name = "Recent Files", action = RecentFiles, section = ""},
			{name = "Language Servers", action = ":Mason", section = ""},
			{name = "Quit Neovim", action = ":q", section = ""},
	},
	footer = "The End. ?"
})

-- TODO: Do I want sessions?
