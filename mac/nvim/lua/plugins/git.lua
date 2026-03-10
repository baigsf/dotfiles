-- =============================================================================
-- plugins/git.lua - Git Integration
-- =============================================================================

return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "+" },
          change = { text = "~" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
        },
        signs_staged = {
          add = { text = "+" },
          change = { text = "~" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
        },

        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          vim.keymap.set("n", "<leader>gj", gs.next_hunk, { buffer = bufnr, desc = "Next hunk" })
          vim.keymap.set("n", "<leader>gk", gs.prev_hunk, { buffer = bufnr, desc = "Previous hunk" })

          vim.keymap.set("n", "<leader>gs", gs.stage_hunk, { buffer = bufnr, desc = "Stage hunk" })
          vim.keymap.set("n", "<leader>gr", gs.reset_hunk, { buffer = bufnr, desc = "Reset hunk" })
          vim.keymap.set("v", "<leader>gs", function() gs.stage_hunk {vim.fn.line("."), vim.fn.line("v")} end, { buffer = bufnr, desc = "Stage hunk" })
          vim.keymap.set("v", "<leader>gr", function() gs.reset_hunk {vim.fn.line("."), vim.fn.line("v")} end, { buffer = bufnr, desc = "Reset hunk" })

          vim.keymap.set("n", "<leader>gS", gs.stage_buffer, { buffer = bufnr, desc = "Stage buffer" })
          vim.keymap.set("n", "<leader>gu", gs.undo_stage_hunk, { buffer = bufnr, desc = "Undo stage hunk" })
          vim.keymap.set("n", "<leader>gR", gs.reset_buffer, { buffer = bufnr, desc = "Reset buffer" })

          vim.keymap.set("n", "<leader>gp", gs.preview_hunk, { buffer = bufnr, desc = "Preview hunk" })
          vim.keymap.set("n", "<leader>gb", function() gs.blame_line{full=true} end, { buffer = bufnr, desc = "Blame line" })
          vim.keymap.set("n", "<leader>gB", gs.toggle_current_line_blame, { buffer = bufnr, desc = "Toggle blame" })

          vim.keymap.set("n", "<leader>gd", gs.diffthis, { buffer = bufnr, desc = "Diff this" })
          vim.keymap.set("n", "<leader>gD", function() gs.diffthis("~") end, { buffer = bufnr, desc = "Diff this ~" })
        end,
      })
    end,
  },
}
