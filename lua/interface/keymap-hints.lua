local hints = require('mini.clue')
hints.setup({
	triggers = {
		{ mode = 'n', keys = '<leader>' },
		{ mode = 'n', keys = 'g' }, --goto
		{ mode = 'n', keys = "'" }, --marks
		{ mode = 'n', keys = '"' }, --registers	
	},
	clues = {
		hints.gen_clues.builtin_completion(),
		hints.gen_clues.g(),
		hints.gen_clues.marks({
			show_contents = true
		}),
		hints.gen_clues.registers({
			show_contents = true
		}),
	}
})
--TODO: Update this :)
