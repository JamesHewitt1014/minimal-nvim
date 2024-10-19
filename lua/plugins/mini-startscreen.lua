return {
    { -- Collection of various small independent plugins/modules
      'echasnovski/mini.nvim', --  Check out: https://github.com/echasnovski/mini.nvim
      config = function()
		local startscreen = require('mini.starter')
		startscreen.setup({
			evalute_single = true,
			items = {
					{name = "New File", action = ":enew", section = ""},
					{name = "Open File", action = ":Telescope find_files", section = ""},
					{name = "Recent Files", action = ":Telescope oldfiles", section = ""},
					{name = "Language Tools", action = ":Mason", section = ""},
					{name = "Plugin Manager", action = ":Lazy", section = ""},
					{name = "Quit Neovim", action = ":q", section = ""},
				-- startscreen.sections.recent_files(5, true),
				},
			header = "Hello World",
			footer = ""
			})
		require('mini.move').setup()
			-- Adds line movement with Alt + hjkl
			-- could also be done with remaps <> to >gv for indenting
			-- and could also map bind the move up move down...
      end,
    },
}
