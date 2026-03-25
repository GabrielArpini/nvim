-- Phosphor Green — CRT terminal colorscheme for Neovim
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
vim.g.colors_name = "phosphor"
vim.o.background = "dark"

local hi = vim.api.nvim_set_hl

-- Palette
local c = {
  bg        = "#080d08",  -- near-black with green tint
  bg_dark   = "#040704",  -- darker bg for floats/sidebars
  bg_sel    = "#0d2b0d",  -- selection bg
  bg_subtle = "#0a1a0a",  -- subtle highlight (cursorline)
  dim       = "#1a5c1a",  -- comments, invisible things
  muted     = "#267326",  -- line numbers, punctuation
  mid       = "#33aa33",  -- operators, brackets
  fg        = "#39d939",  -- main text
  bright    = "#66ff66",  -- keywords, identifiers
  glow      = "#99ff99",  -- brightest — constants, special
  cursor    = "#39d939",
  none      = "NONE",
}

-- Editor chrome
hi(0, "Normal",        { fg = c.fg,     bg = c.bg })
hi(0, "NormalFloat",   { fg = c.fg,     bg = c.bg_dark })
hi(0, "FloatBorder",   { fg = c.muted,  bg = c.bg_dark })
hi(0, "NormalNC",      { fg = c.fg,     bg = c.bg })
hi(0, "CursorLine",    { bg = c.bg_subtle })
hi(0, "CursorLineNr",  { fg = c.bright, bold = true })
hi(0, "LineNr",        { fg = c.dim })
hi(0, "SignColumn",    { fg = c.muted,  bg = c.bg })
hi(0, "ColorColumn",   { bg = c.bg_subtle })
hi(0, "VertSplit",     { fg = c.dim,    bg = c.bg })
hi(0, "WinSeparator",  { fg = c.dim,    bg = c.bg })

-- Selection / search
hi(0, "Visual",        { bg = c.bg_sel })
hi(0, "Search",        { fg = c.bg,     bg = c.bright })
hi(0, "IncSearch",     { fg = c.bg,     bg = c.glow,   bold = true })
hi(0, "Substitute",    { fg = c.bg,     bg = c.bright })

-- Cursor
hi(0, "Cursor",        { fg = c.bg,     bg = c.cursor })
hi(0, "CursorIM",      { fg = c.bg,     bg = c.cursor })

-- Statusline
hi(0, "StatusLine",    { fg = c.bright, bg = c.bg_subtle })
hi(0, "StatusLineNC",  { fg = c.dim,    bg = c.bg_dark })

-- Pmenu (completion)
hi(0, "Pmenu",         { fg = c.fg,     bg = c.bg_dark })
hi(0, "PmenuSel",      { fg = c.bg,     bg = c.mid,    bold = true })
hi(0, "PmenuSbar",     { bg = c.bg_subtle })
hi(0, "PmenuThumb",    { bg = c.muted })

-- Folds / misc
hi(0, "Folded",        { fg = c.dim,    bg = c.bg_subtle })
hi(0, "FoldColumn",    { fg = c.dim,    bg = c.bg })
hi(0, "MatchParen",    { fg = c.glow,   bold = true, underline = true })
hi(0, "NonText",       { fg = c.dim })
hi(0, "SpecialKey",    { fg = c.dim })
hi(0, "Whitespace",    { fg = c.bg_subtle })

-- Messages
hi(0, "Error",         { fg = c.glow,   bold = true, reverse = true })
hi(0, "Warning",       { fg = c.bright, bold = true })
hi(0, "ErrorMsg",      { fg = c.glow,   bold = true })
hi(0, "WarningMsg",    { fg = c.bright })
hi(0, "ModeMsg",       { fg = c.bright, bold = true })
hi(0, "MoreMsg",       { fg = c.mid })
hi(0, "Question",      { fg = c.bright })

-- Syntax
hi(0, "Comment",       { fg = c.dim,    italic = true })
hi(0, "Constant",      { fg = c.glow })
hi(0, "String",        { fg = c.mid })
hi(0, "Character",     { fg = c.mid })
hi(0, "Number",        { fg = c.glow })
hi(0, "Boolean",       { fg = c.glow,   bold = true })
hi(0, "Float",         { fg = c.glow })
hi(0, "Identifier",    { fg = c.fg })
hi(0, "Function",      { fg = c.bright, bold = true })
hi(0, "Statement",     { fg = c.bright })
hi(0, "Keyword",       { fg = c.bright, bold = true })
hi(0, "Conditional",   { fg = c.bright, bold = true })
hi(0, "Repeat",        { fg = c.bright, bold = true })
hi(0, "Operator",      { fg = c.mid })
hi(0, "PreProc",       { fg = c.muted })
hi(0, "Include",       { fg = c.muted })
hi(0, "Define",        { fg = c.muted })
hi(0, "Type",          { fg = c.bright })
hi(0, "StorageClass",  { fg = c.bright })
hi(0, "Structure",     { fg = c.bright })
hi(0, "Special",       { fg = c.glow })
hi(0, "Delimiter",     { fg = c.muted })
hi(0, "Underlined",    { underline = true })
hi(0, "Todo",          { fg = c.bg,     bg = c.bright, bold = true })

-- Treesitter
hi(0, "@variable",            { fg = c.fg })
hi(0, "@variable.builtin",    { fg = c.glow })
hi(0, "@function",            { fg = c.bright, bold = true })
hi(0, "@function.builtin",    { fg = c.glow })
hi(0, "@function.call",       { fg = c.bright })
hi(0, "@method",              { fg = c.bright })
hi(0, "@method.call",         { fg = c.bright })
hi(0, "@parameter",           { fg = c.fg })
hi(0, "@keyword",             { fg = c.bright, bold = true })
hi(0, "@keyword.function",    { fg = c.bright, bold = true })
hi(0, "@keyword.return",      { fg = c.bright, bold = true })
hi(0, "@conditional",         { fg = c.bright, bold = true })
hi(0, "@repeat",              { fg = c.bright, bold = true })
hi(0, "@type",                { fg = c.bright })
hi(0, "@type.builtin",        { fg = c.glow })
hi(0, "@field",               { fg = c.fg })
hi(0, "@property",            { fg = c.fg })
hi(0, "@constructor",         { fg = c.bright })
hi(0, "@string",              { fg = c.mid })
hi(0, "@string.escape",       { fg = c.glow })
hi(0, "@number",              { fg = c.glow })
hi(0, "@boolean",             { fg = c.glow, bold = true })
hi(0, "@constant",            { fg = c.glow })
hi(0, "@constant.builtin",    { fg = c.glow, bold = true })
hi(0, "@comment",             { fg = c.dim, italic = true })
hi(0, "@operator",            { fg = c.mid })
hi(0, "@punctuation",         { fg = c.muted })
hi(0, "@punctuation.bracket", { fg = c.muted })
hi(0, "@tag",                 { fg = c.bright })
hi(0, "@tag.attribute",       { fg = c.mid })
hi(0, "@tag.delimiter",       { fg = c.muted })

-- LSP diagnostics
hi(0, "DiagnosticError",            { fg = c.glow })
hi(0, "DiagnosticWarn",             { fg = c.bright })
hi(0, "DiagnosticInfo",             { fg = c.mid })
hi(0, "DiagnosticHint",             { fg = c.dim })
hi(0, "DiagnosticUnderlineError",   { undercurl = true, sp = c.glow })
hi(0, "DiagnosticUnderlineWarn",    { undercurl = true, sp = c.bright })

-- Git (gitsigns)
hi(0, "GitSignsAdd",    { fg = c.mid })
hi(0, "GitSignsChange", { fg = c.muted })
hi(0, "GitSignsDelete", { fg = c.dim })

-- Which-key
hi(0, "WhichKey",      { fg = c.glow,   bold = true })
hi(0, "WhichKeyGroup", { fg = c.bright })
hi(0, "WhichKeyDesc",  { fg = c.fg })
hi(0, "WhichKeyFloat", { bg = c.bg_dark })
hi(0, "WhichKeyBorder",{ fg = c.dim })

-- Flash
hi(0, "FlashLabel",    { fg = c.bg, bg = c.glow, bold = true })
hi(0, "FlashMatch",    { fg = c.bg, bg = c.mid })
