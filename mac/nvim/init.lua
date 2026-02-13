-- init.lua for GlassBetter theme

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
vim.opt.virtualedit = "onemore"

-- Keymaps for quitting
vim.keymap.set("n", "ZZ", ":wq<CR>", { silent = true })
vim.keymap.set("n", "ZQ", ":q!<CR>", { silent = true })

-- Apply the GlassBetter colorscheme
vim.cmd.colorscheme "gruvpink"
