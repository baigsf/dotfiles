-- Gruvbox colorscheme for Neovim
-- Transparent background version

local colors = {
  bg = "NONE",
  fg = "#ebdbb2",
  black = "#282828",
  bright_black = "#928374",
  red = "#cc241d",
  bright_red = "#fb4934",
  green = "#98971a",
  bright_green = "#b8bb26",
  yellow = "#d79921",
  bright_yellow = "#fabd2f",
  blue = "#458588",
  bright_blue = "#83a598",
  magenta = "#b16286",
  bright_magenta = "#d3869b",
  cyan = "#689d6a",
  bright_cyan = "#8ec07c",
  white = "#a89984",
  bright_white = "#ebdbb2",
  orange = "#d65d0e",
  bright_orange = "#fe8019",
  gray = "#928374",
  dark_gray = "#3c3836",
  darker_gray = "#282828",
}

local function set_highlight(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local function setup()
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  vim.g.colors_name = "gruvbox"
  vim.opt.termguicolors = true

  -- Editor highlights
  set_highlight("Normal", { fg = colors.fg, bg = colors.bg })
  set_highlight("NormalFloat", { fg = colors.fg, bg = colors.bg })
  set_highlight("FloatBorder", { fg = colors.bright_yellow, bg = colors.bg })
  set_highlight("FloatTitle", { fg = colors.bright_yellow, bg = colors.bg })
  set_highlight("Cursor", { fg = colors.black, bg = colors.fg })
  set_highlight("CursorLine", { bg = colors.dark_gray })
  set_highlight("CursorColumn", { bg = colors.dark_gray })
  set_highlight("ColorColumn", { bg = colors.dark_gray })
  set_highlight("LineNr", { fg = colors.gray })
  set_highlight("CursorLineNr", { fg = colors.bright_yellow })
  set_highlight("SignColumn", { bg = colors.bg })
  set_highlight("StatusLine", { fg = colors.fg, bg = colors.dark_gray })
  set_highlight("StatusLineNC", { fg = colors.gray, bg = colors.darker_gray })
  set_highlight("TabLine", { fg = colors.gray, bg = colors.darker_gray })
  set_highlight("TabLineFill", { bg = colors.darker_gray })
  set_highlight("TabLineSel", { fg = colors.bright_yellow, bg = colors.bg })
  set_highlight("WinSeparator", { fg = colors.gray })
  set_highlight("VertSplit", { fg = colors.gray })
  set_highlight("Folded", { fg = colors.gray, bg = colors.dark_gray })
  set_highlight("FoldColumn", { fg = colors.gray })
  
  -- Search and selection
  set_highlight("Search", { fg = colors.black, bg = colors.bright_yellow })
  set_highlight("IncSearch", { fg = colors.black, bg = colors.bright_orange })
  set_highlight("Substitute", { fg = colors.black, bg = colors.bright_red })
  set_highlight("Visual", { bg = colors.dark_gray })
  set_highlight("VisualNOS", { bg = colors.dark_gray })
  
  -- Messages
  set_highlight("ErrorMsg", { fg = colors.bright_red, bold = true })
  set_highlight("WarningMsg", { fg = colors.bright_yellow, bold = true })
  set_highlight("ModeMsg", { fg = colors.fg })
  set_highlight("MsgArea", { fg = colors.fg })
  set_highlight("MoreMsg", { fg = colors.bright_blue })
  set_highlight("Question", { fg = colors.bright_blue })
  
  -- Popup menu
  set_highlight("Pmenu", { fg = colors.fg, bg = colors.dark_gray })
  set_highlight("PmenuSel", { fg = colors.black, bg = colors.bright_yellow })
  set_highlight("PmenuSbar", { bg = colors.darker_gray })
  set_highlight("PmenuThumb", { bg = colors.gray })
  set_highlight("WildMenu", { fg = colors.black, bg = colors.bright_yellow })
  
  -- Spelling
  set_highlight("SpellBad", { undercurl = true, sp = colors.bright_red })
  set_highlight("SpellCap", { undercurl = true, sp = colors.bright_blue })
  set_highlight("SpellLocal", { undercurl = true, sp = colors.bright_cyan })
  set_highlight("SpellRare", { undercurl = true, sp = colors.bright_magenta })
  
  -- Syntax highlighting
  set_highlight("Comment", { fg = colors.gray, italic = true })
  set_highlight("Constant", { fg = colors.bright_magenta })
  set_highlight("String", { fg = colors.bright_green })
  set_highlight("Character", { fg = colors.bright_green })
  set_highlight("Number", { fg = colors.bright_magenta })
  set_highlight("Boolean", { fg = colors.bright_magenta, bold = true })
  set_highlight("Float", { fg = colors.bright_magenta })
  set_highlight("Identifier", { fg = colors.fg })
  set_highlight("Function", { fg = colors.bright_yellow })
  set_highlight("Statement", { fg = colors.bright_red })
  set_highlight("Conditional", { fg = colors.bright_red })
  set_highlight("Repeat", { fg = colors.bright_red })
  set_highlight("Label", { fg = colors.bright_red })
  set_highlight("Operator", { fg = colors.bright_yellow })
  set_highlight("Keyword", { fg = colors.bright_red })
  set_highlight("Exception", { fg = colors.bright_red })
  set_highlight("PreProc", { fg = colors.bright_blue })
  set_highlight("Include", { fg = colors.bright_blue })
  set_highlight("Define", { fg = colors.bright_blue })
  set_highlight("Macro", { fg = colors.bright_blue })
  set_highlight("PreCondit", { fg = colors.bright_blue })
  set_highlight("Type", { fg = colors.bright_yellow })
  set_highlight("StorageClass", { fg = colors.bright_orange })
  set_highlight("Structure", { fg = colors.bright_yellow })
  set_highlight("Typedef", { fg = colors.bright_yellow })
  set_highlight("Special", { fg = colors.bright_orange })
  set_highlight("SpecialChar", { fg = colors.bright_orange })
  set_highlight("Tag", { fg = colors.bright_yellow })
  set_highlight("Delimiter", { fg = colors.white })
  set_highlight("SpecialComment", { fg = colors.gray, italic = true })
  set_highlight("Debug", { fg = colors.bright_red })
  set_highlight("Underlined", { underline = true })
  set_highlight("Ignore", { fg = colors.gray })
  set_highlight("Error", { fg = colors.bright_red, bold = true })
  set_highlight("Todo", { fg = colors.black, bg = colors.bright_yellow, bold = true })
  
  -- Treesitter highlights
  set_highlight("@variable", { fg = colors.fg })
  set_highlight("@variable.builtin", { fg = colors.bright_orange })
  set_highlight("@variable.parameter", { fg = colors.fg })
  set_highlight("@variable.member", { fg = colors.fg })
  set_highlight("@constant", { fg = colors.bright_magenta })
  set_highlight("@constant.builtin", { fg = colors.bright_magenta })
  set_highlight("@constant.macro", { fg = colors.bright_blue })
  set_highlight("@module", { fg = colors.bright_yellow })
  set_highlight("@label", { fg = colors.bright_red })
  set_highlight("@string", { fg = colors.bright_green })
  set_highlight("@string.documentation", { fg = colors.bright_green })
  set_highlight("@string.regexp", { fg = colors.bright_orange })
  set_highlight("@string.escape", { fg = colors.bright_orange })
  set_highlight("@string.special", { fg = colors.bright_orange })
  set_highlight("@character", { fg = colors.bright_green })
  set_highlight("@character.special", { fg = colors.bright_orange })
  set_highlight("@boolean", { fg = colors.bright_magenta })
  set_highlight("@number", { fg = colors.bright_magenta })
  set_highlight("@number.float", { fg = colors.bright_magenta })
  set_highlight("@type", { fg = colors.bright_yellow })
  set_highlight("@type.builtin", { fg = colors.bright_yellow })
  set_highlight("@type.definition", { fg = colors.bright_yellow })
  set_highlight("@attribute", { fg = colors.bright_blue })
  set_highlight("@property", { fg = colors.fg })
  set_highlight("@function", { fg = colors.bright_yellow })
  set_highlight("@function.builtin", { fg = colors.bright_yellow })
  set_highlight("@function.call", { fg = colors.bright_yellow })
  set_highlight("@function.macro", { fg = colors.bright_blue })
  set_highlight("@function.method", { fg = colors.bright_yellow })
  set_highlight("@function.method.call", { fg = colors.bright_yellow })
  set_highlight("@constructor", { fg = colors.bright_yellow })
  set_highlight("@operator", { fg = colors.bright_yellow })
  set_highlight("@keyword", { fg = colors.bright_red })
  set_highlight("@keyword.coroutine", { fg = colors.bright_red })
  set_highlight("@keyword.function", { fg = colors.bright_red })
  set_highlight("@keyword.operator", { fg = colors.bright_red })
  set_highlight("@keyword.import", { fg = colors.bright_blue })
  set_highlight("@keyword.type", { fg = colors.bright_red })
  set_highlight("@keyword.modifier", { fg = colors.bright_red })
  set_highlight("@keyword.repeat", { fg = colors.bright_red })
  set_highlight("@keyword.return", { fg = colors.bright_red })
  set_highlight("@keyword.debug", { fg = colors.bright_red })
  set_highlight("@keyword.exception", { fg = colors.bright_red })
  set_highlight("@conditional", { fg = colors.bright_red })
  set_highlight("@conditional.ternary", { fg = colors.bright_red })
  set_highlight("@repeat", { fg = colors.bright_red })
  set_highlight("@debug", { fg = colors.bright_red })
  set_highlight("@label", { fg = colors.bright_red })
  set_highlight("@include", { fg = colors.bright_blue })
  set_highlight("@exception", { fg = colors.bright_red })
  set_highlight("@comment", { fg = colors.gray, italic = true })
  set_highlight("@comment.documentation", { fg = colors.gray, italic = true })
  set_highlight("@punctuation.delimiter", { fg = colors.white })
  set_highlight("@punctuation.bracket", { fg = colors.white })
  set_highlight("@punctuation.special", { fg = colors.bright_orange })
  
  -- LSP highlights
  set_highlight("DiagnosticError", { fg = colors.bright_red })
  set_highlight("DiagnosticWarn", { fg = colors.bright_yellow })
  set_highlight("DiagnosticInfo", { fg = colors.bright_blue })
  set_highlight("DiagnosticHint", { fg = colors.bright_green })
  set_highlight("DiagnosticUnderlineError", { undercurl = true, sp = colors.bright_red })
  set_highlight("DiagnosticUnderlineWarn", { undercurl = true, sp = colors.bright_yellow })
  set_highlight("DiagnosticUnderlineInfo", { undercurl = true, sp = colors.bright_blue })
  set_highlight("DiagnosticUnderlineHint", { undercurl = true, sp = colors.bright_green })
  set_highlight("LspReferenceText", { bg = colors.dark_gray })
  set_highlight("LspReferenceRead", { bg = colors.dark_gray })
  set_highlight("LspReferenceWrite", { bg = colors.dark_gray })
  
  -- Diff highlights
  set_highlight("DiffAdd", { fg = colors.bright_green, bg = colors.dark_gray })
  set_highlight("DiffChange", { fg = colors.bright_blue, bg = colors.dark_gray })
  set_highlight("DiffDelete", { fg = colors.bright_red, bg = colors.dark_gray })
  set_highlight("DiffText", { fg = colors.fg, bg = colors.dark_gray })
  
  -- Git highlights
  set_highlight("GitSignsAdd", { fg = colors.bright_green })
  set_highlight("GitSignsChange", { fg = colors.bright_blue })
  set_highlight("GitSignsDelete", { fg = colors.bright_red })
  set_highlight("GitGutterAdd", { fg = colors.bright_green })
  set_highlight("GitGutterChange", { fg = colors.bright_blue })
  set_highlight("GitGutterDelete", { fg = colors.bright_red })
  
  -- Telescope highlights
  set_highlight("TelescopeNormal", { fg = colors.fg, bg = colors.bg })
  set_highlight("TelescopeBorder", { fg = colors.bright_yellow, bg = colors.bg })
  set_highlight("TelescopePromptNormal", { fg = colors.fg, bg = colors.bg })
  set_highlight("TelescopePromptBorder", { fg = colors.bright_yellow, bg = colors.bg })
  set_highlight("TelescopePromptTitle", { fg = colors.bright_yellow, bg = colors.bg })
  set_highlight("TelescopePreviewTitle", { fg = colors.bright_yellow, bg = colors.bg })
  set_highlight("TelescopeResultsTitle", { fg = colors.bright_yellow, bg = colors.bg })
  set_highlight("TelescopeSelection", { fg = colors.black, bg = colors.bright_yellow })
  
  -- WhichKey highlights
  set_highlight("WhichKey", { fg = colors.bright_yellow, bg = colors.bg })
  set_highlight("WhichKeyGroup", { fg = colors.bright_blue, bg = colors.bg })
  set_highlight("WhichKeyDesc", { fg = colors.fg, bg = colors.bg })
  set_highlight("WhichKeyBorder", { fg = colors.bright_yellow, bg = colors.bg })
  
  -- NeoTree highlights
  set_highlight("NeoTreeNormal", { fg = colors.fg, bg = colors.bg })
  set_highlight("NeoTreeNormalNC", { fg = colors.gray, bg = colors.bg })
  set_highlight("NeoTreeFloatBorder", { fg = colors.bright_yellow, bg = colors.bg })
  set_highlight("NeoTreeDirectoryIcon", { fg = colors.bright_yellow })
  set_highlight("NeoTreeDirectoryName", { fg = colors.fg })
  set_highlight("NeoTreeFileName", { fg = colors.fg })
  set_highlight("NeoTreeGitModified", { fg = colors.bright_yellow })
  set_highlight("NeoTreeGitAdded", { fg = colors.bright_green })
  set_highlight("NeoTreeGitDeleted", { fg = colors.bright_red })
  
  -- Cmp highlights
  set_highlight("CmpItemAbbr", { fg = colors.fg })
  set_highlight("CmpItemAbbrMatch", { fg = colors.bright_yellow, bold = true })
  set_highlight("CmpItemAbbrMatchFuzzy", { fg = colors.bright_yellow, bold = true })
  set_highlight("CmpItemKind", { fg = colors.bright_blue })
  set_highlight("CmpItemMenu", { fg = colors.gray })
end

setup()
