return {
	{
		'hrsh7th/nvim-cmp',
		event = 'InsertEnter',
		dependencies = {
			'L3MON4D3/LuaSnip',   -- Core component
			'saadparwaiz1/cmp_luasnip', -- Core component
			'hrsh7th/cmp-nvim-lsp', -- Source for lsp connection
			'hrsh7th/cmp-path',   -- Source for directory/filepath completion
			-- 'rafamadriz/friendly-snippets', -- Source for a colleciton of snippets from VSCode
		},
		config = function()       -- See `:help cmp`
			local cmp = require 'cmp'
			local luasnip = require 'luasnip'
			--require("luasnip.loaders.from_vscode").lazy_load()
			luasnip.config.setup {}
			cmp.setup {
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				sources = {
					-- ADD CODE COMPLETION SOURCES HERE:
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
					{ name = 'path' }
					-- AI Completion tool would need to be connected here most likely
				},
				mapping = cmp.mapping.preset.insert {
					-- KEYBINDS
					['<C-j>'] = cmp.mapping.select_next_item(),
					['<C-k>'] = cmp.mapping.select_prev_item(),
					['<C-Space>'] = cmp.mapping.complete(),
					['<Enter>'] = cmp.mapping.confirm({ select = true }),
					['<Tab>'] = cmp.mapping.confirm({ select = true }),
				},
				window = {
					-- Look of the completion window
					-- completion = cmp.config.window.bordered(),
				}
			}
		end
	}
}
