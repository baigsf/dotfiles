-- =============================================================================
-- config/keymaps.lua - Keybindings
-- =============================================================================

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Quick save/quit
vim.keymap.set("n", "ZZ", ":wq<CR>", { silent = true, desc = "Save and quit" })
vim.keymap.set("n", "ZQ", ":q!<CR>", { silent = true, desc = "Quit without saving" })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Visual mode - better indenting
vim.keymap.set("v", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Normal mode - clear search highlight
vim.keymap.set("n", "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Leader commands - file operations
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
vim.keymap.set("n", "<leader>h", "<cmd>Alpha<cr>", { desc = "Go to homepage" })

-- Flash.nvim
vim.keymap.set({ "n", "x", "o" }, "s", function()
  require("flash").jump()
end, { desc = "Flash" })

vim.keymap.set({ "n", "x", "o" }, "S", function()
  require("flash").treesitter()
end, { desc = "Flash treesitter" })
