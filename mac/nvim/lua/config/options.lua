-- =============================================================================
-- config/options.lua - Neovim Options
-- =============================================================================

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Terminal colors & transparency
vim.opt.termguicolors = true
vim.cmd("highlight Normal ctermbg=NONE guibg=NONE")
vim.cmd("highlight NonText ctermbg=NONE guibg=NONE")

-- Sensible defaults
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.virtualedit = "onemore"

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- UI
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"

-- Scrolling
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.scroll = 15

-- Backup & Files
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undofile = true

-- Split behavior
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Performance
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
