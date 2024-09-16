-- [[ List of installed plugins ]]
-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
-- NOTE: Plugins can also be added by using a table,
-- with the first argument being the link and the following
-- keys can be used to configure plugin behavior/loading/etc.
--
-- Use `opts = {}` to force a plugin to be loaded.
--  This is equivalent to:
--    require('Comment').setup({})

return {
  -- THEMES
  require 'plugins.themes.tokyonight',
  require 'plugins.themes.gruvbox',
  require 'plugins.themes.catppuccin',
  require 'plugins.themes.miasma',
  require 'plugins.themes.nightfox',
  require 'plugins.themes.moonfly',
  -- UI
  require 'plugins/lualine',
  require 'plugins/startscreen',
  require 'plugins/which-key',
  require 'plugins/telescope',
  require 'plugins/neo-tree',
  -- Language Tools 
  require 'plugins/language-tools/lsp-config',
  require 'plugins/language-tools/code-completion',
  require 'plugins/language-tools/treesitter',
  require 'plugins/language-tools/kickstart/debug', -- Edit at some point :) 
  -- Other Utilities
  require 'plugins/mini-comments', -- Comments
  require 'plugins/gitsigns',
  require 'plugins/autopairs',
  require 'plugins/colour-highlight',
}
