local function float_diagnostic_text(diagnostic)
	local type = vim.diagnostic.severity[diagnostic.severity]
	return string.format("%s: %s", type, diagnostic.message)
end

vim.diagnostic.config({
	severity_sort = true, -- Priortise Error -> Warn -> Info -> Hint
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "", -- Remove signs in status column
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = 'DiagnosticError',
			[vim.diagnostic.severity.WARN] = 'DiagnosticWarn',
			[vim.diagnostic.severity.INFO] = 'DiagnosticInfo',
			[vim.diagnostic.severity.HINT] = 'DiagnosticHint',
		},
		--TODO: Try virtual text highlighting on error? instead of squiggle
		--QUESTION: How do themes influence highlights - see highlight picker
		-- I don't always like that the hint/info blurs the line...
	},
	underline = true,
	float = {                 -- Configuration for the diagnostic floating window
		focusable = false,
		border = "rounded",
		source = false,
		header = "Diagnostics",
		prefix = "",
		format = float_diagnostic_text;
  },
})

OpenFloatingDiagnostic = function()
	vim.diagnostic.open_float(0, {scope = "line"})
end
--TODO: I Want to play around with this more... see what I can do...
-- See https://www.youtube.com/watch?v=5PIiKDES_wc
-- Also see snacks.layout

ToggleInlineErrors = function()
	local toggleLines = not vim.diagnostic.config().virtual_lines
	vim.diagnostic.config({virtual_lines = toggleLines})
end

ToggleTrailingErrors = function()
	local newStatus = not vim.diagnostic.is_enabled()
	vim.diagnostic.enable(newStatus)
end

