-- =============================================================================
-- plugins/init.lua - Plugin Manager Setup
-- =============================================================================

require("lazy").setup({
  { import = "plugins.ui" },
  { import = "plugins.telescope" },
  { import = "plugins.lsp" },
  { import = "plugins.cmp" },
  { import = "plugins.treesitter" },
  { import = "plugins.git" },
  { import = "plugins.utils" },
}, {
  install = { colorscheme = { "default" } },
  checker = { enabled = true, notify = false },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip", "matchit", "matchparen",
        "tarPlugin", "tohtml", "tutor", "zipPlugin",
      },
    },
  },
})
