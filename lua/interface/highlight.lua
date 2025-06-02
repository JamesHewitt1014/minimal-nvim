local hipatterns = require('mini.hipatterns')
hipatterns.setup({
	highlighters = {
		-- Highlight hex color strings (i.e. #4832a8)
		hex_color = hipatterns.gen_highlighter.hex_color(),

		-- Highlight comment tags (i.e. TODO, NOTE, etc)
    todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
    note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },
    perf  = { pattern = '%f[%w]()PERF()%f[%W]',  group = 'MiniHipatternsNote'  },
    warn  = { pattern = '%f[%w]()WARN()%f[%W]',  group = 'MiniHipatternsHack'  },
    warning  = { pattern = '%f[%w]()WARNING()%f[%W]',  group = 'MiniHiPatternsHack'  },
		fix = { pattern = '%f[%w]()FIX()%f[%W]', group = 'MiniHipatternsFixme' },
		fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
	},
})
