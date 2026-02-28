-- =============================================================================
-- init.lua - Neovim Configuration
-- =============================================================================
-- A LazyVim-inspired setup with custom colorschemes
-- Author: Saif Baig
-- =============================================================================

-- =============================================================================
-- SECTION 1: BASIC OPTIONS
-- =============================================================================

-- Line numbers
vim.opt.number = true           -- Show absolute line numbers
vim.opt.relativenumber = true  -- Show relative line numbers

-- Terminal colors & transparency
vim.opt.termguicolors = true   -- Enable true color support
vim.cmd("highlight Normal ctermbg=NONE guibg=NONE")       -- Transparent background
vim.cmd("highlight NonText ctermbg=NONE guibg=NONE")      -- Transparent NonText

-- Sensible defaults
vim.opt.mouse = "a"            -- Enable mouse in all modes
vim.opt.clipboard = "unnamedplus"  -- Use system clipboard
vim.opt.virtualedit = "onemore"    -- Allow cursor past end of line

-- Indentation
vim.opt.expandtab = true       -- Use spaces instead of tabs
vim.opt.shiftwidth = 2         -- Indent width
vim.opt.tabstop = 2            -- Tab width
vim.opt.smartindent = true    -- Smart indentation

-- Search
vim.opt.ignorecase = true      -- Ignore case in search
vim.opt.smartcase = true       -- Case sensitive if uppercase used
vim.opt.hlsearch = true        -- Highlight search results
vim.opt.incsearch = true       -- Incremental search

-- UI
vim.opt.cursorline = true      -- Highlight current line
vim.opt.signcolumn = "yes"     -- Always show sign column

-- Scrolling
vim.opt.wrap = false           -- Disable line wrapping
vim.opt.scrolloff = 8          -- Lines to keep above/below cursor
vim.opt.sidescrolloff = 8      -- Lines to keep left/right of cursor

-- Backup & Files
vim.opt.backup = false          -- No backup files
vim.opt.swapfile = false        -- No swap files
vim.opt.undofile = true         -- Persistent undo

-- Split behavior
vim.opt.splitbelow = true       -- New split below
vim.opt.splitright = true       -- New split right

-- Performance
vim.opt.updatetime = 250         -- Update time (ms)
vim.opt.timeoutlen = 300         -- Timeout for keycodes (ms)


-- =============================================================================
-- SECTION 2: KEYMAPS
-- =============================================================================

-- Leader key - press Space for leader commands
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- -----------------------------------------------------------------------------
-- Basic Keymaps
-- -----------------------------------------------------------------------------

-- Quick save/quit
vim.keymap.set("n", "ZZ", ":wq<CR>", { silent = true, desc = "Save and quit" })
vim.keymap.set("n", "ZQ", ":q!<CR>", { silent = true, desc = "Quit without saving" })

-- Window navigation (Ctrl + h/j/k/l)
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Visual mode - better indenting (stay in visual after indenting)
vim.keymap.set("v", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Insert mode - quick exit
vim.keymap.set("i", "ee", "<Esc>", { desc = "Exit insert mode" })

-- Normal mode - clear search highlight when pressing escape
vim.keymap.set("n", "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Leader commands - file operations
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })

-- Leader commands - openers
vim.keymap.set("n", "<leader>h", "<cmd>Alpha<cr>", { desc = "Open dashboard" })
vim.keymap.set("n", "<leader>e", "<cmd>Explore<cr>", { desc = "Open file browser" })


-- =============================================================================
-- SECTION 3: PLUGIN MANAGER SETUP
-- =============================================================================

-- Bootstrap lazy.nvim (plugin manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- =============================================================================
-- SECTION 4: PLUGINS
-- =============================================================================

require("lazy").setup({

  -- ===========================================================================
  -- GROUP 1: UI / THEME
  -- ===========================================================================
  
  -- alpha-nvim: Startup dashboard with ASCII art
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      local dashboard = require("alpha.themes.dashboard")
      
      -- ASCII art header
      dashboard.section.header.val = {
        [[                                                                       ]],
        [[                                                                     ]],
        [[       ████ ██████           █████      ██                     ]],
        [[      ███████████             █████                             ]],
        [[      █████████ ███████████████████ ███   ███████████   ]],
        [[     █████████  ███    █████████████ █████ ██████████████   ]],
        [[    █████████ ██████████████████████ █████ █████ ████ █████   ]],
        [[  ███████████ ███    ████████ ██ █████ █████ ████ █████  ]],
        [[ ██████  █████████████████████ ██ █████████ ████ ██████ ]],
        [[                                                                       ]],
      }
      
      -- Dashboard buttons
      dashboard.section.buttons.val = {
        dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
        dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
        dashboard.button("g", "  Find text", ":Telescope live_grep<CR>"),
        dashboard.button("e", "  File browser", ":Explore<CR>"),
        dashboard.button("l", "  Lazy", ":Lazy<CR>"),
        dashboard.button("c", "  Config", ":e $MYVIMRC <CR>"),
        dashboard.button("q", "  Quit", ":qa<CR>"),
      }
      
      dashboard.opts.opts.noautocmd = true
      
      -- Don't auto-show dashboard when opening a directory
      local argv = vim.fn.argv()
      if #argv > 0 then
        local stat = vim.loop.fs_stat(argv[1])
        if stat and stat.type == "directory" then
          dashboard.opts.opts.autostart = false
        end
      end
      
      require("alpha").setup(dashboard.opts)
    end,
  },

  -- lualine.nvim: Status bar at bottom
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = "auto",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "mode" },                     -- Mode (NORMAL, INSERT, etc.)
          lualine_b = { "branch", "diff", "diagnostics" },  -- Git branch, changes, errors
          lualine_c = { { "filename", path = 1 } },    -- Current file path
          lualine_x = { "encoding", "fileformat", "filetype" },  -- Encoding, format, type
          lualine_y = { "progress" },                  -- Progress %
          lualine_z = { "location" },                  -- Line/column
        },
      })
    end,
  },

  -- which-key.nvim: Popup for keybinding hints
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup({
        preset = "modern",
        defer = function(ctx)
          return ctx.mode == "v" or ctx.mode == "V" or ctx.mode == "<C-V>"
        end,
      })
      
      -- Register keymap groups (shown in which-key popup)
      require("which-key").add({
        { "<leader>b", group = "Buffer" },
        { "<leader>c", group = "Code" },
        { "<leader>f", group = "Find" },
        { "<leader>g", group = "Git" },
        { "<leader>l", group = "LSP" },
        { "<leader>s", group = "Search" },
        { "<leader>t", group = "Toggle" },
      })
    end,
  },

  -- nvim-web-devicons: File type icons
  { "nvim-tree/nvim-web-devicons", lazy = true },


  -- ===========================================================================
  -- GROUP 2: FUZZY FINDER (Telescope)
  -- ===========================================================================
  
  -- telescope.nvim: Fuzzy finder for files, text, etc.
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",           -- Load when running :Telescope
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
      { "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Find Word Under Cursor" },
      { "<leader>fC", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
      { "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Search Current Buffer" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",           -- Required dependency
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },  -- FZF sorter
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      
      telescope.setup({
        defaults = {
          prompt_prefix = " ",
          selection_caret = " ",
          path_display = { "truncate" },
          sorting_strategy = "ascending",
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          mappings = {
            -- Insert mode mappings
            i = {
              ["<C-n>"] = actions.move_selection_next,
              ["<C-p>"] = actions.move_selection_previous,
              ["<C-c>"] = actions.close,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
              ["<CR>"] = actions.select_default,
            },
            -- Normal mode mappings
            n = {
              ["<esc>"] = actions.close,
              ["j"] = actions.move_selection_next,
              ["k"] = actions.move_selection_previous,
              ["q"] = actions.close,
            },
          },
          -- Ignore these patterns in searches
          file_ignore_patterns = {
            "node_modules",
            "%.git/",
            "%.DS_Store",
            "target/",
            "dist/",
            "build/",
          },
        },
        pickers = {
          find_files = { theme = "dropdown", previewer = false },
          buffers = { theme = "dropdown", previewer = false },
          oldfiles = { theme = "dropdown", previewer = false },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })
      
      -- Auto-build fzf-native if not compiled
      local fzf_lib_path = vim.fn.stdpath("data") .. "/lazy/telescope-fzf-native.nvim/build/libfzf.so"
      if vim.fn.filereadable(fzf_lib_path) == 0 then
        local fzf_path = vim.fn.stdpath("data") .. "/lazy/telescope-fzf-native.nvim"
        vim.fn.system({"make", "-C", fzf_path})
      end
      
      telescope.load_extension("fzf")
    end,
  },


  -- ===========================================================================
  -- GROUP 3: LSP (Language Server Protocol)
  -- ===========================================================================
  
  -- mason.nvim: UI for installing LSPs, DAP, linters, formatters
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },

  -- nvim-lspconfig: Ready-to-use LSP configurations
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      -- LSP keymaps - these apply when LSP attaches to a buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(args)
          local bufnr = args.buf
          local opts = { buffer = bufnr, silent = true }
          
          -- Navigation
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
          vim.keymap.set("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "Go to references" }))
          vim.keymap.set("n", "gI", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "Go to implementation" }))
          vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, vim.tbl_extend("force", opts, { desc = "Go to type definition" }))
          
          -- Information
          vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover documentation" }))
          vim.keymap.set("n", "<leader>lk", vim.lsp.buf.signature_help, vim.tbl_extend("force", opts, { desc = "Signature help" }))
          
          -- Actions
          vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename" }))
          vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action" }))
          vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, vim.tbl_extend("force", opts, { desc = "Format" }))
          
          -- Diagnostics
          vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, vim.tbl_extend("force", opts, { desc = "Show diagnostic" }))
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, vim.tbl_extend("force", opts, { desc = "Previous diagnostic" }))
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))
        end,
      })
      
      -- Diagnostic configuration
      vim.diagnostic.config({
        virtual_text = { prefix = "●", source = "if_many" },
        float = { border = "rounded", source = "always" },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
          },
        },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
      
      -- Configure LSP capabilities
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      if has_cmp then
        capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
      end
      
      -- Lua language server configuration
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })
      
      -- Enable other language servers
      local servers = { "pyright", "ts_ls", "rust_analyzer", "gopls", "clangd", "jsonls", "html", "cssls", "bashls" }
      for _, server in ipairs(servers) do
        vim.lsp.config(server, { capabilities = capabilities })
        vim.lsp.enable(server)
      end
      
      vim.lsp.enable("lua_ls")
    end,
  },


  -- ===========================================================================
  -- GROUP 4: COMPLETION
  -- ===========================================================================
  
  -- nvim-cmp: Autocomplete engine
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",      -- LSP completions
      "hrsh7th/cmp-buffer",        -- Buffer completions
      "hrsh7th/cmp-path",         -- Path completions
      "hrsh7th/cmp-cmdline",      -- Command line completions
      "L3MON4D3/LuaSnip",         -- Snippet engine
      "saadparwaiz1/cmp_luasnip", -- Snippet completions
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      
      cmp.setup({
        -- Snippet expansion
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        
        -- Completion mappings
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          
          -- Tab / Shift-Tab for navigation
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expandable() then
              luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        
        -- Completion sources (priority order)
        sources = cmp.config.sources({
          { name = "nvim_lsp" },   -- LSP suggestions
          { name = "luasnip" },    -- Snippets
        }, {
          { name = "buffer" },     -- Current buffer words
          { name = "path" },       -- File paths
        }),
        
        -- UI windows
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        
        -- Formatting
        formatting = {
          format = function(entry, vim_item)
            local kind_icons = {
              Text = "", Method = "", Function = "", Constructor = "",
              Field = "", Variable = "", Class = "", Interface = "",
              Module = "", Property = "", Unit = "", Value = "",
              Enum = "", Keyword = "", Snippet = "", Color = "",
              File = "", Reference = "", Folder = "", EnumMember = "",
              Constant = "", Struct = "", Event = "", Operator = "",
              TypeParameter = "",
            }
            vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind] or "", vim_item.kind)
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              luasnip = "[Snippet]",
              buffer = "[Buffer]",
              path = "[Path]",
            })[entry.source.name]
            return vim_item
          end,
        },
      })
    end,
  },


  -- ===========================================================================
  -- GROUP 5: TREESITTER (Syntax Highlighting)
  -- ===========================================================================
  
  -- nvim-treesitter: Improved syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        -- Languages to install
        ensure_installed = {
          "lua", "vim", "vimdoc",
          "python", "javascript", "typescript", "tsx",
          "rust", "go", "c", "cpp",
          "json", "html", "css", "scss",
          "bash", "markdown", "markdown_inline", "regex",
        },
        
        -- Syntax highlighting
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        
        -- Indentation
        indent = { enable = true },
        
        -- Incremental selection
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = "<C-s>",
            node_decremental = "<C-backspace>",
          },
        },
      })
    end,
  },


  -- ===========================================================================
  -- GROUP 6: GIT
  -- ===========================================================================
  
  -- gitsigns.nvim: Git integration in the gutter
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
        
        -- Git keymaps
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          
          -- Navigation
          vim.keymap.set("n", "<leader>gj", gs.next_hunk, { buffer = bufnr, desc = "Next hunk" })
          vim.keymap.set("n", "<leader>gk", gs.prev_hunk, { buffer = bufnr, desc = "Previous hunk" })
          
          -- Stage/Reset
          vim.keymap.set("n", "<leader>gs", gs.stage_hunk, { buffer = bufnr, desc = "Stage hunk" })
          vim.keymap.set("n", "<leader>gr", gs.reset_hunk, { buffer = bufnr, desc = "Reset hunk" })
          vim.keymap.set("v", "<leader>gs", function() gs.stage_hunk {vim.fn.line("."), vim.fn.line("v")} end, { buffer = bufnr, desc = "Stage hunk" })
          vim.keymap.set("v", "<leader>gr", function() gs.reset_hunk {vim.fn.line("."), vim.fn.line("v")} end, { buffer = bufnr, desc = "Reset hunk" })
          
          -- Buffer actions
          vim.keymap.set("n", "<leader>gS", gs.stage_buffer, { buffer = bufnr, desc = "Stage buffer" })
          vim.keymap.set("n", "<leader>gu", gs.undo_stage_hunk, { buffer = bufnr, desc = "Undo stage hunk" })
          vim.keymap.set("n", "<leader>gR", gs.reset_buffer, { buffer = bufnr, desc = "Reset buffer" })
          
          -- Preview
          vim.keymap.set("n", "<leader>gp", gs.preview_hunk, { buffer = bufnr, desc = "Preview hunk" })
          vim.keymap.set("n", "<leader>gb", function() gs.blame_line{full=true} end, { buffer = bufnr, desc = "Blame line" })
          vim.keymap.set("n", "<leader>gB", gs.toggle_current_line_blame, { buffer = bufnr, desc = "Toggle blame" })
          
          -- Diff
          vim.keymap.set("n", "<leader>gd", gs.diffthis, { buffer = bufnr, desc = "Diff this" })
          vim.keymap.set("n", "<leader>gD", function() gs.diffthis("~") end, { buffer = bufnr, desc = "Diff this ~" })
        end,
      })
    end,
  },


  -- ===========================================================================
  -- GROUP 7: UTILITIES
  -- ===========================================================================
  
  -- nvim-autopairs: Auto-closing brackets and quotes
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  -- nvim-surround: Handle surrounding characters (quotes, brackets, etc.)
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },

  -- Comment.nvim: Quick comment toggling
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("Comment").setup({})
    end,
  },

  -- indent-blankline.nvim: Visual indent guides
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
      
      -- Set colors for indent guides
      vim.api.nvim_set_hl(0, "IblIndent", { fg = "#2a2a3d" })
      vim.api.nvim_set_hl(0, "IblScope", { fg = "#434353" })
    end,
  },

  -- neoscroll.nvim: Smooth scrolling
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

}, {
  -- Lazy.nvim configuration
  install = { colorscheme = { "gruvpink" } },
  checker = { enabled = true, notify = false },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip", "matchit", "matchparen",
        "tarPlugin", "tohtml", "tutor", "zipPlugin",
      },
    },
  },
})


-- =============================================================================
-- SECTION 5: POST-SETUP CONFIGURATION
-- =============================================================================

-- Re-apply transparency after colorscheme loads
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.cmd("highlight Normal ctermbg=NONE guibg=NONE")
    vim.cmd("highlight NormalFloat ctermbg=NONE guibg=NONE")
    vim.cmd("highlight NonText ctermbg=NONE guibg=NONE")
  end,
})


-- =============================================================================
-- SECTION 6: NETRW (File Browser) CONFIGURATION
-- =============================================================================

-- Netrw settings (built-in file browser)
vim.g.netrw_banner = 0            -- Hide banner
vim.g.netrw_liststyle = 3         -- Tree view
vim.g.netrw_browse_split = 0      -- Open in current window
vim.g.netrw_altv = 1              -- Open splits on right
vim.g.netrw_winsize = 25          -- 25% width
vim.g.netrw_keepdir = 0           -- Remember cwd
vim.g.netrw_localcopydircmd = 'cp -r'

-- Netrw keymaps
vim.api.nvim_create_autocmd('filetype', {
  pattern = 'netrw',
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'n', 'l', ':call netrw#Call("NetrwOpenFile")<CR>', { silent = true })
    vim.api.nvim_buf_set_keymap(0, 'n', 'h', '-', { silent = true })
    vim.api.nvim_buf_set_keymap(0, 'n', 'q', ':q<CR>', { silent = true })
  end
})


-- =============================================================================
-- SECTION 7: COLORSCHEME
-- =============================================================================

-- Apply colorscheme
vim.cmd.colorscheme("gruvpink")

-- =============================================================================
-- END OF CONFIGURATION
-- =============================================================================
