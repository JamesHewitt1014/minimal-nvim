--NOTE: blink.cmp docs - https://cmp.saghen.dev/ 

require('blink.cmp').setup({
	--Insert mode keybinds
	keymap = {
		preset = 'none',
		['<Up>'] = {'select_prev', 'fallback'},
		['<C-k>'] = {'select_prev', 'fallback'},
		['<C-p>'] = {'select_prev', 'fallback'},

		['<Down>'] = {'select_next', 'fallback'},
		['<C-j>'] = {'select_next', 'fallback'},
		['<C-n>'] = {'select_next', 'fallback'},

		['<Tab>'] = {'accept', 'fallback'},
		['<C-space>'] = {'show_documentation', 'fallback'},

		--NOTE: Fallback enables original functionality when no autocomplete (i.e. <Tab> inserts a tab)
	},

	-- Right now I don't need the performance or hassle of the rust version
	fuzzy = {implementation ="lua"},

	-- Suggestions when using commands (ex-mode)
  cmdline = {
		keymap = { preset = 'inherit'}, --use same as in insert mode
		completion = {menu = {auto_show = true}},
	},
	-- sources = {
	--  default = { "lazydev", "lsp", "path", "snippets", "buffer" },
	-- 	providers = {
	-- 		lazydev = {
	-- 			name = "LazyDev",
	-- 			module = "lazydev.integrations.blink",
	-- 			-- make lazydev completions top priority (see `:h blink.cmp`)
	-- 			score_offset = 100,
	-- 		},
	-- 	}
	-- }
})
