-- =============================================================================
-- config/autocmds.lua - Autocommands
-- =============================================================================

-- Re-apply transparency after colorscheme loads
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.cmd("highlight Normal ctermbg=NONE guibg=NONE")
    vim.cmd("highlight NormalFloat ctermbg=NONE guibg=NONE")
    vim.cmd("highlight NonText ctermbg=NONE guibg=NONE")
    if package.loaded["nvim-tree"] then
      require("nvim-tree").refresh()
    end
  end,
})

-- Netrw settings
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 0
vim.g.netrw_altv = 1
vim.g.netrw_winsize = 25
vim.g.netrw_keepdir = 0
vim.g.netrw_localcopydircmd = "cp -r"

-- Netrw keymaps
vim.api.nvim_create_autocmd("filetype", {
  pattern = "netrw",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "n", "l", ":call netrw#Call(\"NetrwOpenFile\")<CR>", { silent = true })
    vim.api.nvim_buf_set_keymap(0, "n", "h", "-", { silent = true })
    vim.api.nvim_buf_set_keymap(0, "n", "q", ":q<CR>", { silent = true })
  end,
})
