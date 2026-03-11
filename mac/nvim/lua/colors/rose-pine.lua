local colors = {
  bg = "NONE",
  fg = "#e0def4",
  bg0 = "#191724",
  bg1 = "#1f1d2e",
  bg2 = "#26233a",
  bg3 = "#2a273f",
  bg4 = "#313244",
  fg0 = "#e0def4",
  fg1 = "#e0def4",
  fg2 = "#908caa",
  fg3 = "#6e6a86",
  red = "#eb6f92",
  red_bright = "#eb6f92",
  green = "#9ccfd8",
  green_bright = "#9ccfd8",
  yellow = "#f6c177",
  yellow_bright = "#f6c177",
  blue = "#31748f",
  blue_bright = "#9ccfd8",
  magenta = "#c4a7e7",
  magenta_bright = "#c4a7e7",
  cyan = "#9ccfd8",
  cyan_bright = "#9ccfd8",
  orange = "#f6c177",
  orange_bright = "#f6c177",
  purple = "#c4a7e7",
  pink = "#eb6f92",
  white = "#e0def4",
  black = "#191724",
  gray = "#6e6a86",
}

local function set_highlight(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local function setup()
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  vim.g.colors_name = "rose-pine"
  vim.opt.termguicolors = true

  set_highlight("Normal", { fg = colors.fg, bg = colors.bg })
  set_highlight("NormalFloat", { fg = colors.fg, bg = colors.bg })
  set_highlight("FloatBorder", { fg = colors.purple, bg = colors.bg })
  set_highlight("FloatTitle", { fg = colors.purple, bg = colors.bg })
  set_highlight("Cursor", { fg = colors.bg, bg = colors.fg })
  set_highlight("CursorLine", { bg = colors.bg1 })
  set_highlight("CursorColumn", { bg = colors.bg1 })
  set_highlight("ColorColumn", { bg = colors.bg1 })
  set_highlight("LineNr", { fg = colors.fg3 })
  set_highlight("CursorLineNr", { fg = colors.yellow, bold = true })
  set_highlight("SignColumn", { bg = colors.bg })
  set_highlight("StatusLine", { fg = colors.fg, bg = colors.bg1 })
  set_highlight("StatusLineNC", { fg = colors.gray, bg = colors.bg0 })
  set_highlight("TabLine", { fg = colors.gray, bg = colors.bg0 })
  set_highlight("TabLineFill", { bg = colors.bg0 })
  set_highlight("TabLineSel", { fg = colors.white, bg = colors.bg1, bold = true })
  set_highlight("WinSeparator", { fg = colors.bg3 })
  set_highlight("VertSplit", { fg = colors.bg3 })
  set_highlight("Folded", { fg = colors.gray, bg = colors.bg1 })
  set_highlight("FoldColumn", { fg = colors.gray })

  set_highlight("Search", { fg = colors.bg, bg = colors.yellow })
  set_highlight("IncSearch", { fg = colors.bg, bg = colors.orange })
  set_highlight("Substitute", { fg = colors.bg, bg = colors.red })
  set_highlight("Visual", { bg = colors.bg2 })
  set_highlight("VisualNOS", { bg = colors.bg2 })

  set_highlight("ErrorMsg", { fg = colors.red, bold = true })
  set_highlight("WarningMsg", { fg = colors.yellow, bold = true })
  set_highlight("ModeMsg", { fg = colors.fg })
  set_highlight("MsgArea", { fg = colors.fg })
  set_highlight("MoreMsg", { fg = colors.blue_bright })
  set_highlight("Question", { fg = colors.blue_bright })

  set_highlight("Pmenu", { fg = colors.fg, bg = colors.bg1 })
  set_highlight("PmenuSel", { fg = colors.bg, bg = colors.yellow })
  set_highlight("PmenuSbar", { bg = colors.bg0 })
  set_highlight("PmenuThumb", { bg = colors.gray })
  set_highlight("WildMenu", { fg = colors.bg, bg = colors.yellow })

  set_highlight("SpellBad", { undercurl = true, sp = colors.red })
  set_highlight("SpellCap", { undercurl = true, sp = colors.blue_bright })
  set_highlight("SpellLocal", { undercurl = true, sp = colors.cyan })
  set_highlight("SpellRare", { undercurl = true, sp = colors.magenta })

  set_highlight("Comment", { fg = colors.gray, italic = true })
  set_highlight("Constant", { fg = colors.magenta })
  set_highlight("String", { fg = colors.yellow })
  set_highlight("Character", { fg = colors.yellow })
  set_highlight("Number", { fg = colors.magenta })
  set_highlight("Boolean", { fg = colors.magenta, bold = true })
  set_highlight("Float", { fg = colors.magenta })
  set_highlight("Identifier", { fg = colors.fg })
  set_highlight("Function", { fg = colors.yellow })
  set_highlight("Statement", { fg = colors.red })
  set_highlight("Conditional", { fg = colors.red })
  set_highlight("Repeat", { fg = colors.red })
  set_highlight("Label", { fg = colors.red })
  set_highlight("Operator", { fg = colors.fg2 })
  set_highlight("Keyword", { fg = colors.red })
  set_highlight("Exception", { fg = colors.red })
  set_highlight("PreProc", { fg = colors.blue_bright })
  set_highlight("Include", { fg = colors.blue_bright })
  set_highlight("Define", { fg = colors.blue_bright })
  set_highlight("Macro", { fg = colors.blue_bright })
  set_highlight("PreCondit", { fg = colors.blue_bright })
  set_highlight("Type", { fg = colors.blue_bright })
  set_highlight("StorageClass", { fg = colors.red })
  set_highlight("Structure", { fg = colors.blue_bright })
  set_highlight("Typedef", { fg = colors.blue_bright })
  set_highlight("Special", { fg = colors.orange })
  set_highlight("SpecialChar", { fg = colors.orange })
  set_highlight("Tag", { fg = colors.yellow })
  set_highlight("Delimiter", { fg = colors.fg2 })
  set_highlight("SpecialComment", { fg = colors.gray, italic = true })
  set_highlight("Debug", { fg = colors.red })
  set_highlight("Underlined", { underline = true })
  set_highlight("Ignore", { fg = colors.gray })
  set_highlight("Error", { fg = colors.red, bold = true })
  set_highlight("Todo", { fg = colors.bg, bg = colors.yellow, bold = true })

  set_highlight("@variable", { fg = colors.fg })
  set_highlight("@variable.builtin", { fg = colors.orange })
  set_highlight("@variable.parameter", { fg = colors.fg })
  set_highlight("@variable.member", { fg = colors.fg })
  set_highlight("@constant", { fg = colors.magenta })
  set_highlight("@constant.builtin", { fg = colors.magenta })
  set_highlight("@constant.macro", { fg = colors.blue_bright })
  set_highlight("@module", { fg = colors.blue_bright })
  set_highlight("@label", { fg = colors.red })
  set_highlight("@string", { fg = colors.yellow })
  set_highlight("@string.documentation", { fg = colors.yellow })
  set_highlight("@string.regexp", { fg = colors.orange })
  set_highlight("@string.escape", { fg = colors.orange })
  set_highlight("@string.special", { fg = colors.orange })
  set_highlight("@character", { fg = colors.yellow })
  set_highlight("@character.special", { fg = colors.orange })
  set_highlight("@boolean", { fg = colors.magenta })
  set_highlight("@number", { fg = colors.magenta })
  set_highlight("@number.float", { fg = colors.magenta })
  set_highlight("@type", { fg = colors.blue_bright })
  set_highlight("@type.builtin", { fg = colors.blue_bright })
  set_highlight("@type.definition", { fg = colors.blue_bright })
  set_highlight("@attribute", { fg = colors.blue_bright })
  set_highlight("@property", { fg = colors.fg })
  set_highlight("@function", { fg = colors.yellow })
  set_highlight("@function.builtin", { fg = colors.yellow })
  set_highlight("@function.call", { fg = colors.yellow })
  set_highlight("@function.macro", { fg = colors.blue_bright })
  set_highlight("@function.method", { fg = colors.yellow })
  set_highlight("@function.method.call", { fg = colors.yellow })
  set_highlight("@constructor", { fg = colors.yellow })
  set_highlight("@operator", { fg = colors.fg2 })
  set_highlight("@keyword", { fg = colors.red })
  set_highlight("@keyword.coroutine", { fg = colors.red })
  set_highlight("@keyword.function", { fg = colors.red })
  set_highlight("@keyword.operator", { fg = colors.red })
  set_highlight("@keyword.import", { fg = colors.blue_bright })
  set_highlight("@keyword.type", { fg = colors.red })
  set_highlight("@keyword.modifier", { fg = colors.red })
  set_highlight("@keyword.repeat", { fg = colors.red })
  set_highlight("@keyword.return", { fg = colors.red })
  set_highlight("@keyword.debug", { fg = colors.red })
  set_highlight("@keyword.exception", { fg = colors.red })
  set_highlight("@conditional", { fg = colors.red })
  set_highlight("@conditional.ternary", { fg = colors.red })
  set_highlight("@repeat", { fg = colors.red })
  set_highlight("@debug", { fg = colors.red })
  set_highlight("@include", { fg = colors.blue_bright })
  set_highlight("@exception", { fg = colors.red })
  set_highlight("@comment", { fg = colors.gray, italic = true })
  set_highlight("@comment.documentation", {
    fg = colors.gray,
    italic = true,
  })
  set_highlight("@punctuation.delimiter", { fg = colors.fg2 })
  set_highlight("@punctuation.bracket", { fg = colors.fg2 })
  set_highlight("@punctuation.special", { fg = colors.orange })

  set_highlight("DiagnosticError", { fg = colors.red })
  set_highlight("DiagnosticWarn", { fg = colors.yellow })
  set_highlight("DiagnosticInfo", { fg = colors.blue_bright })
  set_highlight("DiagnosticHint", { fg = colors.cyan })
  set_highlight("DiagnosticUnderlineError", { undercurl = true, sp = colors.red })
  set_highlight("DiagnosticUnderlineWarn", {
    undercurl = true,
    sp = colors.yellow,
  })
  set_highlight("DiagnosticUnderlineInfo", {
    undercurl = true,
    sp = colors.blue_bright,
  })
  set_highlight("DiagnosticUnderlineHint", {
    undercurl = true,
    sp = colors.cyan,
  })
  set_highlight("LspReferenceText", { bg = colors.bg1 })
  set_highlight("LspReferenceRead", { bg = colors.bg1 })
  set_highlight("LspReferenceWrite", { bg = colors.bg1 })

  set_highlight("DiffAdd", { fg = colors.green, bg = colors.bg1 })
  set_highlight("DiffChange", { fg = colors.blue_bright, bg = colors.bg1 })
  set_highlight("DiffDelete", { fg = colors.red, bg = colors.bg1 })
  set_highlight("DiffText", { fg = colors.fg, bg = colors.bg1 })

  set_highlight("GitSignsAdd", { fg = colors.green })
  set_highlight("GitSignsChange", { fg = colors.blue_bright })
  set_highlight("GitSignsDelete", { fg = colors.red })
  set_highlight("GitGutterAdd", { fg = colors.green })
  set_highlight("GitGutterChange", { fg = colors.blue_bright })
  set_highlight("GitGutterDelete", { fg = colors.red })

  set_highlight("TelescopeNormal", { fg = colors.fg, bg = colors.bg })
  set_highlight("TelescopeBorder", { fg = colors.purple, bg = colors.bg })
  set_highlight("TelescopePromptNormal", { fg = colors.fg, bg = colors.bg })
  set_highlight("TelescopePromptBorder", { fg = colors.purple, bg = colors.bg })
  set_highlight("TelescopePromptTitle", { fg = colors.purple, bg = colors.bg })
  set_highlight("TelescopePreviewTitle", { fg = colors.purple, bg = colors.bg })
  set_highlight("TelescopeResultsTitle", { fg = colors.purple, bg = colors.bg })
  set_highlight("TelescopeSelection", {
    fg = colors.fg,
    bg = colors.bg2,
    bold = false,
  })

  set_highlight("WhichKey", { fg = colors.yellow, bg = colors.bg })
  set_highlight("WhichKeyGroup", { fg = colors.blue_bright, bg = colors.bg })
  set_highlight("WhichKeyDesc", { fg = colors.fg, bg = colors.bg })
  set_highlight("WhichKeyBorder", { fg = colors.purple, bg = colors.bg })

  set_highlight("NeoTreeNormal", { fg = colors.fg, bg = colors.bg })
  set_highlight("NeoTreeNormalNC", { fg = colors.gray, bg = colors.bg })
  set_highlight("NeoTreeFloatBorder", { fg = colors.purple, bg = colors.bg })
  set_highlight("NeoTreeDirectoryIcon", { fg = colors.yellow })
  set_highlight("NeoTreeDirectoryName", { fg = colors.fg })
  set_highlight("NeoTreeFileName", { fg = colors.fg })
  set_highlight("NeoTreeGitModified", { fg = colors.yellow })
  set_highlight("NeoTreeGitAdded", { fg = colors.green })
  set_highlight("NeoTreeGitDeleted", { fg = colors.red })

  set_highlight("NvimTreeNormal", { fg = colors.fg, bg = colors.bg })
  set_highlight("NvimTreeNormalNC", { fg = colors.gray, bg = colors.bg })
  set_highlight("NvimTreeEndOfBuffer", { fg = colors.gray })
  set_highlight("NvimTreeWinSeparator", { fg = colors.bg1, bg = colors.bg })
  set_highlight("NvimTreeFolderIcon", { fg = colors.yellow, bold = true })
  set_highlight("NvimTreeFolderName", { fg = colors.fg })
  set_highlight("NvimTreeOpenedFolderName", { fg = colors.purple })
  set_highlight("NvimTreeEmptyFolderName", { fg = colors.gray })
  set_highlight("NvimTreeFile", { fg = colors.fg })
  set_highlight("NvimTreeOpenedFile", { fg = colors.fg })
  set_highlight("NvimTreeModifiedFile", { fg = colors.yellow, bold = true })
  set_highlight("NvimTreeGitDeleted", { fg = colors.red })
  set_highlight("NvimTreeGitMerge", { fg = colors.purple })
  set_highlight("NvimTreeGitRenamed", { fg = colors.cyan })
  set_highlight("NvimTreeGitStaged", { fg = colors.green })
  set_highlight("NvimTreeGitUntracked", { fg = colors.gray })
  set_highlight("NvimTreeIndentMarker", { fg = colors.gray })
  set_highlight("NvimTreeCursorLine", { bg = colors.bg1 })
  set_highlight("NvimTreeLineNr", { fg = colors.gray })
  set_highlight("NvimTreeRootFolder", { fg = colors.purple, bold = true })
  set_highlight("NvimTreeSpecialIcon", { fg = colors.purple })

  set_highlight("CmpItemAbbr", { fg = colors.fg })
  set_highlight("CmpItemAbbrMatch", { fg = colors.yellow, bold = true })
  set_highlight("CmpItemAbbrMatchFuzzy", { fg = colors.yellow, bold = true })
  set_highlight("CmpItemKind", { fg = colors.blue_bright })
  set_highlight("CmpItemMenu", { fg = colors.gray })
end

setup()