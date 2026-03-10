-- =============================================================================
-- plugins/init.lua - Plugin Entry Point
-- =============================================================================

require("lazy").setup({
  require("plugins.ui"),
  require("plugins.telescope"),
  require("plugins.lsp"),
  require("plugins.cmp"),
  require("plugins.treesitter"),
  require("plugins.git"),
  require("plugins.utils"),
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
