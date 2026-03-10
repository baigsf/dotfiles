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
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("ibl").setup({
        indent = {
          char = "│",
          highlight = "IblIndent",
        },
        scope = {
          enabled = true,
          show_start = true,
          show_end = false,
          highlight = "IblScope",
        },
      })

      vim.api.nvim_set_hl(0, "IblIndent", { fg = "#181825" })
      vim.api.nvim_set_hl(0, "IblScope", { fg = "#1e1e2e" })
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
}
