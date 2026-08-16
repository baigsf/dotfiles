-- =============================================================================
-- plugins/treesitter.lua - Syntax Highlighting
-- =============================================================================
-- Uses the rewritten nvim-treesitter (main branch).
-- Requires: Neovim 0.12+, tar, curl, a C compiler, and the tree-sitter CLI
-- (0.26.1+, NOT installed via npm; e.g. `brew install tree-sitter-cli`).

local parsers = {
  "lua", "vim", "vimdoc",
  "python", "javascript", "typescript", "tsx",
  "rust", "go", "c", "cpp",
  "json", "html", "css", "scss",
  "bash", "markdown", "markdown_inline", "regex",
  "java",
}

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false, -- the main branch does not support lazy-loading
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({})

    -- Install missing parsers (async, no-op if already installed)
    require("nvim-treesitter").install(parsers)

    -- Highlighting and indentation are no longer enabled by the plugin;
    -- they are provided by Neovim core and must be started per buffer.
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        if pcall(vim.treesitter.start, args.buf) then
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })

    -- Incremental selection is built into Neovim 0.12 (visual mode: `an`
    -- selects the parent node, `in` selects a child node). These keymaps
    -- keep the old <C-space> muscle memory working.
    vim.keymap.set("n", "<C-space>", "vin", { desc = "Select treesitter node" })
    vim.keymap.set("x", "<C-space>", "an", { desc = "Select parent node" })
    vim.keymap.set("x", "<C-backspace>", "in", { desc = "Select child node" })
  end,
}
