-- Nighthawks — Edward Hopper, 1942
-- Cold teal exterior meets warm amber diner light
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
vim.g.colors_name = "nighthawks"
vim.o.background = "dark"

local hi = vim.api.nvim_set_hl

local c = {
  -- Night exterior — backgrounds
  bg        = "#0f0e0c",  -- the dark street outside
  bg_dark   = "#090908",  -- deeper shadow
  bg_sel    = "#1e1a12",  -- warm dark selection
  bg_subtle = "#131210",  -- cursorline

  -- The cold teal building / window glass
  teal_dim  = "#1e4040",
  teal      = "#2d6060",
  teal_mid  = "#4a8080",
  teal_bright = "#6aadad",

  -- Warm amber diner interior light
  amber_dim = "#6b4f22",
  amber     = "#b8792a",
  amber_mid = "#c8934a",
  amber_bright = "#d4a85a",

  -- The cream counter / bright interior
  cream_dim = "#8a7a5a",
  cream     = "#c4b48a",
  cream_bright = "#d8caa8",

  -- The red dress — accent only
  red       = "#8b3535",
  red_bright = "#a84848",

  -- Main text — warm off-white, like the diner's glow on faces
  fg_dim    = "#5a4e38",
  fg        = "#b0a080",
  fg_bright = "#ccc0a0",

  none      = "NONE",
}

-- Editor chrome
hi(0, "Normal",        { fg = c.fg,          bg = c.bg })
hi(0, "NormalFloat",   { fg = c.fg,          bg = c.bg_dark })
hi(0, "FloatBorder",   { fg = c.teal_dim,    bg = c.bg_dark })
hi(0, "NormalNC",      { fg = c.fg,          bg = c.bg })
hi(0, "CursorLine",    { bg = c.bg_subtle })
hi(0, "CursorLineNr",  { fg = c.amber_bright, bold = true })
hi(0, "LineNr",        { fg = c.fg_dim })
hi(0, "SignColumn",    { fg = c.teal_dim,    bg = c.bg })
hi(0, "ColorColumn",   { bg = c.bg_subtle })
hi(0, "VertSplit",     { fg = c.teal_dim,    bg = c.bg })
hi(0, "WinSeparator",  { fg = c.teal_dim,    bg = c.bg })

-- Selection / search
hi(0, "Visual",        { bg = c.bg_sel })
hi(0, "Search",        { fg = c.bg,          bg = c.amber_mid })
hi(0, "IncSearch",     { fg = c.bg,          bg = c.amber_bright, bold = true })
hi(0, "Substitute",    { fg = c.bg,          bg = c.amber_mid })

-- Cursor
hi(0, "Cursor",        { fg = c.bg,          bg = c.amber_bright })
hi(0, "CursorIM",      { fg = c.bg,          bg = c.amber_bright })

-- Statusline
hi(0, "StatusLine",    { fg = c.cream,       bg = c.bg_subtle })
hi(0, "StatusLineNC",  { fg = c.fg_dim,      bg = c.bg_dark })

-- Pmenu
hi(0, "Pmenu",         { fg = c.fg,          bg = c.bg_dark })
hi(0, "PmenuSel",      { fg = c.bg,          bg = c.amber_mid, bold = true })
hi(0, "PmenuSbar",     { bg = c.bg_subtle })
hi(0, "PmenuThumb",    { bg = c.teal_dim })

-- Misc
hi(0, "Folded",        { fg = c.fg_dim,      bg = c.bg_subtle })
hi(0, "FoldColumn",    { fg = c.fg_dim,      bg = c.bg })
hi(0, "MatchParen",    { fg = c.amber_bright, bold = true, underline = true })
hi(0, "NonText",       { fg = c.fg_dim })
hi(0, "SpecialKey",    { fg = c.teal_dim })
hi(0, "Whitespace",    { fg = c.bg_subtle })

-- Messages / UI
hi(0, "Error",         { fg = c.red_bright,  bold = true })
hi(0, "ErrorMsg",      { fg = c.red_bright,  bold = true })
hi(0, "WarningMsg",    { fg = c.amber_mid })
hi(0, "ModeMsg",       { fg = c.amber_bright, bold = true })
hi(0, "MoreMsg",       { fg = c.teal_mid })
hi(0, "Question",      { fg = c.cream })

-- Syntax
hi(0, "Comment",       { fg = c.fg_dim,      italic = true })
hi(0, "Constant",      { fg = c.cream_bright })
hi(0, "String",        { fg = c.teal_mid })       -- cold teal, exterior world
hi(0, "Character",     { fg = c.teal_mid })
hi(0, "Number",        { fg = c.amber_mid })
hi(0, "Boolean",       { fg = c.amber_bright,  bold = true })
hi(0, "Float",         { fg = c.amber_mid })
hi(0, "Identifier",    { fg = c.fg })
hi(0, "Function",      { fg = c.cream_bright, bold = true })
hi(0, "Statement",     { fg = c.amber_bright })
hi(0, "Keyword",       { fg = c.amber_bright, bold = true })
hi(0, "Conditional",   { fg = c.amber_bright, bold = true })
hi(0, "Repeat",        { fg = c.amber_bright, bold = true })
hi(0, "Operator",      { fg = c.amber_dim })
hi(0, "PreProc",       { fg = c.teal_mid })
hi(0, "Include",       { fg = c.teal_mid })
hi(0, "Define",        { fg = c.teal_mid })
hi(0, "Type",          { fg = c.cream })
hi(0, "StorageClass",  { fg = c.amber_mid })
hi(0, "Structure",     { fg = c.cream })
hi(0, "Special",       { fg = c.cream_bright })
hi(0, "Delimiter",     { fg = c.teal_dim })
hi(0, "Underlined",    { underline = true })
hi(0, "Todo",          { fg = c.bg, bg = c.amber_bright, bold = true })

-- Treesitter
hi(0, "@variable",              { fg = c.fg })
hi(0, "@variable.builtin",      { fg = c.cream_bright })
hi(0, "@function",              { fg = c.cream_bright, bold = true })
hi(0, "@function.builtin",      { fg = c.cream_bright })
hi(0, "@function.call",         { fg = c.cream })
hi(0, "@method",                { fg = c.cream_bright })
hi(0, "@method.call",           { fg = c.cream })
hi(0, "@parameter",             { fg = c.fg })
hi(0, "@keyword",               { fg = c.amber_bright, bold = true })
hi(0, "@keyword.function",      { fg = c.amber_bright, bold = true })
hi(0, "@keyword.return",        { fg = c.amber_bright, bold = true })
hi(0, "@conditional",           { fg = c.amber_bright, bold = true })
hi(0, "@repeat",                { fg = c.amber_bright, bold = true })
hi(0, "@type",                  { fg = c.cream })
hi(0, "@type.builtin",          { fg = c.cream_bright })
hi(0, "@field",                 { fg = c.fg })
hi(0, "@property",              { fg = c.fg })
hi(0, "@constructor",           { fg = c.cream })
hi(0, "@string",                { fg = c.teal_mid })
hi(0, "@string.escape",         { fg = c.teal_bright })
hi(0, "@number",                { fg = c.amber_mid })
hi(0, "@boolean",               { fg = c.amber_bright, bold = true })
hi(0, "@constant",              { fg = c.cream_bright })
hi(0, "@constant.builtin",      { fg = c.cream_bright, bold = true })
hi(0, "@comment",               { fg = c.fg_dim, italic = true })
hi(0, "@operator",              { fg = c.amber_dim })
hi(0, "@punctuation",           { fg = c.teal_dim })
hi(0, "@punctuation.bracket",   { fg = c.teal_dim })
hi(0, "@tag",                   { fg = c.amber_mid })
hi(0, "@tag.attribute",         { fg = c.teal_mid })
hi(0, "@tag.delimiter",         { fg = c.teal_dim })

-- LSP diagnostics
hi(0, "DiagnosticError",            { fg = c.red_bright })
hi(0, "DiagnosticWarn",             { fg = c.amber_mid })
hi(0, "DiagnosticInfo",             { fg = c.teal_mid })
hi(0, "DiagnosticHint",             { fg = c.fg_dim })
hi(0, "DiagnosticUnderlineError",   { undercurl = true, sp = c.red_bright })
hi(0, "DiagnosticUnderlineWarn",    { undercurl = true, sp = c.amber_mid })

-- Git (gitsigns)
hi(0, "GitSignsAdd",    { fg = c.teal_mid })
hi(0, "GitSignsChange", { fg = c.amber_dim })
hi(0, "GitSignsDelete", { fg = c.red })

-- Which-key
hi(0, "WhichKey",       { fg = c.amber_bright, bold = true })
hi(0, "WhichKeyGroup",  { fg = c.cream })
hi(0, "WhichKeyDesc",   { fg = c.fg })
hi(0, "WhichKeyFloat",  { bg = c.bg_dark })
hi(0, "WhichKeyBorder", { fg = c.teal_dim })

-- Flash
hi(0, "FlashLabel",     { fg = c.bg, bg = c.amber_bright, bold = true })
hi(0, "FlashMatch",     { fg = c.bg, bg = c.teal_mid })

-- Noice
hi(0, "NoicePopup",        { fg = c.fg,          bg = c.bg_dark })
hi(0, "NoicePopupBorder",  { fg = c.bg_sel,      bg = c.bg_dark })
hi(0, "NoiceCmdlineIcon",  { fg = c.amber_bright })
hi(0, "NoiceCmdlinePopup", { fg = c.fg,          bg = c.bg_dark })
hi(0, "NoiceConfirm",      { fg = c.fg,          bg = c.bg_dark })
hi(0, "NoiceMini",         { fg = c.fg_dim,      bg = c.bg })

-- mini.files
hi(0, "MiniFilesNormal",       { fg = c.fg,          bg = c.bg_dark })
hi(0, "MiniFilesBorder",       { fg = c.teal_dim,    bg = c.bg_dark })
hi(0, "MiniFilesTitle",        { fg = c.amber_dim,   bg = c.bg_dark })
hi(0, "MiniFilesTitleFocused", { fg = c.amber_bright, bg = c.bg_dark, bold = true })
hi(0, "MiniFilesCursorLine",   { bg = c.bg_sel })
hi(0, "MiniFilesDirectory",    { fg = c.teal_mid,    bold = true })
hi(0, "MiniFilesFile",         { fg = c.fg })
