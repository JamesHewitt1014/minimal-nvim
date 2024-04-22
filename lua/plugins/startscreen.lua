return {
    'goolord/alpha-nvim',
    config = function ()
        local alpha = require'alpha'
        local dashboard = require'alpha.themes.dashboard'
        dashboard.section.header.val = {
	 [[ ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
	 [[ ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
	 [[ ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
	 [[ ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
	 [[ ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
	 [[ ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
	}
        dashboard.section.buttons.val = {
            dashboard.button("e", "  New File", ":enew<Enter>"),
            dashboard.button("f", "  find file", ":Telescope find_files <Enter>"),
            dashboard.button("r", "  Recently opened files", ":Telescope oldfiles <Enter>"),
            dashboard.button("l", "  Language Tools", ":Mason <Enter>"),
            dashboard.button("p", "󰒓  Plugin manager", ":Lazy <Enter>"),
            dashboard.button("q", "󰩈  Quit NVIM", ":q<Enter>"),
        }
       alpha.setup(dashboard.config)
    end
}
