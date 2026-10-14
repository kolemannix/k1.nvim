-- k1 colorscheme — matches the k1 site (site/assets/css/site.css)
-- Dark palette from :root, light palette from .bone (set 'background' to pick).

local dark = {
  bg0 = '#0E1013', -- --g
  bg1 = '#151920', -- --p
  bg2 = '#1B2028', -- --p2
  bg3 = '#1F2530', -- board light square
  line = '#262B34', -- --l
  line2 = '#333944', -- --l2
  muted = '#7E8794', -- --m
  dim = '#5C6572',
  fg = '#E6E9EE', -- --f
  bright = '#FFFFFF', -- --b
  gold = '#E6C070', -- --s
  gold_dim = '#42381F',
  green = '#8FC9A0', -- --up
  red = '#D9806A', -- --down
  prose = '#B9C0CA', -- --prose
  sage = '#8FA77B', -- --code
  blue = '#8FA3BF', -- --type
  blue2 = '#A9BCD4',
  tan = '#C9B48A', -- .k-string
  add_bg = '#18241C',
  del_bg = '#2B1B16',
  chg_bg = '#1E2430',
}

local light = {
  bg0 = '#EDEAE1',
  bg1 = '#E4E0D6',
  bg2 = '#DCD7CA',
  bg3 = '#D6D1C4',
  line = '#D6D1C4',
  line2 = '#C2BCAE',
  muted = '#7C7469',
  dim = '#9A9183',
  fg = '#15171A',
  bright = '#000000',
  gold = '#B08A36',
  gold_dim = '#E2D3AC',
  green = '#3E7A52',
  red = '#A84E34',
  prose = '#3A3D43',
  sage = '#4C7A3E',
  blue = '#4B6A8F',
  blue2 = '#3A5473',
  tan = '#8C6D33',
  add_bg = '#D8E2D0',
  del_bg = '#E8D2C6',
  chg_bg = '#D7DAE0',
}

local c = vim.o.background == 'light' and light or dark

vim.cmd('highlight clear')
if vim.fn.exists('syntax_on') == 1 then
  vim.cmd('syntax reset')
end
vim.g.colors_name = 'k1'

local hl = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- UI -------------------------------------------------------------------
hl('Normal', { fg = c.fg, bg = c.bg0 })
hl('NormalNC', { fg = c.fg, bg = c.bg0 })
hl('NormalFloat', { fg = c.fg, bg = c.bg1 })
hl('FloatBorder', { fg = c.line2, bg = c.bg1 })
hl('FloatTitle', { fg = c.gold, bg = c.bg1, bold = true })
hl('WinSeparator', { fg = c.line })
hl('ColorColumn', { bg = c.bg1 })
hl('CursorLine', { bg = c.bg1 })
hl('CursorColumn', { bg = c.bg1 })
hl('CursorLineNr', { fg = c.gold, bold = true })
hl('LineNr', { fg = c.line2 })
hl('SignColumn', { bg = c.bg0 })
hl('Folded', { fg = c.muted, bg = c.bg1 })
hl('FoldColumn', { fg = c.line2 })
hl('Visual', { bg = c.line2 })
hl('VisualNOS', { bg = c.line })
hl('Search', { bg = c.gold_dim, fg = c.fg })
hl('IncSearch', { bg = c.gold, fg = c.bg0 })
hl('CurSearch', { bg = c.gold, fg = c.bg0 })
hl('Substitute', { bg = c.gold, fg = c.bg0 })
hl('MatchParen', { fg = c.gold, bold = true })
hl('Pmenu', { fg = c.fg, bg = c.bg2 })
hl('PmenuSel', { fg = c.bright, bg = c.line2, bold = true })
hl('PmenuSbar', { bg = c.bg2 })
hl('PmenuThumb', { bg = c.line2 })
hl('PmenuKind', { fg = c.blue, bg = c.bg2 })
hl('PmenuExtra', { fg = c.muted, bg = c.bg2 })
hl('WildMenu', { fg = c.bg0, bg = c.gold })
hl('StatusLine', { fg = c.fg, bg = c.bg2 })
hl('StatusLineNC', { fg = c.muted, bg = c.bg1 })
hl('TabLine', { fg = c.muted, bg = c.bg1 })
hl('TabLineSel', { fg = c.bright, bg = c.bg0, bold = true })
hl('TabLineFill', { bg = c.bg1 })
hl('WinBar', { fg = c.prose, bg = c.bg0 })
hl('WinBarNC', { fg = c.muted, bg = c.bg0 })
hl('NonText', { fg = c.line2 })
hl('Whitespace', { fg = c.line })
hl('SpecialKey', { fg = c.line2 })
hl('EndOfBuffer', { fg = c.line })
hl('Conceal', { fg = c.muted })
hl('Directory', { fg = c.blue })
hl('Title', { fg = c.bright, bold = true })
hl('ErrorMsg', { fg = c.red })
hl('WarningMsg', { fg = c.gold })
hl('ModeMsg', { fg = c.muted })
hl('MoreMsg', { fg = c.green })
hl('Question', { fg = c.gold })
hl('QuickFixLine', { bg = c.bg2, bold = true })
hl('SpellBad', { undercurl = true, sp = c.red })
hl('SpellCap', { undercurl = true, sp = c.gold })
hl('SpellLocal', { undercurl = true, sp = c.blue })
hl('SpellRare', { undercurl = true, sp = c.green })

-- Diff -----------------------------------------------------------------
hl('DiffAdd', { bg = c.add_bg })
hl('DiffDelete', { fg = c.line2, bg = c.del_bg })
hl('DiffChange', { bg = c.chg_bg })
hl('DiffText', { bg = c.line2 })
hl('Added', { fg = c.green })
hl('Removed', { fg = c.red })
hl('Changed', { fg = c.gold })

-- Syntax (legacy groups) -------------------------------------------------
hl('Comment', { fg = c.muted, italic = true })
hl('Constant', { fg = c.tan })
hl('String', { fg = c.tan })
hl('Character', { fg = c.tan })
hl('Number', { fg = c.tan })
hl('Float', { fg = c.tan })
hl('Boolean', { fg = c.green })
hl('Identifier', { fg = c.fg })
hl('Function', { fg = c.bright })
hl('Statement', { fg = c.fg, bold = true })
hl('Conditional', { fg = c.fg, bold = true })
hl('Repeat', { fg = c.fg, bold = true })
hl('Label', { fg = c.fg, bold = true })
hl('Operator', { fg = c.muted })
hl('Keyword', { fg = c.fg, bold = true })
hl('Exception', { fg = c.fg, bold = true })
hl('PreProc', { fg = c.gold })
hl('Include', { fg = c.gold })
hl('Define', { fg = c.gold })
hl('Macro', { fg = c.gold })
hl('PreCondit', { fg = c.gold })
hl('Type', { fg = c.blue })
hl('StorageClass', { fg = c.fg, bold = true })
hl('Structure', { fg = c.blue })
hl('Typedef', { fg = c.blue })
hl('Special', { fg = c.gold })
hl('SpecialChar', { fg = c.gold })
hl('Tag', { fg = c.blue })
hl('Delimiter', { fg = c.muted })
hl('SpecialComment', { fg = c.prose, italic = true })
hl('Debug', { fg = c.red })
hl('Underlined', { underline = true })
hl('Error', { fg = c.red })
hl('Todo', { fg = c.bg0, bg = c.gold, bold = true })

-- Treesitter -------------------------------------------------------------
hl('@comment', { link = 'Comment' })
hl('@comment.documentation', { fg = c.prose, italic = true })
hl('@comment.error', { fg = c.red, bold = true })
hl('@comment.warning', { fg = c.gold, bold = true })
hl('@comment.todo', { link = 'Todo' })
hl('@comment.note', { fg = c.blue, bold = true })
hl('@string', { link = 'String' })
hl('@string.escape', { fg = c.gold })
hl('@string.special', { fg = c.gold })
hl('@string.regexp', { fg = c.green })
hl('@character', { link = 'Character' })
hl('@number', { link = 'Number' })
hl('@number.float', { link = 'Float' })
hl('@boolean', { link = 'Boolean' })
hl('@constant', { fg = c.fg })
hl('@constant.builtin', { fg = c.green, italic = true })
hl('@constant.macro', { fg = c.gold })
hl('@variable', { fg = c.fg })
hl('@variable.builtin', { fg = c.prose, italic = true })
hl('@variable.parameter', { fg = c.prose, italic = true })
hl('@variable.member', { fg = c.sage })
hl('@property', { fg = c.sage })
hl('@field', { fg = c.sage })
hl('@function', { link = 'Function' })
hl('@function.builtin', { fg = c.bright, italic = true })
hl('@function.macro', { fg = c.gold })
hl('@function.method', { fg = c.bright })
hl('@constructor', { fg = c.blue })
hl('@keyword', { link = 'Keyword' })
hl('@keyword.directive', { fg = c.gold })
hl('@keyword.import', { fg = c.gold })
hl('@operator', { link = 'Operator' })
hl('@punctuation.delimiter', { fg = c.muted })
hl('@punctuation.bracket', { fg = c.muted })
hl('@punctuation.special', { fg = c.gold })
hl('@type', { link = 'Type' })
hl('@type.builtin', { fg = c.blue, italic = true })
hl('@type.definition', { fg = c.blue, bold = true })
hl('@attribute', { fg = c.gold })
hl('@module', { fg = c.muted })
hl('@namespace', { fg = c.muted })
hl('@label', { fg = c.gold })
hl('@tag', { fg = c.blue })
hl('@tag.attribute', { fg = c.sage })
hl('@tag.delimiter', { fg = c.muted })
hl('@markup.strong', { bold = true })
hl('@markup.italic', { italic = true })
hl('@markup.strikethrough', { strikethrough = true })
hl('@markup.underline', { underline = true })
hl('@markup.heading', { fg = c.bright, bold = true })
hl('@markup.quote', { fg = c.prose, italic = true })
hl('@markup.link', { fg = c.gold, underline = true })
hl('@markup.link.url', { fg = c.blue, underline = true })
hl('@markup.raw', { fg = c.sage })
hl('@markup.list', { fg = c.gold })
hl('@diff.plus', { fg = c.green })
hl('@diff.minus', { fg = c.red })
hl('@diff.delta', { fg = c.gold })

-- LSP semantic tokens (k1lsp emits the full standard legend) --------------
hl('@lsp.type.namespace', { fg = c.muted })
hl('@lsp.type.type', { fg = c.blue })
hl('@lsp.type.class', { fg = c.blue })
hl('@lsp.type.struct', { fg = c.blue })
hl('@lsp.type.enum', { fg = c.blue, bold = true })
hl('@lsp.type.interface', { fg = c.blue, italic = true })
hl('@lsp.type.typeParameter', { fg = c.blue2, italic = true })
hl('@lsp.type.parameter', { fg = c.prose, italic = true })
hl('@lsp.type.variable', { fg = c.fg })
hl('@lsp.type.property', { fg = c.sage })
hl('@lsp.type.enumMember', { fg = c.green })
hl('@lsp.type.event', { fg = c.gold })
hl('@lsp.type.function', { fg = c.bright })
hl('@lsp.type.method', { fg = c.bright })
hl('@lsp.type.macro', { fg = c.gold })
hl('@lsp.type.keyword', { fg = c.fg, bold = true })
hl('@lsp.type.modifier', { fg = c.fg, bold = true, italic = true })
hl('@lsp.type.comment', { fg = c.muted, italic = true })
hl('@lsp.type.string', { fg = c.tan })
hl('@lsp.type.number', { fg = c.tan })
hl('@lsp.type.regexp', { fg = c.green })
hl('@lsp.type.operator', { fg = c.muted })
hl('@lsp.type.decorator', { fg = c.gold })

-- Modifiers: declarations pop, readonly leans, statics are underdotted.
hl('@lsp.mod.declaration', { bold = true })
hl('@lsp.mod.definition', { bold = true })
hl('@lsp.mod.readonly', { italic = true })
hl('@lsp.mod.static', { underdotted = true, sp = c.line2 })
hl('@lsp.mod.modification', { underline = true, sp = c.gold })
hl('@lsp.typemod.function.declaration', { fg = c.bright, bold = true })
hl('@lsp.typemod.method.declaration', { fg = c.bright, bold = true })
hl('@lsp.typemod.variable.readonly', { fg = c.fg, italic = true })
hl('@lsp.typemod.variable.static', { fg = c.sage, underdotted = true, sp = c.line2 })
hl('@lsp.typemod.parameter.declaration', { fg = c.prose, italic = true })

-- Diagnostics -------------------------------------------------------------
hl('DiagnosticError', { fg = c.red })
hl('DiagnosticWarn', { fg = c.gold })
hl('DiagnosticInfo', { fg = c.blue })
hl('DiagnosticHint', { fg = c.muted })
hl('DiagnosticOk', { fg = c.green })
hl('DiagnosticUnderlineError', { undercurl = true, sp = c.red })
hl('DiagnosticUnderlineWarn', { undercurl = true, sp = c.gold })
hl('DiagnosticUnderlineInfo', { undercurl = true, sp = c.blue })
hl('DiagnosticUnderlineHint', { undercurl = true, sp = c.muted })
hl('DiagnosticUnderlineOk', { undercurl = true, sp = c.green })
hl('DiagnosticVirtualTextError', { fg = c.red, bg = c.del_bg })
hl('DiagnosticVirtualTextWarn', { fg = c.gold, bg = c.gold_dim })
hl('DiagnosticVirtualTextInfo', { fg = c.blue, bg = c.chg_bg })
hl('DiagnosticVirtualTextHint', { fg = c.muted, bg = c.bg1 })
hl('DiagnosticVirtualTextOk', { fg = c.green, bg = c.add_bg })
hl('DiagnosticFloatingError', { fg = c.red })
hl('DiagnosticFloatingWarn', { fg = c.gold })
hl('DiagnosticFloatingInfo', { fg = c.blue })
hl('DiagnosticFloatingHint', { fg = c.muted })
hl('DiagnosticSignError', { fg = c.red })
hl('DiagnosticSignWarn', { fg = c.gold })
hl('DiagnosticSignInfo', { fg = c.blue })
hl('DiagnosticSignHint', { fg = c.muted })
hl('DiagnosticDeprecated', { strikethrough = true, sp = c.red })
hl('DiagnosticUnnecessary', { fg = c.dim, undercurl = true, sp = c.muted })

-- LSP UI -------------------------------------------------------------------
hl('LspReferenceText', { bg = c.bg2 })
hl('LspReferenceRead', { bg = c.bg2 })
hl('LspReferenceWrite', { bg = c.line, underline = true, sp = c.gold })
hl('LspReferenceTarget', { bg = c.bg2 })
hl('LspInlayHint', { fg = c.dim, bg = c.bg1, italic = true })
hl('LspCodeLens', { fg = c.dim, italic = true })
hl('LspCodeLensSeparator', { fg = c.line2 })
hl('LspSignatureActiveParameter', { fg = c.gold, bold = true })

-- Gitsigns ------------------------------------------------------------------
hl('GitSignsAdd', { fg = c.green })
hl('GitSignsChange', { fg = c.gold })
hl('GitSignsDelete', { fg = c.red })

-- Terminal palette ------------------------------------------------------------
vim.g.terminal_color_0 = c.bg2
vim.g.terminal_color_1 = c.red
vim.g.terminal_color_2 = c.sage
vim.g.terminal_color_3 = c.gold
vim.g.terminal_color_4 = c.blue
vim.g.terminal_color_5 = c.tan
vim.g.terminal_color_6 = c.green
vim.g.terminal_color_7 = c.fg
vim.g.terminal_color_8 = c.muted
vim.g.terminal_color_9 = c.red
vim.g.terminal_color_10 = c.green
vim.g.terminal_color_11 = c.gold
vim.g.terminal_color_12 = c.blue2
vim.g.terminal_color_13 = c.tan
vim.g.terminal_color_14 = c.green
vim.g.terminal_color_15 = c.bright
