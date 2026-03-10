local colors = {
  bg = "#1a1b26",
  fg = "#c0caf5",
  black = "#16161e",
  bright_black = "#414868",
  red = "#f7768e",
  bright_red = "#f7768e",
  green = "#9ece6a",
  bright_green = "#9ece6a",
  yellow = "#e0af68",
  bright_yellow = "#e0af68",
  blue = "#7aa2f7",
  bright_blue = "#7aa2f7",
  magenta = "#bb9af7",
  bright_magenta = "#bb9af7",
  cyan = "#7dcfff",
  bright_cyan = "#7dcfff",
  white = "#c0caf5",
  bright_white = "#c0caf5",
  surface2 = "#414868",
  surface1 = "#24283b",
  surface0 = "#1a1b26",
  error = "#f7768e",
  warning = "#e0af68",
  info = "#7aa2f7",
}

local function set_highlight(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local function setup()
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  vim.g.colors_name = "tokyonight"
  vim.opt.termguicolors = true

  set_highlight("Normal", { fg = colors.fg, bg = "NONE" })
  set_highlight("NormalFloat", { fg = colors.fg, bg = "NONE" })
  set_highlight("FloatBorder", { fg = colors.fg_alt, bg = "NONE" })
  set_highlight("FloatTitle", { fg = colors.blue, bg = "NONE" })
  set_highlight("Cursor", { fg = colors.bg, bg = colors.fg })
  set_highlight("CursorLine", { bg = colors.surface0 })
  set_highlight("CursorColumn", { bg = colors.surface0 })
  set_highlight("ColorColumn", { bg = colors.surface0 })
  set_highlight("LineNr", { fg = colors.surface2 })
  set_highlight("CursorLineNr", { fg = colors.yellow })
  set_highlight("SignColumn", { bg = "NONE" })
  set_highlight("StatusLine", { fg = colors.fg, bg = colors.surface1 })
  set_highlight("StatusLineNC", { fg = colors.surface2, bg = colors.surface0 })
  set_highlight("TabLine", { fg = colors.surface2, bg = colors.surface0 })
  set_highlight("TabLineFill", { bg = colors.surface0 })
  set_highlight("TabLineSel", { fg = colors.fg, bg = colors.bg })
  set_highlight("WinSeparator", { fg = colors.surface2 })
  set_highlight("VertSplit", { fg = colors.surface2 })
  set_highlight("Folded", { fg = colors.surface2, bg = colors.surface0 })
  set_highlight("FoldColumn", { fg = colors.surface2 })

  set_highlight("Search", { fg = colors.bg, bg = colors.yellow })
  set_highlight("IncSearch", { fg = colors.bg, bg = colors.magenta })
  set_highlight("Substitute", { fg = colors.bg, bg = colors.magenta })
  set_highlight("Visual", { bg = colors.surface1 })
  set_highlight("VisualNOS", { bg = colors.surface1 })

  set_highlight("ErrorMsg", { fg = colors.error, bold = true })
  set_highlight("WarningMsg", { fg = colors.warning, bold = true })
  set_highlight("ModeMsg", { fg = colors.fg })
  set_highlight("MsgArea", { fg = colors.fg })
  set_highlight("MoreMsg", { fg = colors.blue })
  set_highlight("Question", { fg = colors.blue })

  set_highlight("Pmenu", { fg = colors.fg, bg = colors.surface0 })
  set_highlight("PmenuSel", { fg = colors.bg, bg = colors.fg_alt })
  set_highlight("PmenuSbar", { bg = colors.surface1 })
  set_highlight("PmenuThumb", { bg = colors.surface2 })
  set_highlight("WildMenu", { fg = colors.bg, bg = colors.magenta })

  set_highlight("SpellBad", { undercurl = true, sp = colors.error })
  set_highlight("SpellCap", { undercurl = true, sp = colors.blue })
  set_highlight("SpellLocal", { undercurl = true, sp = colors.cyan })
  set_highlight("SpellRare", { undercurl = true, sp = colors.cyan })

  set_highlight("Comment", { fg = colors.surface2, italic = true })
  set_highlight("Constant", { fg = colors.cyan })
  set_highlight("String", { fg = colors.green })
  set_highlight("Character", { fg = colors.green })
  set_highlight("Number", { fg = colors.magenta })
  set_highlight("Boolean", { fg = colors.magenta, bold = true })
  set_highlight("Float", { fg = colors.magenta })
  set_highlight("Identifier", { fg = colors.fg })
  set_highlight("Function", { fg = colors.blue })
  set_highlight("Statement", { fg = colors.magenta })
  set_highlight("Conditional", { fg = colors.magenta })
  set_highlight("Repeat", { fg = colors.magenta })
  set_highlight("Label", { fg = colors.blue })
  set_highlight("Operator", { fg = colors.magenta })
  set_highlight("Keyword", { fg = colors.magenta })
  set_highlight("Exception", { fg = colors.magenta })
  set_highlight("PreProc", { fg = colors.red })
  set_highlight("Include", { fg = colors.red })
  set_highlight("Define", { fg = colors.red })
  set_highlight("Macro", { fg = colors.red })
  set_highlight("PreCondit", { fg = colors.red })
  set_highlight("Type", { fg = colors.yellow })
  set_highlight("StorageClass", { fg = colors.yellow })
  set_highlight("Structure", { fg = colors.yellow })
  set_highlight("Typedef", { fg = colors.yellow })
  set_highlight("Special", { fg = colors.fg })
  set_highlight("SpecialChar", { fg = colors.fg })
  set_highlight("Tag", { fg = colors.blue })
  set_highlight("Delimiter", { fg = colors.fg })
  set_highlight("SpecialComment", { fg = colors.surface2, italic = true })
  set_highlight("Debug", { fg = colors.magenta })
  set_highlight("Underlined", { underline = true })
  set_highlight("Ignore", { fg = colors.surface2 })
  set_highlight("Error", { fg = colors.error, bold = true })
  set_highlight("Todo", { fg = colors.bg, bg = colors.yellow, bold = true })

  set_highlight("@variable", { fg = colors.fg })
  set_highlight("@variable.builtin", { fg = colors.magenta })
  set_highlight("@variable.parameter", { fg = colors.fg })
  set_highlight("@variable.member", { fg = colors.fg })
  set_highlight("@constant", { fg = colors.cyan })
  set_highlight("@constant.builtin", { fg = colors.cyan })
  set_highlight("@constant.macro", { fg = colors.red })
  set_highlight("@module", { fg = colors.blue })
  set_highlight("@label", { fg = colors.blue })
  set_highlight("@string", { fg = colors.green })
  set_highlight("@string.documentation", { fg = colors.green })
  set_highlight("@string.regexp", { fg = colors.yellow })
  set_highlight("@string.escape", { fg = colors.magenta })
  set_highlight("@string.special", { fg = colors.magenta })
  set_highlight("@character", { fg = colors.green })
  set_highlight("@character.special", { fg = colors.magenta })
  set_highlight("@boolean", { fg = colors.magenta })
  set_highlight("@number", { fg = colors.magenta })
  set_highlight("@number.float", { fg = colors.magenta })
  set_highlight("@type", { fg = colors.yellow })
  set_highlight("@type.builtin", { fg = colors.yellow })
  set_highlight("@type.definition", { fg = colors.yellow })
  set_highlight("@attribute", { fg = colors.red })
  set_highlight("@property", { fg = colors.fg })
  set_highlight("@function", { fg = colors.blue })
  set_highlight("@function.builtin", { fg = colors.blue })
  set_highlight("@function.call", { fg = colors.blue })
  set_highlight("@function.macro", { fg = colors.red })
  set_highlight("@function.method", { fg = colors.blue })
  set_highlight("@function.method.call", { fg = colors.blue })
  set_highlight("@constructor", { fg = colors.yellow })
  set_highlight("@operator", { fg = colors.magenta })
  set_highlight("@keyword", { fg = colors.magenta })
  set_highlight("@keyword.coroutine", { fg = colors.magenta })
  set_highlight("@keyword.function", { fg = colors.magenta })
  set_highlight("@keyword.operator", { fg = colors.magenta })
  set_highlight("@keyword.import", { fg = colors.red })
  set_highlight("@keyword.type", { fg = colors.magenta })
  set_highlight("@keyword.modifier", { fg = colors.magenta })
  set_highlight("@keyword.repeat", { fg = colors.magenta })
  set_highlight("@keyword.return", { fg = colors.magenta })
  set_highlight("@keyword.debug", { fg = colors.magenta })
  set_highlight("@keyword.exception", { fg = colors.magenta })
  set_highlight("@conditional", { fg = colors.magenta })
  set_highlight("@conditional.ternary", { fg = colors.magenta })
  set_highlight("@repeat", { fg = colors.magenta })
  set_highlight("@debug", { fg = colors.magenta })
  set_highlight("@include", { fg = colors.red })
  set_highlight("@exception", { fg = colors.magenta })
  set_highlight("@comment", { fg = colors.surface2, italic = true })
  set_highlight("@comment.documentation", { fg = colors.surface2, italic = true })
  set_highlight("@punctuation.delimiter", { fg = colors.fg })
  set_highlight("@punctuation.bracket", { fg = colors.fg })
  set_highlight("@punctuation.special", { fg = colors.magenta })

  set_highlight("DiagnosticError", { fg = colors.error })
  set_highlight("DiagnosticWarn", { fg = colors.warning })
  set_highlight("DiagnosticInfo", { fg = colors.info })
  set_highlight("DiagnosticHint", { fg = colors.cyan })
  set_highlight("DiagnosticUnderlineError", { undercurl = true, sp = colors.error })
  set_highlight("DiagnosticUnderlineWarn", { undercurl = true, sp = colors.warning })
  set_highlight("DiagnosticUnderlineInfo", { undercurl = true, sp = colors.info })
  set_highlight("DiagnosticUnderlineHint", { undercurl = true, sp = colors.cyan })
  set_highlight("LspReferenceText", { bg = colors.surface1 })
  set_highlight("LspReferenceRead", { bg = colors.surface1 })
  set_highlight("LspReferenceWrite", { bg = colors.surface1 })

  set_highlight("DiffAdd", { fg = colors.green, bg = colors.surface0 })
  set_highlight("DiffChange", { fg = colors.blue, bg = colors.surface0 })
  set_highlight("DiffDelete", { fg = colors.error, bg = colors.surface0 })
  set_highlight("DiffText", { fg = colors.fg, bg = colors.surface1 })

  set_highlight("GitSignsAdd", { fg = colors.green })
  set_highlight("GitSignsChange", { fg = colors.yellow })
  set_highlight("GitSignsDelete", { fg = colors.error })
  set_highlight("GitGutterAdd", { fg = colors.green })
  set_highlight("GitGutterChange", { fg = colors.yellow })
  set_highlight("GitGutterDelete", { fg = colors.error })

  set_highlight("TelescopeNormal", { fg = colors.fg, bg = "NONE" })
  set_highlight("TelescopeBorder", { fg = colors.blue, bg = "NONE" })
  set_highlight("TelescopePromptNormal", { fg = colors.fg, bg = "NONE" })
  set_highlight("TelescopePromptBorder", { fg = colors.blue, bg = "NONE" })
  set_highlight("TelescopePromptTitle", { fg = colors.blue, bg = "NONE" })
  set_highlight("TelescopePreviewTitle", { fg = colors.blue, bg = "NONE" })
  set_highlight("TelescopeResultsTitle", { fg = colors.blue, bg = "NONE" })
  set_highlight("TelescopeSelection", { fg = colors.bg, bg = colors.fg_alt })

  set_highlight("WhichKey", { fg = colors.blue, bg = "NONE" })
  set_highlight("WhichKeyGroup", { fg = colors.magenta, bg = "NONE" })
  set_highlight("WhichKeyDesc", { fg = colors.fg, bg = "NONE" })
  set_highlight("WhichKeyBorder", { fg = colors.blue, bg = "NONE" })

  set_highlight("NeoTreeNormal", { fg = colors.fg, bg = "NONE" })
  set_highlight("NeoTreeNormalNC", { fg = colors.surface2, bg = "NONE" })
  set_highlight("NeoTreeFloatBorder", { fg = colors.blue, bg = "NONE" })
  set_highlight("NeoTreeDirectoryIcon", { fg = colors.blue })
  set_highlight("NeoTreeDirectoryName", { fg = colors.fg })
  set_highlight("NeoTreeFileName", { fg = colors.fg })
  set_highlight("NeoTreeGitModified", { fg = colors.yellow })
  set_highlight("NeoTreeGitAdded", { fg = colors.green })
  set_highlight("NeoTreeGitDeleted", { fg = colors.error })

  set_highlight("NvimTreeNormal", { fg = colors.fg, bg = "NONE" })
  set_highlight("NvimTreeNormalNC", { fg = colors.surface2, bg = "NONE" })
  set_highlight("NvimTreeEndOfBuffer", { fg = colors.surface2 })
  set_highlight("NvimTreeWinSeparator", { fg = colors.surface1, bg = "NONE" })
  set_highlight("NvimTreeFolderIcon", { fg = colors.blue, bold = true })
  set_highlight("NvimTreeFolderName", { fg = colors.fg })
  set_highlight("NvimTreeOpenedFolderName", { fg = colors.magenta })
  set_highlight("NvimTreeEmptyFolderName", { fg = colors.surface2 })
  set_highlight("NvimTreeFile", { fg = colors.fg })
  set_highlight("NvimTreeOpenedFile", { fg = colors.fg })
  set_highlight("NvimTreeModifiedFile", { fg = colors.yellow, bold = true })
  set_highlight("NvimTreeGitDeleted", { fg = colors.error })
  set_highlight("NvimTreeGitMerge", { fg = colors.magenta })
  set_highlight("NvimTreeGitRenamed", { fg = colors.cyan })
  set_highlight("NvimTreeGitStaged", { fg = colors.green })
  set_highlight("NvimTreeGitUntracked", { fg = colors.surface2 })
  set_highlight("NvimTreeIndentMarker", { fg = colors.surface2 })
  set_highlight("NvimTreeCursorLine", { bg = colors.surface0 })
  set_highlight("NvimTreeLineNr", { fg = colors.surface2 })
  set_highlight("NvimTreeRootFolder", { fg = colors.blue, bold = true })
  set_highlight("NvimTreeSpecialIcon", { fg = colors.magenta })

  set_highlight("CmpItemAbbr", { fg = colors.fg })
  set_highlight("CmpItemAbbrMatch", { fg = colors.blue, bold = true })
  set_highlight("CmpItemAbbrMatchFuzzy", { fg = colors.blue, bold = true })
  set_highlight("CmpItemKind", { fg = colors.blue })
  set_highlight("CmpItemMenu", { fg = colors.surface2 })
end

setup()
