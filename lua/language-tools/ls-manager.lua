-- NOTE: Most languages provide a LSP as part of their SDK / Tooling
-- nvim-lspconfig provides default configurations between various LSPs and the Nvim LSP Client
-- Mason is a language tools package manager (i.e. install LSPs)
-- Mason-lspconfig connects nvim-lspconfig with Mason - allowing Mason to both install and enable a LSP in nvim 

-- Not all Language Servers are available in the Mason registry, as such, below is an example of how to configure lsp-config manually (in Nvim 0.11+)
-- vim.lsp.config('<LSP_NAME>', {
	-- settings = {
		-- ['<LSP_NAME>'] = {},
	-- }
-- })

require("mason").setup({
	registries = {
		"github:mason-org/mason-registry", --Standard mason registry
		"github:Crashdummyy/mason-registry" -- Contains C# Roslyn & Razor rzls
	}
})
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls", -- Lua lsp (because neovim uses lua)
		"ts_ls", -- LSP for Typescript but also covers JS and React (JSX/TSX)
		"cssls", -- CSS
		"html",
	},
	automatic_setup = true,
})

--NOTE: CSharp Language Server Options
-- csharp_ls (csharp language server) - available on Mason but lacking in features
-- Roslyn - only available through the MS VSCode C# Extension
-- Roslyn can be connected through lsp-config or by the roslyn.nvim plugin which enables additional features
-- Also rzls.nvim if razor support is required
--
local add_plugin = MiniDeps.add
add_plugin({source='seblyng/roslyn.nvim'})
require('roslyn').setup({
	broad_search = true,
})

-- vim.lsp.config('roslyn', {
-- 	settings = {
-- 		['roslyn'] = {},
-- 	}
-- })

-- require("roslyn").setup({
--     cmd = cmd,
--     config = {
--         -- the rest of your Roslyn configuration
--         handlers = require("rzls.roslyn_handlers"),
--     },
-- })
-- https://github.com/tris203/rzls.nvim
