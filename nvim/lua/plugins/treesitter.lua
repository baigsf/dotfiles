-- =============================================================================
-- plugins/treesitter.lua - Syntax Highlighting
-- =============================================================================

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = {
      "lua", "vim", "vimdoc",
      "python", "javascript", "typescript", "tsx",
      "rust", "go", "c", "cpp",
      "json", "html", "css", "scss",
      "bash", "markdown", "markdown_inline", "regex",
      "java",
    },

    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },

    indent = { enable = true },

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = "<C-s>",
        node_decremental = "<C-backspace>",
      },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
