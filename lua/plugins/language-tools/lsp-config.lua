return {
  {
    -- Language Tools Package Manager (Language Servers, Linters, Debuggers, Formatters)
    'williamboman/mason.nvim',
    config = function()
      require("mason").setup()
    end
  },
  {
    -- Connects Mason (Language Tools Manager) to LSPConfig (Nvim LSP connections)
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require("mason-lspconfig").setup({
        -- Default language server installs
        ensure_installed = {
          "lua_ls",
          "tsserver",
        }
      })

      require("mason-lspconfig").setup_handlers({
        -- Connect the "ensure installed" servers to nvim
        function(server_name)
          require("lspconfig")[server_name].setup {}
        end
      })
    end
  },
  {
    -- Connect NVIM to Language Servers
    "neovim/nvim-lspconfig",
    config = function()
      -- LSP KEYBINDINGS
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Hover Documentation" })
      vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, { desc = "Goto Definitions" })
      vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = "Goto References" })
      vim.keymap.set('n', 'gI', require('telescope.builtin').lsp_implementations, { desc = "Goto Implementations" })
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "Goto Declaration" })
      vim.keymap.set('n', '<leader>lD', require('telescope.builtin').lsp_type_definitions, { desc = "Type Definitions" })
      vim.keymap.set('n', '<leader>ls', require('telescope.builtin').lsp_document_symbols, { desc = "Document Symbols" })
      vim.keymap.set('n', '<leader>lS', require('telescope.builtin').lsp_dynamic_workspace_symbols,
        { desc = "Workspace Symbols" })
      vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { desc = "Rename" })
      vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { desc = "Code Action" })
      vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { desc = "Format Code" })
    end
  },
  -- OPTIONAL: NeoDev configures the Lua LSP to understand vim / nvim settings and documentation
  { 'folke/neodev.nvim', opts = {} },
}
