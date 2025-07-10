local hints = require('mini.clue')

local function hint(mode, key, text)
	return { mode = mode, keys = key, desc = text}
end

hints.setup({
	triggers = {
		{ mode = 'n', keys = '<leader>' },
		{ mode = 'n', keys = 'g' }, --goto
		{ mode = 'n', keys = "'" }, --marks
		{ mode = 'n', keys = '"' }, --registers	
		{ mode = 'n', keys = '<C-w>'}
	},
	clues = {
		--hints.gen_clues.builtin_completion(),
		--hints.gen_clues.marks(),
		hints.gen_clues.registers({
			show_contents = true
		}),
		hints.gen_clues.windows(),
		hint('n', 'ga', "ASCII character details"),
		hint('n', 'gu', "Make text lowercase"),
		hint('n', 'gU', "Make text uppercase"),
		hint('n', 'gv', "Reselect last selection"),
		hint('n', 'gf', "Goto file under cursor"),
		hint('n', '<leader>l', "Language Tools"),
		{ mode = 'n', keys = 'g%', 'Test'}
	}
})
