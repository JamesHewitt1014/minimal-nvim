return {
	'brenoprata10/nvim-highlight-colors',
	config = function ()
		require('nvim-highlight-colors').setup({
			render = 'foreground',
			virtual_symbol = '■',
			enable_tailwind = true, -- Support for tailwind text
		})
	end
}

