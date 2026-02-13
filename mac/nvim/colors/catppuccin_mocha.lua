-- Catppuccin Mocha colorscheme for Neovim
-- Transparent background version

local colors = {
  bg = "NONE",
  fg = "#cdd6f4",
  black = "#1e1e2e",
  bright_black = "#585b70",
  red = "#f38ba8",
  bright_red = "#f38ba8",
  green = "#a6e3a1",
  bright_green = "#a6e3a1",
  yellow = "#f9e2af",
  bright_yellow = "#f9e2af",
  blue = "#89b4fa",
  bright_blue = "#89b4fa",
  magenta = "#cba6f7",
  bright_magenta = "#cba6f7",
  cyan = "#74c7ec",
  bright_cyan = "#74c7ec",
  white = "#a6adc8",
  bright_white = "#cdd6f4",
  peach = "#fab387",
  pink = "#f5c2e7",
  mauve = "#cba6f7",
  lavender = "#b4befe",
  teal = "#94e2d5",
  maroon = "#eba0ac",
  overlay0 = "#6c7086",
  overlay1 = "#7f849c",
  overlay2 = "#9399b2",
  subtext0 = "#a6adc8",
  subtext1 = "#bac2de",
  surface0 = "#313244",
  surface1 = "#45475a",
  surface2 = "#585b70",
  base = "#1e1e2e",
  mantle = "#181825",
  crust = "#11111b",
}

local function set_highlight(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local function setup()
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  vim.g.colors_name = "catppuccin_mocha"
  vim.opt.termguicolors = true

  -- Editor highlights
  set_highlight("Normal", { fg = colors.fg, bg = colors.bg })
  set_highlight("NormalFloat", { fg = colors.fg, bg = colors.bg })
  set_highlight("FloatBorder", { fg = colors.lavender, bg = colors.bg })
  set_highlight("FloatTitle", { fg = colors.lavender, bg = colors.bg })
  set_highlight("Cursor", { fg = colors.base, bg = colors.pink })
  set_highlight("CursorLine", { bg = colors.surface0 })
  set_highlight("CursorColumn", { bg = colors.surface0 })
  set_highlight("ColorColumn", { bg = colors.surface0 })
  set_highlight("LineNr", { fg = colors.overlay0 })
  set_highlight("CursorLineNr", { fg = colors.lavender })
  set_highlight("SignColumn", { bg = colors.bg })
  set_highlight("StatusLine", { fg = colors.fg, bg = colors.surface0 })
  set_highlight("StatusLineNC", { fg = colors.overlay0, bg = colors.surface0 })
  set_highlight("TabLine", { fg = colors.overlay0, bg = colors.surface0 })
  set_highlight("TabLineFill", { bg = colors.surface0 })
  set_highlight("TabLineSel", { fg = colors.lavender, bg = colors.bg })
  set_highlight("WinSeparator", { fg = colors.surface1 })
  set_highlight("VertSplit", { fg = colors.surface1 })
  set_highlight("Folded", { fg = colors.overlay0, bg = colors.surface0 })
  set_highlight("FoldColumn", { fg = colors.overlay0 })
  
  -- Search and selection
  set_highlight("Search", { fg = colors.base, bg = colors.yellow })
  set_highlight("IncSearch", { fg = colors.base, bg = colors.pink })
  set_highlight("Substitute", { fg = colors.base, bg = colors.pink })
  set_highlight("Visual", { bg = colors.surface1 })
  set_highlight("VisualNOS", { bg = colors.surface1 })
  
  -- Messages
  set_highlight("ErrorMsg", { fg = colors.red, bold = true })
  set_highlight("WarningMsg", { fg = colors.peach, bold = true })
  set_highlight("ModeMsg", { fg = colors.fg })
  set_highlight("MsgArea", { fg = colors.fg })
  set_highlight("MoreMsg", { fg = colors.blue })
  set_highlight("Question", { fg = colors.blue })
  
  -- Popup menu
  set_highlight("Pmenu", { fg = colors.fg, bg = colors.surface0 })
  set_highlight("PmenuSel", { fg = colors.base, bg = colors.pink })
  set_highlight("PmenuSbar", { bg = colors.surface1 })
  set_highlight("PmenuThumb", { bg = colors.overlay0 })
  set_highlight("WildMenu", { fg = colors.base, bg = colors.pink })
  
  -- Spelling
  set_highlight("SpellBad", { undercurl = true, sp = colors.red })
  set_highlight("SpellCap", { undercurl = true, sp = colors.blue })
  set_highlight("SpellLocal", { undercurl = true, sp = colors.cyan })
  set_highlight("SpellRare", { undercurl = true, sp = colors.magenta })
  
  -- Syntax highlighting
  set_highlight("Comment", { fg = colors.overlay0, italic = true })
  set_highlight("Constant", { fg = colors.peach })
  set_highlight("String", { fg = colors.green })
  set_highlight("Character", { fg = colors.green })
  set_highlight("Number", { fg = colors.peach })
  set_highlight("Boolean", { fg = colors.peach, bold = true })
  set_highlight("Float", { fg = colors.peach })
  set_highlight("Identifier", { fg = colors.fg })
  set_highlight("Function", { fg = colors.blue })
  set_highlight("Statement", { fg = colors.mauve })
  set_highlight("Conditional", { fg = colors.mauve })
  set_highlight("Repeat", { fg = colors.mauve })
  set_highlight("Label", { fg = colors.mauve })
  set_highlight("Operator", { fg = colors.sky })
  set_highlight("Keyword", { fg = colors.mauve })
  set_highlight("Exception", { fg = colors.mauve })
  set_highlight("PreProc", { fg = colors.pink })
  set_highlight("Include", { fg = colors.pink })
  set_highlight("Define", { fg = colors.pink })
  set_highlight("Macro", { fg = colors.pink })
  set_highlight("PreCondit", { fg = colors.pink })
  set_highlight("Type", { fg = colors.yellow })
  set_highlight("StorageClass", { fg = colors.yellow })
  set_highlight("Structure", { fg = colors.yellow })
  set_highlight("Typedef", { fg = colors.yellow })
  set_highlight("Special", { fg = colors.pink })
  set_highlight("SpecialChar", { fg = colors.pink })
  set_highlight("Tag", { fg = colors.pink })
  set_highlight("Delimiter", { fg = colors.overlay2 })
  set_highlight("SpecialComment", { fg = colors.overlay0, italic = true })
  set_highlight("Debug", { fg = colors.red })
  set_highlight("Underlined", { underline = true })
  set_highlight("Ignore", { fg = colors.overlay0 })
  set_highlight("Error", { fg = colors.red, bold = true })
  set_highlight("Todo", { fg = colors.base, bg = colors.pink, bold = true })
  
  -- Treesitter highlights
  set_highlight("@variable", { fg = colors.fg })
  set_highlight("@variable.builtin", { fg = colors.red })
  set_highlight("@variable.parameter", { fg = colors.fg })
  set_highlight("@variable.member", { fg = colors.fg })
  set_highlight("@constant", { fg = colors.peach })
  set_highlight("@constant.builtin", { fg = colors.peach })
  set_highlight("@constant.macro", { fg = colors.pink })
  set_highlight("@module", { fg = colors.lavender })
  set_highlight("@label", { fg = colors.mauve })
  set_highlight("@string", { fg = colors.green })
  set_highlight("@string.documentation", { fg = colors.green })
  set_highlight("@string.regexp", { fg = colors.peach })
  set_highlight("@string.escape", { fg = colors.pink })
  set_highlight("@string.special", { fg = colors.pink })
  set_highlight("@character", { fg = colors.green })
  set_highlight("@character.special", { fg = colors.pink })
  set_highlight("@boolean", { fg = colors.peach })
  set_highlight("@number", { fg = colors.peach })
  set_highlight("@number.float", { fg = colors.peach })
  set_highlight("@type", { fg = colors.yellow })
  set_highlight("@type.builtin", { fg = colors.yellow })
  set_highlight("@type.definition", { fg = colors.yellow })
  set_highlight("@attribute", { fg = colors.blue })
  set_highlight("@property", { fg = colors.fg })
  set_highlight("@function", { fg = colors.blue })
  set_highlight("@function.builtin", { fg = colors.blue })
  set_highlight("@function.call", { fg = colors.blue })
  set_highlight("@function.macro", { fg = colors.pink })
  set_highlight("@function.method", { fg = colors.blue })
  set_highlight("@function.method.call", { fg = colors.blue })
  set_highlight("@constructor", { fg = colors.yellow })
  set_highlight("@operator", { fg = colors.sky })
  set_highlight("@keyword", { fg = colors.mauve })
  set_highlight("@keyword.coroutine", { fg = colors.mauve })
  set_highlight("@keyword.function", { fg = colors.mauve })
  set_highlight("@keyword.operator", { fg = colors.mauve })
  set_highlight("@keyword.import", { fg = colors.pink })
  set_highlight("@keyword.type", { fg = colors.mauve })
  set_highlight("@keyword.modifier", { fg = colors.mauve })
  set_highlight("@keyword.repeat", { fg = colors.mauve })
  set_highlight("@keyword.return", { fg = colors.mauve })
  set_highlight("@keyword.debug", { fg = colors.mauve })
  set_highlight("@keyword.exception", { fg = colors.mauve })
  set_highlight("@conditional", { fg = colors.mauve })
  set_highlight("@conditional.ternary", { fg = colors.mauve })
  set_highlight("@repeat", { fg = colors.mauve })
  set_highlight("@debug", { fg = colors.red })
  set_highlight("@label", { fg = colors.mauve })
  set_highlight("@include", { fg = colors.pink })
  set_highlight("@exception", { fg = colors.mauve })
  set_highlight("@comment", { fg = colors.overlay0, italic = true })
  set_highlight("@comment.documentation", { fg = colors.overlay0, italic = true })
  set_highlight("@punctuation.delimiter", { fg = colors.overlay2 })
  set_highlight("@punctuation.bracket", { fg = colors.overlay2 })
  set_highlight("@punctuation.special", { fg = colors.pink })
  
  -- LSP highlights
  set_highlight("DiagnosticError", { fg = colors.red })
  set_highlight("DiagnosticWarn", { fg = colors.peach })
  set_highlight("DiagnosticInfo", { fg = colors.blue })
  set_highlight("DiagnosticHint", { fg = colors.teal })
  set_highlight("DiagnosticUnderlineError", { undercurl = true, sp = colors.red })
  set_highlight("DiagnosticUnderlineWarn", { undercurl = true, sp = colors.peach })
  set_highlight("DiagnosticUnderlineInfo", { undercurl = true, sp = colors.blue })
  set_highlight("DiagnosticUnderlineHint", { undercurl = true, sp = colors.teal })
  set_highlight("LspReferenceText", { bg = colors.surface1 })
  set_highlight("LspReferenceRead", { bg = colors.surface1 })
  set_highlight("LspReferenceWrite", { bg = colors.surface1 })
  
  -- Diff highlights
  set_highlight("DiffAdd", { fg = colors.green, bg = colors.surface0 })
  set_highlight("DiffChange", { fg = colors.blue, bg = colors.surface0 })
  set_highlight("DiffDelete", { fg = colors.red, bg = colors.surface0 })
  set_highlight("DiffText", { fg = colors.fg, bg = colors.surface1 })
  
  -- Git highlights
  set_highlight("GitSignsAdd", { fg = colors.green })
  set_highlight("GitSignsChange", { fg = colors.blue })
  set_highlight("GitSignsDelete", { fg = colors.red })
  set_highlight("GitGutterAdd", { fg = colors.green })
  set_highlight("GitGutterChange", { fg = colors.blue })
  set_highlight("GitGutterDelete", { fg = colors.red })
  
  -- Telescope highlights
  set_highlight("TelescopeNormal", { fg = colors.fg, bg = colors.bg })
  set_highlight("TelescopeBorder", { fg = colors.lavender, bg = colors.bg })
  set_highlight("TelescopePromptNormal", { fg = colors.fg, bg = colors.bg })
  set_highlight("TelescopePromptBorder", { fg = colors.lavender, bg = colors.bg })
  set_highlight("TelescopePromptTitle", { fg = colors.lavender, bg = colors.bg })
  set_highlight("TelescopePreviewTitle", { fg = colors.lavender, bg = colors.bg })
  set_highlight("TelescopeResultsTitle", { fg = colors.lavender, bg = colors.bg })
  set_highlight("TelescopeSelection", { fg = colors.base, bg = colors.pink })
  
  -- WhichKey highlights
  set_highlight("WhichKey", { fg = colors.pink, bg = colors.bg })
  set_highlight("WhichKeyGroup", { fg = colors.blue, bg = colors.bg })
  set_highlight("WhichKeyDesc", { fg = colors.fg, bg = colors.bg })
  set_highlight("WhichKeyBorder", { fg = colors.lavender, bg = colors.bg })
  
  -- NeoTree highlights
  set_highlight("NeoTreeNormal", { fg = colors.fg, bg = colors.bg })
  set_highlight("NeoTreeNormalNC", { fg = colors.overlay0, bg = colors.bg })
  set_highlight("NeoTreeFloatBorder", { fg = colors.lavender, bg = colors.bg })
  set_highlight("NeoTreeDirectoryIcon", { fg = colors.blue })
  set_highlight("NeoTreeDirectoryName", { fg = colors.fg })
  set_highlight("NeoTreeFileName", { fg = colors.fg })
  set_highlight("NeoTreeGitModified", { fg = colors.peach })
  set_highlight("NeoTreeGitAdded", { fg = colors.green })
  set_highlight("NeoTreeGitDeleted", { fg = colors.red })
  
  -- Cmp highlights
  set_highlight("CmpItemAbbr", { fg = colors.fg })
  set_highlight("CmpItemAbbrMatch", { fg = colors.pink, bold = true })
  set_highlight("CmpItemAbbrMatchFuzzy", { fg = colors.pink, bold = true })
  set_highlight("CmpItemKind", { fg = colors.blue })
  set_highlight("CmpItemMenu", { fg = colors.overlay0 })
end

setup()
