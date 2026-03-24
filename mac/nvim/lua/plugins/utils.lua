-- =============================================================================
-- plugins/utils.lua - Utility Plugins
-- =============================================================================

return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },

  {
    "numToStr/Comment.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("Comment").setup({})
    end,
  },

  {
    "karb94/neoscroll.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("neoscroll").setup({
        hide_cursor = true,
        easing = "quadratic",
      })
    end,
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("render-markdown").setup({})
    end,
  },
}
