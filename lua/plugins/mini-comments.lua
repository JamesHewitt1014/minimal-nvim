return {
    { -- Collection of various small independent plugins/modules
      'echasnovski/mini.nvim',
      config = function()
        -- local statusline = require 'mini.statusline'
        -- statusline.setup { use_icons = vim.g.have_nerd_font } -- set use_icons to true if you have a Nerd Font
        --
        -- -- You can configure sections in the statusline by overriding their default behavior. For example, here we set the section for cursor location to LINE:COLUMN
        -- ---@diagnostic disable-next-line: duplicate-set-field
        -- statusline.section_location = function()
        --   return '%2l:%-2v'
        -- end

        --  Mini.nvim contains more than just a statusline
        --  Check out: https://github.com/echasnovski/mini.nvim
		require('mini.comment').setup()
		-- local miniclue = require('mini.clue')
		-- miniclue.setup({
		-- 		triggers = {
		-- 			{ mode = 'n', keys = '<Leader>'},
		--   				{ mode = 'n', keys = 'g' },
		-- 		},
		-- 		window ={
		-- 			delay = 0,
		-- 			width = 'auto',
		-- 			border = 'double'
		-- 		},
		-- 		clues = {
		-- 			{mode = 'n', keys = '<Leader>l', desc = '+Language Tools'},
		-- 			{mode = 'n', keys = '<Leader>g', desc = '+Git Tools'},
		-- 			-- miniclue.gen_clues.g(),
		-- 		}
		-- 	})
      end,
    },
}

-- mini.move also seems pre good...
-- Could replace startscreen with mini.starter I reckon - https://www.reddit.com/r/neovim/comments/1bw0f6z/ministarter_is_amazing/
--
