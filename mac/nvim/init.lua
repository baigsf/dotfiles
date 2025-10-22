-- init.lua

-- Line numbers
vim.opt.number = true

-- Use your terminal's background
vim.opt.termguicolors = true
vim.cmd("highlight Normal ctermbg=NONE guibg=NONE")
vim.cmd("highlight NonText ctermbg=NONE guibg=NONE")

-- Sensible defaults
vim.opt.relativenumber = false
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

-- Keymaps for quitting
vim.keymap.set("n", "ZZ", ":wq<CR>", { silent = true })
vim.keymap.set("n", "ZQ", ":q!<CR>", { silent = true })

-- Gruvbox setup
require("gruvbox").setup({
  -- This is the key setting for a transparent background
  transparent_mode = "hard",
})

-- Apply the colorscheme
vim.cmd.colorscheme "gruvbox"
