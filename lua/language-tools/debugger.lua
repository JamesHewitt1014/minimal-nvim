-- Mason-Nvim-Dap should be able to autoconfigure but I can't get it to work...
-- require("mason-nvim-dap").setup({ --NOTE: Must load after mason
-- 	automatic_installation = true,
-- 	ensure_installed = {"delve"}
-- })

local dap = require('dap')
local dap_ui = require('dapui')

-- UI Setup
dap_ui.setup({
	icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
	controls = {
		icons = {
			pause = '⏸',
			play = '▶',
			step_into = '⏎',
			step_over = '⏭',
			step_out = '⏮',
			step_back = 'b',
			run_last = '▶▶',
			terminate = '⏹',
			disconnect = '⏏',
		}
	}
})

-- Automatically open / close DAP UI when debugger stops or starts
dap.listeners.before.attach.dapui_config = function()
  dap_ui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dap_ui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dap_ui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dap_ui.close()
end

-- Basic debugging keymaps
vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
vim.keymap.set('n', '<leader>ldD', dap.continue, { desc = 'Debug: Start' })
vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
vim.keymap.set('n', '<leader>ldb', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
vim.keymap.set('n', '<leader>ldB', function()
	dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end, { desc = 'Debug: Set Breakpoint' })
-- Also dap_ui.toggle() function to toggle the UI on or off
-- TODO: Keymaps...

-- Setup for individual debuggers
require('dap-go').setup()

