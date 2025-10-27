local theme = {}

local function hl(id, name, def)
	vim.api.nvim_set_hl(id, name, def)
end

function theme.set_highlights(options)
	-- Determine background based on options
	local bg = options.background
	if bg == "auto" then
		bg = vim.o.background
	end
	
	-- Load appropriate palette
	local palette
	if bg == "light" then
		palette = require("night-owl.palette-light")
	else
		palette = require("night-owl.palette")
	end
	
	local background_color = options.transparent and palette.none or palette.bg

	-- highlights
	hl(0, "Normal", { fg = palette.fg, bg = background_color })
	hl(0, "SignColumn", { fg = palette.none, bg = palette.bg })
	hl(0, "Pmenu", { fg = palette.none, bg = palette.dark })
	hl(0, "PmenuSel", { fg = palette.none, bg = palette.quickfix_line })
	hl(0, "Comment", { fg = palette.dark_cyan, bg = palette.none, italic = options.italics })
	hl(0, "Folded", { fg = palette.dark_cyan, bg = palette.folded_bg })
	hl(0, "FoldColumn", { fg = palette.dark_cyan, bg = palette.bg })
	hl(0, "FloatBorder", { fg = palette.ui_border, bg = palette.bg })
	hl(0, "FloatTitle", { fg = palette.purple, bg = palette.bg, bold = options.bold })
	hl(0, "Whitespace", { fg = palette.blue14, bg = palette.none })
	hl(0, "VertSplit", { fg = palette.gray, bg = palette.none })
	hl(0, "WinSeparator", { fg = palette.gray, bg = palette.none })
	hl(0, "LineNr", { fg = palette.line_number_fg, bg = palette.none })
	hl(0, "CursorLineNr", { fg = palette.line_number_active_fg, bg = palette.none })
	hl(0, "CursorLine", { fg = palette.none, bg = palette.blue2 })
	hl(0, "CursorColumn", { fg = palette.none, bg = palette.dark2 })
	hl(0, "lCursor", { fg = palette.cursor_fg, bg = palette.cursor_bg })
	hl(0, "Cursor", { fg = palette.cursor_fg, bg = palette.cursor_bg })
	hl(0, "CursorIM", { fg = palette.cursor_fg, bg = palette.cursor_bg })
	hl(0, "TermCursor", { fg = palette.cursor_fg, bg = palette.cursor_bg })
	hl(0, "ColorColumn", { fg = palette.none, bg = palette.dark2 })
	hl(0, "NormalFloat", { fg = palette.none, bg = palette.bg, sp = palette.none, blend = 0 })
	hl(0, "Visual", { link = "@nowl.visual.active" })
	hl(0, "DiffAdd", { fg = palette.bg, bg = palette.sign_add })
	hl(0, "DiffChange", { fg = palette.bg, bg = palette.sign_change, underline = options.underline })
	hl(0, "DiffDelete", { fg = palette.bg, bg = palette.sign_delete })
	hl(0, "QuickFixLine", { fg = palette.none, bg = palette.quickfix_line })
	hl(0, "MatchParen", { fg = palette.none, bg = palette.match_paren, sp = palette.none })
	hl(0, "Conceal", { fg = palette.ui_border2, bg = palette.none })
	hl(0, "Directory", { fg = palette.blue, bg = palette.none })
	hl(0, "Title", { fg = palette.title, bg = palette.none, bold = options.bold })
	hl(0, "ErrorMsg", { link = "Error" })
	hl(0, "Search", { fg = palette.none, bg = palette.search_blue })
	hl(0, "IncSearch", { fg = palette.none, bg = palette.incremental_search_blue })
	hl(0, "NonText", { fg = palette.gray6, bg = palette.none })
	hl(0, "Variable", { fg = palette.parameter, bg = palette.none })
	hl(0, "String", { fg = palette.light_orange, bg = palette.none })
	hl(0, "Constant", { fg = palette.blue, bg = palette.none, italic = options.italics })
	hl(0, "Number", { fg = palette.orange, bg = palette.none })
	hl(0, "Boolean", { fg = palette.red, bg = palette.none, italic = options.italics })
	hl(0, "Identifier", { fg = palette.light_blue, bg = palette.none })
	hl(0, "Function", { fg = palette.blue, bg = palette.none, italic = options.italics })
	hl(0, "Operator", { fg = palette.magenta, bg = palette.none })
	hl(0, "Type", { fg = palette.orange2, bg = palette.none })
	hl(0, "Keyword", { fg = palette.magenta, bg = palette.none })
	hl(0, "Statement", { fg = palette.magenta, bg = palette.none, italic = options.italics })
	hl(0, "Conditional", { fg = palette.magenta, bg = palette.none })
	hl(0, "Include", { fg = palette.magenta, bg = palette.none, italic = options.italics })
	hl(0, "PreProc", { fg = palette.magenta4, bg = palette.none })
	hl(0, "Special", { fg = palette.orange2, bg = palette.none })
	hl(0, "Tag", { fg = palette.light_cyan, bg = palette.none })
	hl(0, "Delimiter", { fg = palette.fg, bg = palette.none })
	hl(0, "Error", { fg = palette.error_red, bg = palette.none })
	hl(0, "TabLineSel", { fg = palette.gray2, bg = palette.tab_active_bg })
	hl(0, "TabLine", { fg = palette.ui_border, bg = palette.tab_inactive_bg })
	hl(0, "TabLineFill", { fg = palette.bg, bg = palette.none })
	hl(0, "tomlTable", { fg = palette.green, bg = palette.none, italic = options.italics })
	hl(0, "tomlKey", { fg = palette.magenta, bg = palette.none, nocombine = true })
	hl(0, "tomlKeySq", { fg = palette.magenta, bg = palette.none, nocombine = true })

	-- NightOwl
	hl(0, "@nowl.constant.builtin.na.r", { fg = palette.red, bg = palette.none, italic = options.italics })
	hl(0, "@nowl.constant.builtin.null", { fg = palette.red, bg = palette.none })
	hl(0, "@nowl.indentChar", { fg = palette.indent_guide, bg = palette.none, nocombine = true })
	hl(0, "@nowl.indentChar.active", { fg = palette.indent_guide_active, bg = palette.none, nocombine = true })
	hl(0, "@nowl.keyword.break", { link = "Statement" })
	hl(0, "@nowl.keyword.operator.new.javascript", { fg = palette.cyan2, bg = palette.none })
	hl(0, "@nowl.punctuation.string.delimiter", { fg = palette.string_delimiter, bg = palette.none, nocombine = true })
	hl(0, "@nowl.variable.object", { fg = palette.cyan2, bg = palette.none, italic = options.italics })
	hl(0, "@nowl.variable.parameter.option.bash", { fg = palette.blue, bg = palette.none })
	hl(0, "@nowl.visual.active", { fg = palette.none, bg = palette.visual })
	hl(0, "@nowl.visual.inactive", { fg = palette.none, bg = palette.dark_purple })

	-- Treesitter
	hl(0, "@attribute.typescript", { link = "Function" })
	hl(0, "@attribute.css", { fg = palette.green, bg = palette.none, italic = options.italics })
	hl(0, "@class.constructor", { fg = palette.blue, bg = palette.none, italic = options.italics })
	hl(0, "@class.field.function", { link = "Function" })
	hl(0, "@command", { fg = palette.green, bg = palette.none, nocombine = true })
	hl(0, "@conditional.lua", { link = "Statement" })
	hl(0, "@constant", { link = "Constant" })
	hl(0, "@constant.builtin", { link = "Constant" })
	hl(0, "@constant.identifier", { link = "Constant" })
	hl(0, "@constructor.javascript", { fg = palette.blue, bg = palette.none, nocombine = true })
	hl(0, "@constructor.python", { fg = palette.green, bg = palette.none, italic = options.italics })
	hl(0, "@constructor.typescript", { fg = palette.blue, bg = palette.none, nocombine = true })
	hl(0, "@field", { fg = palette.cyan5, bg = palette.none })
	hl(0, "@function.builtin.lua", { fg = palette.blue, bg = palette.none, italic = options.italics })
	hl(0, "@function.builtin.python", { fg = palette.green, bg = palette.none, nocombine = true })
	hl(0, "@function.builtin.bash", { fg = palette.green, bg = palette.none, italic = options.italics })
	hl(0, "@include.identifier", { fg = palette.fg, bg = palette.none, nocombine = true })
	hl(0, "@keyword", { link = "Keyword" })
	hl(0, "@keyword.abort", { link = "Statement" })
	hl(0, "@keyword.lua.break", { link = "Statement" })
	hl(0, "@keyword.command", { fg = palette.green, bg = palette.none, nocombine = true })
	hl(0, "@keyword.conditional.bash", { link = "Statement" })
	hl(0, "@keyword.conditional.lua", { link = "Statement" })
	hl(0, "@keyword.conditional.python", { link = "Statement" })
	hl(0, "@keyword.conditional.r", { link = "Statement" })
	hl(0, "@keyword.coroutine", { link = "Statement" })
	hl(0, "@keyword.default", { link = "Statement" })
	hl(0, "@keyword.exception.python", { link = "Statement" })
	hl(0, "@keyword.export", { link = "Statement" })
	hl(0, "@keyword.extends", { link = "Statement" })
	hl(0, "@keyword.function.lua", { link = "Statement" })
	hl(0, "@keyword.function.r", { link = "Statement" })
	hl(0, "@keyword.function.return", { link = "Statement" })
	hl(0, "@keyword.function.vim", { link = "Statement" })
	hl(0, "@keyword.if.vim", { link = "Statement" })
	hl(0, "@keyword.jsdoc", { fg = palette.magenta, bg = palette.none, nocombine = true })
	hl(0, "@keyword.operator", { fg = palette.magenta, bg = palette.none })
	hl(0, "@keyword.operator.python", { link = "Statement" })
	hl(0, "@keyword.operator.typescript", { fg = palette.cyan2, bg = palette.none })
	hl(0, "@keyword.repeat", { link = "Statement" })
	hl(0, "@keyword.return", { link = "Statement" })
	hl(0, "@keyword.static", { link = "Statement" })
	hl(0, "@label", { fg = palette.cyan2, bg = palette.none })
	hl(0, "@module.r", { link = "@type.class" })
	hl(0, "@module.vim", { link = "@type.class" })
	hl(0, "@namespace.vim", { fg = palette.light_blue, bg = palette.none, italic = options.italics })
	hl(0, "@object.key", { link = "Statement" })
	hl(0, "@object.property", { fg = palette.light_yellow, bg = palette.none, italic = options.italics })
	hl(0, "@operator.lua", { fg = palette.cyan2, bg = palette.none })
	hl(0, "@operator.of", { fg = palette.cyan2, bg = palette.none })
	hl(0, "@operator.toml", { fg = palette.fg, bg = palette.none })
	hl(0, "@parameter", { fg = palette.parameter, bg = palette.none })
	hl(0, "@parameter.jsdoc", { fg = palette.light_blue, bg = palette.none })
	hl(0, "@property", { fg = palette.cyan5, bg = palette.none })
	hl(0, "@property.css", { fg = palette.cyan4, bg = palette.none })
	hl(0, "@property.toml", { fg = palette.magenta, bg = palette.none, nocombine = true })
	hl(0, "@punctuation.accessor", { link = "Statement" })
	hl(0, "@punctuation.special.bash", { fg = palette.green, bg = palette.none })
	hl(0, "@string.json", { fg = palette.magenta2, bg = palette.none })
	hl(0, "@string.regex", { fg = palette.blue, bg = palette.none, nocombine = true })
	hl(0, "@string.regexFlags", { fg = palette.blue8, bg = palette.none, nocombine = true })
	hl(0, "@tag.attribute", { fg = palette.green, bg = palette.none, italic = bg == "light" and false or options.italics })
	hl(0, "@tag.builtin", { fg = palette.light_cyan, bg = palette.none, nocombine = true })
	hl(0, "@tag.component.jsx", { fg = bg == "light" and palette.component_tag or palette.orange, bg = palette.none, nocombine = true })
	hl(0, "@tag.css", { fg = palette.red2, bg = palette.none, nocombine = true })
	hl(0, "@tag.delimiter", { fg = palette.cyan2, bg = palette.none })
	hl(0, "@text.emphasis", { fg = palette.magenta, bg = palette.none, italic = options.italics })
	hl(0, "@text.literal", { fg = palette.green, bg = palette.none })
	hl(0, "@text.strong", { fg = palette.green, bg = palette.none, bold = options.bold })
	hl(0, "@text.todo", { fg = palette.bg, bg = palette.fg })
	hl(0, "@text.uri", { fg = palette.light_red, bg = palette.none, underline = options.underline })
	hl(0, "@type", { fg = palette.orange2, bg = palette.none, italic = options.italics })
	hl(0, "@type.builtin", { fg = palette.green, bg = palette.none })
	hl(0, "@type.builtin.python", { fg = palette.green, bg = palette.none, nocombine = true })
	hl(0, "@type.class", { fg = palette.orange2, bg = palette.none, nocombine = true })
	hl(0, "@type.inheritedClass", { fg = palette.green, bg = palette.none, nocombine = true })
	hl(0, "@type.python", { fg = palette.orange2, bg = palette.none, nocombine = true })
	hl(0, "@type.toml", { fg = palette.green, bg = palette.none, italic = options.italics })
	hl(0, "@type.typescript", { fg = palette.orange2, bg = palette.none, nocombine = true })
	hl(0, "@variable", { fg = palette.parameter, bg = palette.none })
	hl(0, "@variable.builtin", { fg = palette.cyan2, bg = palette.none })
	hl(0, "@variable.builtin.vim", { fg = palette.cyan2, bg = palette.none, italic = options.italics })
	hl(0, "@variable.lua", { link = "Variable" })
	hl(0, "@variable.parameter.bash", { fg = palette.light_orange })
	hl(0, "@variable.parameter.python", { fg = palette.cyan2 })
	hl(0, "@variable.vim", { link = "Variable" })
	-- TypeScript/React specific
	hl(0, "@variable.other.object.tsx", { fg = bg == "light" and palette.black or palette.parameter, bg = palette.none })
	hl(0, "@variable.other.object.typescript", { fg = bg == "light" and palette.black or palette.parameter, bg = palette.none })
	hl(0, "@variable.other.object.jsx", { fg = bg == "light" and palette.black or palette.parameter, bg = palette.none })
	hl(0, "@variable.other.object.javascript", { fg = bg == "light" and palette.black or palette.parameter, bg = palette.none })
	-- Additional React/TSX patterns
	hl(0, "@support.class.component.tsx", { fg = bg == "light" and palette.component_tag or palette.orange, bg = palette.none })
	hl(0, "@support.class.component.jsx", { fg = bg == "light" and palette.component_tag or palette.orange, bg = palette.none })
	hl(0, "@entity.other.attribute-name", { fg = palette.green, bg = palette.none, italic = bg == "light" and false or options.italics })
	hl(0, "@tag.component.tsx", { fg = bg == "light" and palette.component_tag or palette.orange, bg = palette.none, nocombine = true })

	-- Whichkey

	-- Git
	hl(0, "GitSignsAdd", { fg = palette.sign_add, bg = palette.none })
	hl(0, "GitSignsChange", { fg = palette.sign_change, bg = palette.none })
	hl(0, "GitSignsDelete", { fg = palette.sign_delete, bg = palette.none })
	hl(0, "GitSignsChangedelete", { fg = palette.sign_delete, bg = palette.none })
	hl(0, "GitSignsTopdelete", { fg = palette.sign_delete, bg = palette.none })
	hl(0, "GitSignsUntracked", { fg = palette.gray3, bg = palette.none })
	hl(0, "GitSignsCurrentLineBlame", { fg = palette.gray3, bg = palette.none })
	hl(0, "GitGutterAdd", { fg = palette.sign_add, bg = palette.none })
	hl(0, "GitGutterChange", { fg = palette.sign_change, bg = palette.none })
	hl(0, "GitGutterDelete", { fg = palette.sign_delete, bg = palette.none })
	hl(0, "GitGutterChangeDelete", { fg = palette.sign_change, bg = palette.none })

	-- LSP
	hl(0, "DiagnosticError", { link = "Error" })
	hl(
		0,
		"DiagnosticUnderlineError",
		{ fg = palette.none, bg = palette.none, sp = palette.error_red, undercurl = options.undercurl }
	)
	hl(0, "LspInfoBorder", { fg = palette.ui_border, bg = palette.none })
	hl(0, "LspInlayHint", { fg = palette.gray5, bg = palette.blue13 })

	-- SemanticTokens
	hl(0, "@lsp.mod.global.lua", { fg = palette.green, bg = palette.none })
	hl(0, "@lsp.type.decorator", { fg = palette.green, bg = palette.none, nocombine = true })
	hl(0, "@lsp.type.interface", { fg = palette.green, bg = palette.none, nocombine = true })
	hl(0, "@lsp.type.parameter", { fg = palette.parameter, bg = palette.none })
	hl(0, "@lsp.type.property", { fg = palette.cyan5, bg = palette.none })
	hl(0, "@lsp.type.variable", { fg = palette.parameter, bg = palette.none })
	hl(0, "@lsp.type.variable.lua", { link = "Variable" })

	-- Telescope
	hl(0, "TelescopeSelection", { fg = palette.none, bg = palette.visual })
	hl(0, "TelescopeMatching", { fg = palette.nvim_tree_file, bg = palette.none, bold = options.bold })
	hl(0, "TelescopeBorder", { fg = palette.ui_border, bg = palette.none })

	-- NvimTree
	hl(0, "NvimTreeIndentMarker", { fg = palette.nvim_tree_indent_marker, bg = palette.none })
	hl(0, "NvimTreeNormal", { fg = palette.dark_white, bg = palette.none })
	hl(0, "NvimTreeNormalNC", { fg = palette.ui_border, bg = palette.none })
	hl(0, "NvimTreeSpecialFile", { fg = palette.orange, bg = palette.none })
	hl(0, "NvimTreeOpenedFile", { fg = palette.none, bg = palette.none, bold = options.bold })
	hl(0, "NvimTreeImageFile", { fg = palette.nvim_tree_file, bg = palette.none })
	hl(0, "NvimTreeCursorLine", { fg = palette.none, bg = palette.quickfix_line })
	hl(0, "NvimTreeGitStaged", { fg = palette.sign_change, bg = palette.none })
	hl(0, "NvimTreeGitNew", { fg = palette.green, bg = palette.none })
	hl(0, "NvimTreeGitRenamed", { fg = palette.sign_add, bg = palette.none })
	hl(0, "NvimTreeGitDeleted", { fg = palette.sign_delete, bg = palette.none })
	hl(0, "NvimTreeGitDirty", { fg = palette.changed, bg = palette.none })
	hl(0, "NvimTreeRootFolder", { fg = palette.magenta, bg = palette.none })
	hl(
		0,
		"NvimTreeWindowPicker",
		{ fg = palette.orange2, bg = palette.dark, bold = options.bold, italic = options.italics }
	)

	-- Buffer

	-- StatusLine
	hl(0, "StatusLine", { fg = palette.fg, bg = palette.none })
	hl(0, "StatusLineNC", { fg = palette.ui_border, bg = palette.quickfix_line })

	-- WinBar
	hl(0, "WinBarNC", { fg = palette.fg, bg = options.transparent and palette.none or palette.dark })
	hl(0, "WinBar", { fg = palette.fg, bg = palette.none })

	-- IndentBlankline
	hl(0, "IndentBlanklineChar", { fg = palette.indent_guide, bg = palette.none, nocombine = true })
	hl(0, "IndentBlanklineContextChar", { fg = palette.indent_guide_active, bg = palette.none, nocombine = true })
	hl(0, "IndentBlanklineSpaceChar", { fg = palette.indent_guide, bg = palette.none, nocombine = true })
	hl(0, "IndentBlanklineSpaceCharBlankline", { fg = palette.indent_guide, bg = palette.none, nocombine = true })
	hl(0, "IndentBlanklineContextStart", {
		fg = palette.none,
		bg = palette.none,
		sp = palette.indent_guide_active,
		underline = options.underline,
		nocombine = true,
	})

	-- IndentBlankline-v3 (ibl)
	hl(0, "IblIndent", { fg = palette.indent_guide, bg = palette.none, nocombine = true })
	hl(0, "IblScope", { fg = palette.indent_guide_active, bg = palette.none, nocombine = true })
	hl(0, "IblWhitespace", { fg = palette.indent_guide, bg = palette.none, nocombine = true })

	-- Other indent plugins compatibility
	hl(0, "IndentLine", { fg = palette.indent_guide, bg = palette.none, nocombine = true })
	hl(0, "Indent", { fg = palette.indent_guide, bg = palette.none, nocombine = true })
	hl(0, "IndentGuide", { fg = palette.indent_guide, bg = palette.none, nocombine = true })
	hl(0, "IndentGuidesOdd", { fg = palette.indent_guide, bg = palette.none, nocombine = true })
	hl(0, "IndentGuidesEven", { fg = palette.indent_guide, bg = palette.none, nocombine = true })

	-- Illuminate
	hl(0, "IlluminatedWordText", { fg = palette.none, bg = palette.word_highlight })
	hl(0, "IlluminatedWordRead", { fg = palette.none, bg = palette.word_highlight })
	hl(0, "IlluminatedWordWrite", { fg = palette.none, bg = palette.word_highlight_write })

	-- DevIcons
	hl(0, "DevIconLua", { fg = palette.purple2, bg = palette.none })
	hl(0, "DevIconTxt", { fg = palette.green2, bg = palette.none })
	hl(0, "DevIconScheme", { fg = palette.magenta, bg = palette.none })

	-- RainbowDelimiters
	hl(0, "RainbowDelimiterYellow", { fg = palette.yellow, bg = palette.none })
	hl(0, "RainbowDelimiterViolet", { fg = palette.purple3, bg = palette.none })
	hl(0, "RainbowDelimiterBlue", { fg = palette.blue15, bg = palette.none })

	-- Snacks Plugin
	hl(0, "SnacksPicker", { bg = options.transparent and palette.none or palette.bg })
	hl(0, "SnacksPickerTitle", { fg = palette.fg, bg = options.transparent and palette.none or palette.bg })
	hl(0, "SnacksPickerBorder", { fg = palette.none, bg = palette.none })
	hl(0, "SnacksPickerNormal", { fg = palette.fg, bg = options.transparent and palette.none or palette.bg })
	hl(0, "SnacksPickerMatch", { fg = palette.fg })
	hl(0, "SnacksPickerCursor", { fg = palette.bg, bg = palette.bg })
	hl(0, "SnacksPickerPrompt", { fg = palette.fg })
	hl(0, "SnacksPickerDim", { fg = palette.gray3 })
	hl(0, "SnacksInputIcon", { fg = palette.fg, bg = options.transparent and palette.none or palette.bg })
	hl(0, "SnacksIndent", { fg = palette.indent_guide, nocombine = true })
	hl(0, "SnacksIndentChunk", { fg = palette.indent_guide_active, nocombine = true })
	hl(0, "SnacksIndentScope", { fg = palette.indent_guide_active, nocombine = true })
	hl(0, "SnacksPickerListCursorLine", { fg = palette.fg, bg = palette.dark2 })
	hl(0, "SnacksPickerInputBorder", { fg = palette.none, bg = palette.none })
	hl(
		0,
		"SnacksPickerInputTitle",
		{ fg = palette.fg, bg = options.transparent and palette.none or palette.bg }
	)
	hl(
		0,
		"SnacksPickerBoxTitle",
		{ fg = palette.fg, bg = options.transparent and palette.none or palette.bg }
	)
	hl(0, "SnacksPickerSelected", { fg = palette.bg })
	hl(
		0,
		"SnacksPickerPickWinCurrent",
		{ fg = palette.fg, bg = options.transparent and palette.none or palette.bg, bold = options.bold }
	)
	hl(0, "SnacksPickerPickWin", {
		fg = palette.fg,
		bg = options.transparent and palette.none or palette.search_blue,
		bold = options.bold,
	})

	-- BufferLine Plugin
	hl(0, "BufferLineBackground", { fg = palette.none, bg = palette.none })
	hl(0, "BufferLineBuffer", { fg = palette.none, bg = palette.none })
	hl(0, "BufferLineBufferSelected", { bg = palette.none })
	hl(0, "BufferLineBufferVisible", { bg = palette.none })
	hl(0, "BufferLineCloseButton", { bg = palette.none })
	hl(0, "BufferLineCloseButtonSelected", { bg = palette.none })
	hl(0, "BufferLineCloseButtonVisible", { bg = palette.none })
	hl(0, "BufferLineDuplicate", { bg = palette.none })
	hl(0, "BufferLineDuplicateSelected", { bg = palette.none })
	hl(0, "BufferLineDuplicateVisible", { bg = palette.none })
	hl(0, "BufferLineError", { bg = palette.none, sp = palette.none })
	hl(0, "BufferLineErrorDiagnostic", { bg = palette.none, sp = palette.none })
	hl(0, "BufferLineErrorDiagnosticSelected", { bg = palette.none, sp = palette.none })
	hl(0, "BufferLineErrorDiagnosticVisible", { bg = palette.none })
	hl(0, "BufferLineErrorSelected", { bg = palette.none, sp = palette.none })
	hl(0, "BufferLineErrorVisible", { bg = palette.none })
	hl(0, "BufferLineFill", { bg = palette.none })
	hl(0, "BufferLineHint", { sp = palette.none, bg = palette.none })
	hl(0, "BufferLineHintDiagnostic", { sp = palette.none, bg = palette.none })
	hl(0, "BufferLineHintDiagnosticSelected", { bg = palette.none, sp = palette.none })
	hl(0, "BufferLineHintDiagnosticVisible", { bg = palette.none })
	hl(0, "BufferLineHintSelected", { bg = palette.none, sp = palette.none })
	hl(0, "BufferLineHintVisible", { bg = palette.none })
	hl(0, "BufferLineInfo", { sp = palette.none, bg = palette.none })
	hl(0, "BufferLineInfoDiagnostic", { sp = palette.none, bg = palette.none })
	hl(0, "BufferLineInfoDiagnosticSelected", { sp = palette.none, bg = palette.none })
	hl(0, "BufferLineInfoDiagnosticVisible", { bg = palette.none })
	hl(0, "BufferLineInfoSelected", { bg = palette.none, sp = palette.none })
	hl(0, "BufferLineInfoVisible", { bg = palette.none })
	hl(0, "BufferLineIndicatorSelected", { bg = palette.none })
	hl(0, "BufferLineModified", { bg = palette.none })
	hl(0, "BufferLineModifiedSelected", { bg = palette.none })
	hl(0, "BufferLineModifiedVisible", { bg = palette.none })
	hl(0, "BufferLineNumbers", { bg = palette.none })
	hl(0, "BufferLineNumbersSelected", { bg = palette.none })
	hl(0, "BufferLineNumbersVisible", { bg = palette.none })
	hl(0, "BufferLineOffsetSeparator", { bg = palette.none })
	hl(0, "BufferLineSeparator", { bg = palette.none })
	hl(0, "BufferLineSeparatorSelected", { bg = palette.none })
	hl(0, "BufferLineSeparatorVisible", { bg = palette.none })
	hl(0, "BufferLineTab", { bg = palette.none })
	hl(0, "BufferLinePick", { bg = palette.none })
	hl(0, "BufferLinePickSelected", { bg = palette.none })
	hl(0, "BufferLineDevIconLua", { bg = palette.none })
	hl(0, "BufferLineDevIconLuaSelected", { bg = palette.none })
	hl(0, "BufferLineDevIconLuaVisible", { bg = palette.none })
	hl(0, "BufferLineDevIconLuaInactive", { bg = palette.none })
	hl(0, "BufferLinePickVisible", { bg = palette.none })
	hl(0, "BufferLineIndicatorVisible", { bg = palette.none })
	hl(0, "BufferLineTabClose", { bg = palette.none })
	hl(0, "BufferLineTabSelected", { bg = palette.none })
	hl(0, "BufferLineTabSeparator", { bg = palette.none })
	hl(0, "BufferLineTabSeparatorSelected", { bg = palette.none })
	hl(0, "BufferLineTruncMarker", { bg = palette.none })
	hl(0, "BufferLineWarning", { bg = palette.none })
	hl(0, "BufferLineWarningDiagnostic", { bg = palette.none })
	hl(0, "BufferLineWarningDiagnosticSelected", { bg = palette.none })
	hl(0, "BufferLineWarningDiagnosticVisible", { bg = palette.none })
	hl(0, "BufferLineWarningSelected", { bg = palette.none })
	hl(0, "BufferLineWarningVisible", { bg = palette.none })

	-- LSP Saga Plugin
	hl(0, "LspFloatWinNormal", { fg = palette.fg, bg = palette.bg })
	hl(0, "LspFloatWinBorder", { fg = palette.ui_border, bg = palette.none })
	hl(0, "LspSagaHoverBorder", { fg = palette.ui_border, bg = palette.none })
	hl(0, "LspSagaSignatureHelpBorder", { fg = palette.ui_border, bg = palette.none })
	hl(0, "LspSagaCodeActionBorder", { fg = palette.ui_border, bg = palette.none })
	hl(0, "LspSagaDefPreviewBorder", { fg = palette.ui_border, bg = palette.none })
	hl(0, "LspLinesDiagBorder", { fg = palette.ui_border, bg = palette.none })
	hl(0, "LspSagaRenameBorder", { fg = palette.cyan2, bg = palette.none })
	hl(0, "LspSagaBorderTitle", { fg = palette.purple, bg = palette.none, bold = options.bold })
	hl(0, "LSPSagaDiagnosticTruncateLine", { fg = palette.ui_border, bg = palette.none })
	hl(0, "LspSagaDiagnosticBorder", { fg = palette.ui_border, bg = palette.none })
	hl(0, "LspSagaShTruncateLine", { fg = palette.ui_border, bg = palette.none })
	hl(0, "LspSagaDocTruncateLine", { fg = palette.ui_border, bg = palette.none })
	hl(0, "LspSagaLspFinderBorder", { fg = palette.ui_border, bg = palette.none })
	hl(0, "LspSagaFinderSelection", { fg = palette.none, bg = palette.visual })
	hl(0, "LspSagaCodeActionTitle", { fg = palette.blue, bg = palette.none, bold = options.bold })
	hl(0, "LspSagaCodeActionContent", { fg = palette.magenta, bg = palette.none })
	hl(0, "LspSagaLightBulb", { link = "DiagnosticSignHint" })
	hl(0, "CodeActionNumber", { fg = palette.orange, bg = palette.none, bold = options.bold })
	hl(0, "ReferencesCount", { fg = palette.purple, bg = palette.none })
	hl(0, "DefinitionCount", { fg = palette.purple, bg = palette.none })
	hl(0, "DefinitionIcon", { fg = palette.blue, bg = palette.none })
	hl(0, "ReferencesIcon", { fg = palette.blue, bg = palette.none })
	hl(0, "TargetWord", { fg = palette.blue, bg = palette.none, bold = options.bold })

	-- Set the terminal background and foreground colors
	hl(0, "Terminal", { fg = palette.fg, bg = palette.bg })

	-- Terminal colors
	vim.g.terminal_color_0 = palette.dark -- Black
	vim.g.terminal_color_1 = palette.dark_red -- Red
	vim.g.terminal_color_2 = palette.green2 -- Green
	vim.g.terminal_color_3 = palette.yellow -- Yellow
	vim.g.terminal_color_4 = palette.blue -- Blue
	vim.g.terminal_color_5 = palette.purple -- Magenta
	vim.g.terminal_color_6 = palette.cyan2 -- Cyan
	vim.g.terminal_color_7 = palette.dark_white -- White

	-- -- Bright colors
	vim.g.terminal_color_8 = palette.gray3 -- Bright Black
	vim.g.terminal_color_9 = palette.red -- Bright Red
	vim.g.terminal_color_10 = palette.green -- Bright Green
	vim.g.terminal_color_11 = palette.light_yellow -- Bright Yellow
	vim.g.terminal_color_12 = palette.light_blue -- Bright Blue
	vim.g.terminal_color_13 = palette.magenta -- Bright Magenta
	vim.g.terminal_color_14 = palette.cyan5 -- Bright Cyan
	vim.g.terminal_color_15 = palette.white -- Bright White
end

return theme
