-- Basic Neovim config

-- Line numbers
vim.opt.number = true

-- Use your terminal's background (don’t override colorscheme)
vim.opt.termguicolors = true
vim.cmd("highlight Normal ctermbg=NONE guibg=NONE")
vim.cmd("highlight NonText ctermbg=NONE guibg=NONE")

-- Sensible defaults
vim.opt.relativenumber = false   -- only absolute numbers
vim.opt.mouse = "a"              -- enable mouse support
vim.opt.clipboard = "unnamedplus" -- use system clipboard

-- Keymaps for quitting
vim.keymap.set("n", "ZZ", ":wq<CR>", { silent = true })
vim.keymap.set("n", "ZQ", ":q!<CR>", { silent = true })


-- apply the colorscheme
vim.cmd.colorscheme "catppuccin"

require("catppuccin").setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  transparent_background = true, -- 👈 this keeps your terminal’s background
})
vim.cmd.colorscheme "catppuccin"
