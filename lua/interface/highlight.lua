local hipatterns = require('mini.hipatterns')
hipatterns.setup({
	highlighters = {
		-- Highlight hex color strings (i.e. #4832a8)
		hex_color = hipatterns.gen_highlighter.hex_color(),

		-- Highlight comment tags (i.e. TODO, NOTE, etc)
    todo  = { pattern = {'TODO:', 'TODO'},  group = 'MiniHipatternsTodo'  },
    note  = { pattern = {'NOTE', 'Note:', 'NOTE:', 'PERF:'},  group = 'MiniHipatternsNote'  },
    warn  = { pattern = {'WARN', 'WARNING', 'HACK'},  group = 'MiniHipatternsHack'  },
		fix = { pattern = {'FIX', 'FIX:', 'FIXME', 'BUG'}, group = 'MiniHipatternsFixme' },
	},
})
