-- =============================================================================
-- colors/init.lua - Colorscheme Loader
-- =============================================================================

local M = {}

local colors_dir = vim.fn.stdpath("config") .. "/lua/colors"

local available_colors = {
  "dracula",
  "catppuccin_mocha",
  "duskfox",
  "rose-pine",
  "tokyonight",
  "gruvbox",
  "gruvpink",
}

function M.list()
  print("Available colorschemes:")
  for _, color in ipairs(available_colors) do
    print("  - " .. color)
  end
end

function M.load(name)
  name = name or "gruvpink"

  local found = false
  for _, color in ipairs(available_colors) do
    if color == name then
      found = true
      break
    end
  end

  if not found then
    vim.notify("Colorscheme '" .. name .. "' not found. Using default.", vim.log.levels.WARN)
    name = "default"
  end

  local ok, err = pcall(require, "colors." .. name)
  if not ok then
    vim.notify("Failed to load colorscheme: " .. err, vim.log.levels.ERROR)
    vim.cmd.colorscheme("default")
  end
end

vim.api.nvim_create_user_command("ColorschemeList", function()
  M.list()
end, {})

vim.api.nvim_create_user_command("ColorschemeLoad", function(opts)
  M.load(opts.args)
end, { nargs = "?" })

return M
