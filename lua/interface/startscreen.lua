local startscreen = require('mini.starter')
startscreen.setup({
	evalute_single = true,
	items = {
			{name = "New File", action = ":enew", section = ""},
			{name = "Open File", action = FindFile, section = ""},
			{name = "Recent Files", action = RecentFiles, section = ""},
			--{name = "Projects", action = Snacks.picker.projects, section = ""},
			{name = "Language Servers", action = ":Mason", section = ""},
			{name = "Quit Neovim", action = ":q", section = ""},
	},
	header = "Hello World",
	footer = "The End. ?"
})
