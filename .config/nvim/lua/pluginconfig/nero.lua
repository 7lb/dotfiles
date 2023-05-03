local lush = require("lush")
local hsl = lush.hsl

local Palette = {
	-- Shades of black
	Black = hsl("#000000"),
	Ink = hsl("#191919"),
	Eerie = hsl("#1e1e1e"),
	Charcoal = hsl("#202020"),

	-- Sades of gray
	Soot = hsl("#444444"),
	Ash = hsl("#555555"),
	Cement = hsl("#727272"),

	-- Shades of white
	RecycledPaper = hsl("#afafaf"),
	Gainsboro = hsl("#d0d0d0"),
	Alabaster = hsl("#e1e1e1"),

	-- Colors
	Orange = hsl("#cea033"),
	Lime = hsl("#9efd38"),
	Mauve = hsl("#91778c"),
	Sky = hsl("#bad7ff"),
	PastelCyan = hsl("#88afa2"),
	VisibleRed = hsl("#cc573d"),
	VisibleYellow = hsl("#c1cc66"),
	IcyGray = hsl("#91afc1"),
	Indigo = hsl("#9f85b2"),
	Pink = hsl("#dda0dd"),
	BoldGreen = hsl("#6ac462"),

	Blood = hsl("#351d1d"),
	DirtyCrimson = hsl("#984936"),

	DarkForest = hsl("#212513"),
	LightForest = hsl("#586935"),

	DeepOcean = hsl("#1b1f27"),
	ShallowOcean = hsl("#51657b"),
}

local Colors = {
	Text = Palette.Alabaster,
	LowPrioText = Palette.Cement,
	DimText = Palette.Ash,
	DimmerText = Palette.Soot,

	TextDark = Palette.Eerie,

	Bg = Palette.Black,
	MediumBg = Palette.Ink,
	LightBg = Palette.Charcoal,
	LighterBg = Palette.Cement,
	HighlightBg = Palette.RecycledPaper,

	Standout = Palette.Lime,

	CursorFg = Palette.Gainsboro,
	CursorBg = Palette.Ink,

	Hint = Palette.Mauve,
	Info = Palette.PastelCyan,
	Warn = Palette.Orange,
	Error = Palette.DirtyCrimson,
	Success = Palette.BoldGreen,

	GitAddFg = Palette.LightForest,
	GitAddBg = Palette.DarkForest,
	GitChangeFg = Palette.ShallowOcean,
	GitChangeBg = Palette.DeepOcean,
	GitDeleteFg = Palette.DirtyCrimson,
	GitDeleteBg = Palette.Blood,

	Directory = Palette.Sky,

	Hardcoded = Palette.VisibleYellow,
	Function = Palette.IcyGray,
	Block = Palette.Indigo,
	Ternary = Palette.VisibleRed,
	Special = Palette.Pink,

	Todo = "#ff00ff",
	Test = "#ffff00",
}

local theme = lush(function(injectable_functions)
	local sym = injectable_functions.sym
	return {
		-- Syntax
		Comment							{ fg = Colors.DimText },

		Constant						{ fg = Colors.Hardcoded },
		Boolean							{ fg = Colors.Hardcoded },
		Character						{ fg = Colors.Hardcoded },
		Float							{ fg = Colors.Hardcoded },
		Number							{ fg = Colors.Hardcoded },
		String							{ fg = Colors.Hardcoded },

		Identifier						{ fg = Colors.Text },
		Function						{ fg = Colors.Function },

		Statement						{ fg = Colors.Function },
		Conditional						{ fg = Colors.Block },
		Exception						{ fg = Colors.Block },
		Keyword							{ fg = Colors.Text },
		Label							{ fg = Colors.Hardcoded },
		Operator						{ fg = Colors.LowPrioText },
		Repeat							{ fg = Colors.Block },

		PreProc							{ fg = Colors.LowPrioText },
		Define							{ fg = Colors.LowPrioText },
		Include							{ fg = Colors.LowPrioText },
		Macro							{ fg = Colors.LowPrioText },
		PreCondit						{ fg = Colors.LowPrioText },

		Type							{ fg = Colors.Text, gui = "bold" },
		StorageClass					{ fg = Colors.Text },
		Structure						{ Type },
		Typedef							{ fg = Colors.Todo },

		Special							{ fg = Colors.Special },
		Debug							{ fg = Colors.Todo },
		Delimiter						{ fg = Colors.LowPrioText },
		SpecialChar						{ fg = Colors.Special, gui = "bold" },
		SpecialComment					{ fg = Colors.Special },
		Tag								{ fg = Colors.Text, gui = "bold" },

		Bold							{ gui = "bold" },
		Ignore							{ fg = Colors.DimText },
		Italic							{ gui = "italic" },
		Underlined						{ gui = "underline" },

		Error							{ fg = Colors.Error },
		Todo							{ fg = Colors.Todo },

		-- Diff
		DiffAdd							{ fg = Colors.GitAddFg, bg = Colors.GitAddBg },
		DiffAdded						{ DiffAdd },
		DiffChange						{ fg = Colors.GitChangeFg, bg = Colors.GitChangeBg },
		DiffDelete						{ fg = Colors.GitDeleteFg, bg = Colors.GitDeleteBg },
		DiffRemoved						{ DiffDelete },
		GitCommitOverflow				{ DiffDelete },
		DiffText						{ DiffChange, gui = "bold" },
		
		-- Special
		Directory						{ fg = Colors.Directory },

		-- Editor
		ColorColumn						{ bg = Colors.MediumBg },
		Conceal							{ fg = Colors.DimmerText },
		--CurSearch						{ },
		Cursor							{ fg = Colors.CursorFg, bg = Colors.CursorBg },
		lCursor							{ Cursor },
		CursorIM						{ Cursor },
		CursorColumn					{ bg = Colors.MediumBg },
		CursorLine						{ CursorColumn },
		EndOfBuffer						{ fg = Colors.DimText },
		TermCursor						{ Cursor },
		TermCursorNC					{ Cursor },
		ErrorMsg						{ fg = Colors.Error, bg = Colors.Bg, gui = "bold" },
		WinSeparator					{ fg = Colors.LighterBg, bg = Colors.Bg },
		Folded							{ fg = Colors.DimmerText },
		FoldColumn						{ Folded },
		SignColumn						{ bg = Colors.Bg },
		IncSearch						{ fg = Colors.TextDark, bg = Colors.Standout },
		Substitute						{ IncSearch },
		LineNr							{ fg = Colors.DimText },
		--LineNrAbove					{ },
		--LineNrBelow					{ },
		CursorLineNr					{ fg = Colors.Text, gui = "bold" },
		--CursorLineSign				{ },
		--CursorLineFold				{ },
		MatchParen						{ gui = "bold,underline" },
		ModeMsg							{ fg = Colors.Text, bg = Colors.Bg, gui = "bold" },
		MsgArea							{ fg = Colors.Text, bg = Colors.Bg },
		MsgSeparator					{ fg = Colors.Text, bg = Colors.Bg },
		MoreMsg							{ fg = Colors.Info },
		NonText							{ fg = Colors.DimmerText },
		Normal							{ fg = Colors.Text, bg = Colors.Bg },
		NormalFloat						{ fg = Colors.Text, bg = Colors.MediumBg },
		NormalNC						{ Normal },
		PMenu							{ bg = Colors.LightBg },
		PMenuSel						{ PMenu, gui = "bold" },
		PMenuSbar						{ bg = Colors.MediumBg },
		PMenuThumb						{ bg = Colors.HighlightBg },
		Question						{ fg = Colors.Info },
		QuickFixLine					{ bg = Colors.LightBg },
		Search							{ fg = Colors.Standout },
		SpecialKey						{ fg = Colors.Special },
		SpellBad						{ sp = Colors.Error, gui = "undercurl" },
		SpellCap						{ sp = Colors.Warn, gui = "undercurl" },
		SpellLocal						{ sp = Colors.Info, gui = "undercurl" },
		SpellRare						{ sp = Colors.Hint, gui = "undercurl" },
		StatusLine						{ fg = Colors.Text, bg = Colors.MediumBg },
		StatusLineNC					{ fg = Colors.DimText, bg = Colors.MediumBg },
		TabLine							{ fg = Colors.DimText, bg = Colors.MediumBg },
		TabLineFill						{ fg = Colors.Text, bg = Colors.MediumBg },
		TabLineSel						{ fg = Colors.Text, bg = Colors.MediumBg },
		Title							{ fg = Colors.Text, gui = "bold" },
		Visual							{ bg = Colors.LightBg },
		VisualNOS						{ bg = Colors.LightBg },
		WarningMsg						{ fg = Colors.Warn },
		Whitespace						{ NonText },
		WildMenu						{ fg = Colors.Text, bg = Colors.MediumBg },
		--WinBar						{ },
		--WinBarNC						{ },
		HealthError						{ fg = Colors.Error },
		HealthSuccess					{ fg = Colors.Success },
		HealthWarning					{ fg = Colors.Warn },

		-- Lsp
		DiagnosticHint					{ fg = Colors.Hint },
		DiagnosticVirtualTextHint		{ fg = Colors.Hint },
		DiagnosticUnderlineHint			{ fg = Colors.Hint },
		DiagnosticInfo					{ fg = Colors.Info },
		DiagnosticVirtualTextInfo		{ fg = Colors.Info },
		DiagnosticUnderlineInfo			{ fg = Colors.Info },
		DiagnosticWarn					{ fg = Colors.Warn },
		DiagnosticVirtualTextWarn		{ fg = Colors.Warn },
		DiagnosticUnderlineWarn			{ fg = Colors.Warn },
		DiagnosticError					{ fg = Colors.Error },
		DiagnosticVirtualTextError		{ fg = Colors.Error },
		DiagnosticUnderlineError		{ fg = Colors.Error },

		-- Cmp
		CmpItemAbbrDeprecated			{ gui = "strikethrough" },
		CmpItemAbbrMatch				{ IncSearch },
		CmpItemAbbrMatchFuzzy			{ CmpItemAbbrMatch },
		CmpItemKind						{ fg = Colors.Todo },
		CmpItemKindClass				{ Type },
		CmpItemKindColor				{ fg = Colors.Todo },
		CmpItemKindConstant				{ Constant },
		CmpItemKindConstructor			{ Function },
		CmpItemKindCopilot				{ fg = Colors.Todo },
		CmpItemKindEnum					{ Type },
		CmpItemKindEnumMember			{ Constant },
		CmpItemKindEvent				{ fg = Colors.Todo },
		CmpItemKindField				{ Identifier },
		CmpItemKindFile					{ fg = Colors.Directory },
		CmpItemKindFolder				{ fg = Colors.Directory },
		CmpItemKindFunction				{ Function },
		CmpItemKindInterface			{ Type },
		CmpItemKindKeyword				{ Keyword },
		CmpItemKindMethod				{ Function },
		CmpItemKindModule				{ fg = Colors.Directory },
		CmpItemKindOperator				{ Operator },
		CmpItemKindProperty				{ Identifier },
		CmpItemKindReference			{ fg = Colors.Todo },
		CmpItemKindSnippet				{ fg = Colors.Text },
		CmpItemKindStruct				{ Type },
		CmpItemKindText					{ fg = Colors.Text },
		CmpItemKindTypeParameter		{ Identifier },
		CmpItemKindUnit					{ fg = Colors.Todo },
		CmpItemKindValue				{ Constant },
		CmpItemKindVariable				{ Identifier },
		
		-- Treesitter
		sym("@attribute")				{ fg = Colors.LowPrioText },
		--sym("@boolean")				{ fg = Colors.Red },
		--sym("@comment")				{ Comment },
		--sym("@conditional")			{ fg = Colors.GrayBlue },
		sym("@conditional.ternary")		{ fg = Colors.Ternary, gui = "bold" },
		--sym("@constant")				{ fg = Colors.Text },
		--sym("@constant.builtin")		{ fg = Colors.Text },
		sym("@constructor")				{ Function },
		--sym("@define")				{ fg = Colors.Magenta },
		--sym("@field")					{ fg = Colors.Text },
		--sym("@function")				{ Function },
		--sym("@function.builtin")		{ Function },
		--sym("@function.call")			{ Function },
		sym("@function.macro")			{ Special },
		--sym("@include")				{ fg = Colors.Red },
		--sym("@keyword")				{ fg = Colors.GrayBlue },
		--sym("@label")					{ fg = Colors.Text },
		--sym("@method")				{ fg = Colors.Cyan },
		--sym("@namespace")				{ fg = Colors.Text },
		--sym("@number")				{ fg = Colors.Red },
		--sym("@operator")				{ fg = Colors.Text },
		--sym("@parameter")				{ fg = Colors.Text },
		--sym("@preproc")				{ fg = Colors.Magenta },
		--sym("@property")				{ fg = Colors.Text },
		--sym("@punctuation")			{ fg = Colors.Text },
		--sym("@punctuation.special")	{ fg = Colors.MediumGray },
		--sym("@punctuation.bracket")	{ fg = Colors.LowPrioText },
		--sym("@repeat")				{ fg = Colors.GrayBlue },
		--sym("@storageclass")			{ fg = Colors.Green },
		--sym("@string")				{ fg = Colors.MediumGrayBlue },
		--sym("@text")					{ fg = Colors.Text },
		--sym("@type")					{ Type },
		sym("@type.qualifier")			{ Type, gui = "nocombine" },
		sym("@type.definition")			{ Type },
		--sym("@variable")				{ fg = Colors.Text },
	}
end)

return theme
