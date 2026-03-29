"
" ▄▄▄▄▄▄                 ██
" ██▀▀▀▀█▄               ▀▀
" ██    ██   ▄█████▄   ████      ▄███▄██   ▄████▄
" ██████▀    ▀ ▄▄▄██     ██     ██▀  ▀██  ██▄▄▄▄██
" ██        ▄██▀▀▀██     ██     ██    ██  ██▀▀▀▀▀▀
" ██        ██▄▄▄███  ▄▄▄██▄▄▄  ▀██▄▄███  ▀██▄▄▄▄█
" ▀▀         ▀▀▀▀ ▀▀  ▀▀▀▀▀▀▀▀   ▄▀▀▀ ██    ▀▀▀▀▀
"                                ▀████▀▀
" File:       paige-system.vim
" Maintainer: Leon Henrik Plickat <leonhenrik.plickat@stud.uni-goettingen.de>
" License:    GPLv3

if !has('gui_running') && &t_Co < 256
	finish
endif

highlight clear

if exists("syntax_on")
	syntax reset
endif

set background=light

let g:colors_name = "paige"

if exists("*<SID>PaigeHighlight")
	delf <SID>PaigeHighlight
endif

" Fancy highlight wrapper function, because some highlight groups, like Normal
" apparently do not like being linked. It is not perfect, but it solves the
" problem.
function! <SID>PaigeHighlight(group, type)
	if !empty(a:type[0])
		exec "highlight " . a:group . " ctermbg=" . a:type[0]
	endif
	if !empty(a:type[1])
		exec "highlight " . a:group . " ctermfg=" . a:type[1]
	endif
	if !empty(a:type[2])
		exec "highlight " . a:group . " cterm=" . a:type[2]
	endif
	if !empty(a:type[3])
		exec "highlight " . a:group . " guibg=" . a:type[3]
	endif
	if !empty(a:type[4])
		exec "highlight " . a:group . " guifg=" . a:type[4]
	endif
	if !empty(a:type[5])
		exec "highlight " . a:group . " gui=" . a:type[5]
	endif
endfunction

" Types -> [ ctermbg, ctermfg, cterm, guibg, guifg, gui ]
let s:default_text            = [   '0',   '7',          '', '#ffffff', '#080808',          '' ]
let s:default_text_bold       = [   '0',   '7',      'bold', '#ffffff', '#080808',      'bold' ]
let s:default_text_italic     = [   '0',   '7',    'italic', '#ffffff', '#080808',    'italic' ]
let s:default_text_underline  = [   '0',   '7', 'underline', '#ffffff', '#080808', 'underline' ]

let s:alt_fg_text             = [   '0', '245',          '', '#ffffff', '#8a8a8a',          '' ]
let s:alt_fg_text_none        = [   '0', '245',      'none', '#ffffff', '#8a8a8a',      'none' ]
let s:alt_fg_text_2           = [   '0', '248',          '', '#ffffff', '#a8a8a8',          '' ]

let s:alt_bg_text             = [ '254',   '7',          '', '#e4e4e4', '#080808',          '' ]
let s:alt_bg_text_bold        = [ '254',   '7',      'bold', '#e4e4e4', '#080808',      'bold' ]
let s:alt_bg_text_italic      = [ '254',   '7',    'italic', '#e4e4e4', '#080808',    'italic' ]
let s:alt_bg_text_underline   = [ '254',   '7', 'underline', '#e4e4e4', '#080808', 'underline' ]
let s:alt_bg_text_no_override = [ '254',    '',      'none', '#e4e4e4',        '',      'none' ]
let s:alt_bg_text_none        = [ '254',   '7',      'none', '#e4e4e4', '#080808',      'none' ]
let s:alt_bg_no_fg            = [ '254', '254',      'none', '#e4e4e4', '#e4e4e4',      'none' ]

let s:green_bg_text           = [ '148',   '7',          '', '#afd700', '#080808',          '' ]
let s:red_bg_text             = [ '197',   '7',          '', '#ff005f', '#080808',          '' ]
let s:yellow_bg_text          = [ '220',   '7',          '', '#ffd700', '#080808',          '' ]
let s:blue_bg_text            = [  '39',   '7',          '', '#00afff', '#080808',          '' ]
let s:purple_bg_text_none     = [ '141',   '7',      'none', '#af87ff', '#080808',      'none' ]
let s:alt_purple_bg_text_none = [ '139',   '7',      'none', '#af87af', '#080808',      'none' ]

let s:red_fg_text             = [   '0', '196',          '', '#ffffff', '#ff0000',          '' ]
let s:green_fg_text           = [   '0',  '34',          '', '#ffffff', '#00af00',          '' ]
let s:blue_fg_text            = [   '0',  '21',          '', '#ffffff', '#0000ff',          '' ]
let s:blue_fg_text_underline  = [   '0',  '21', 'underline', '#ffffff', '#0000ff', 'underline' ]

let s:menu_select             = [ '70 ',   '0',      'bold', '#5faf00', '#ffffff',          '' ]
let s:menu_no_select          = [ '240',   '0',          '', '#585858', '#ffffff',          '' ]
let s:menu_scroll_bar         = [ '240', '240',          '', '#585858', '#585858',          '' ]
let s:menu_scroll_bar_thumb   = [ '202', '202',          '', '#585858', '#ff5f00',          '' ]

" UI
call <sid>PaigeHighlight('Normal',           s:default_text)
call <sid>PaigeHighlight('Folded',           s:alt_bg_text)
call <sid>PaigeHighlight('CursorLine',       s:alt_bg_text_no_override)
call <sid>PaigeHighlight('CursorColumn',     s:alt_bg_text_no_override)
call <sid>PaigeHighlight('ColorColumn',      s:alt_bg_text_no_override)
call <sid>PaigeHighlight('SignColumn',       s:alt_bg_text_no_override)
call <sid>PaigeHighlight('Visual',           s:blue_bg_text)
call <sid>PaigeHighlight('VisualNOS',        s:blue_bg_text)
call <sid>PaigeHighlight('VertSplit',        s:alt_bg_text_bold)
call <sid>PaigeHighlight('Pmenu',            s:menu_no_select)
call <sid>PaigeHighlight('PmenuSel',         s:menu_select)
call <sid>PaigeHighlight('PmenuSbar',        s:menu_scroll_bar)
call <sid>PaigeHighlight('PmenuThumb',       s:menu_scroll_bar_thumb)
call <sid>PaigeHighlight('WildMenu',         s:menu_select)
call <sid>PaigeHighlight('ModeMsg',          s:alt_fg_text_none)
call <sid>PaigeHighlight('StatusLine',       s:alt_bg_text_bold)
call <sid>PaigeHighlight('StatusLineNC',     s:alt_bg_text_none)
call <sid>PaigeHighlight('StatusLineTerm',   s:alt_bg_text_bold)
call <sid>PaigeHighlight('StatusLineTermNC', s:alt_bg_text_none)
call <sid>PaigeHighlight('Search',           s:purple_bg_text_none)
call <sid>PaigeHighlight('IncSearch',        s:alt_purple_bg_text_none)
call <sid>PaigeHighlight('TabLineFill',      s:alt_bg_no_fg)
call <sid>PaigeHighlight('TabLineSel',       s:menu_select)
call <sid>PaigeHighlight('TabLine',          s:alt_bg_text_none)
call <sid>PaigeHighlight('EndOfBuffer',      s:alt_fg_text)
call <sid>PaigeHighlight('LineNr',           s:alt_bg_text)
call <sid>PaigeHighlight('CursorLineNr',     s:alt_bg_text)
call <sid>PaigeHighlight('MatchParen',       s:yellow_bg_text)
call <sid>PaigeHighlight('Conceal',          s:default_text)
call <sid>PaigeHighlight('Error',            s:red_bg_text)
call <sid>PaigeHighlight('ErrorMsg',         s:red_bg_text)
call <sid>PaigeHighlight('WarningMsg',       s:yellow_bg_text)

" Diff
call <sid>PaigeHighlight('DiffChange',  s:yellow_bg_text)
call <sid>PaigeHighlight('DiffAdd',     s:green_bg_text)
call <sid>PaigeHighlight('DiffDelete',  s:red_bg_text)
call <sid>PaigeHighlight('diffAdded',   s:green_fg_text)
call <sid>PaigeHighlight('diffRemoved', s:red_fg_text)
call <sid>PaigeHighlight('diffLine',    s:blue_fg_text)

" Spell
call <sid>PaigeHighlight('SpellBad',   s:red_bg_text)
call <sid>PaigeHighlight('SpellCap',   s:yellow_bg_text)
call <sid>PaigeHighlight('SpellLocal', s:yellow_bg_text)
call <sid>PaigeHighlight('SpellRare',  s:yellow_bg_text)

" netrw
call <sid>PaigeHighlight('netrwDir',      s:blue_fg_text)
call <sid>PaigeHighlight('netrwClassify', s:default_text_bold)
call <sid>PaigeHighlight('netrwExe',      s:green_fg_text)

" quickfix
call <sid>PaigeHighlight('qfLineNr',   s:default_text_bold)
call <sid>PaigeHighlight('qfFilename', s:default_text_bold)

" Generic Syntax
call <sid>PaigeHighlight('Todo',        s:yellow_bg_text)
call <sid>PaigeHighlight('Comment',     s:alt_fg_text_2)
call <sid>PaigeHighlight('Title',       s:alt_bg_text_bold)
call <sid>PaigeHighlight('PreProc',     s:default_text_bold)
call <sid>PaigeHighlight('Identifier',  s:default_text_bold)
call <sid>PaigeHighlight('Statement',   s:default_text_bold)
call <sid>PaigeHighlight('Special',     s:default_text_bold)
call <sid>PaigeHighlight('Type',        s:default_text_bold)
call <sid>PaigeHighlight('NonText',     s:alt_fg_text_2) " NonText includes listchars: eol, extends, prescedes
call <sid>PaigeHighlight('SpecialKey',  s:alt_fg_text_2) " SpecialKey includes listchars: tabs, spaces, nbsp
call <sid>PaigeHighlight('Conditional', s:default_text_bold)
call <sid>PaigeHighlight('Repeat',      s:default_text_bold)
call <sid>PaigeHighlight('Logical',     s:default_text_bold)
call <sid>PaigeHighlight('Compare',     s:default_text_bold)
call <sid>PaigeHighlight('Label',       s:default_text_underline)
call <sid>PaigeHighlight('Constant',    s:default_text)
call <sid>PaigeHighlight('Pointer',     s:default_text)
call <sid>PaigeHighlight('Delimiter',   s:default_text)

" HTML
call <sid>PaigeHighlight('htmlTag',            s:default_text_bold)
call <sid>PaigeHighlight('htmlEndTag',         s:default_text_bold)
call <sid>PaigeHighlight('htmlTagName',        s:default_text_bold)
call <sid>PaigeHighlight('htmlSpecialTagName', s:default_text_bold)
call <sid>PaigeHighlight('htmlComment',        s:alt_fg_text_2)
call <sid>PaigeHighlight('htmlCommentPart',    s:alt_fg_text_2)
call <sid>PaigeHighlight('htmlArg',            s:default_text_bold)
call <sid>PaigeHighlight('htmlString',         s:default_text)
call <sid>PaigeHighlight('htmlLink',           s:blue_fg_text_underline)
call <sid>PaigeHighlight('htmlBold',           s:default_text_bold)
call <sid>PaigeHighlight('htmlItalic',         s:default_text_italic)

" CSS
call <sid>PaigeHighlight('cssBraces',         s:default_text)
call <sid>PaigeHighlight('cssNoise',          s:default_text)
call <sid>PaigeHighlight('cssBoxProp',        s:default_text_bold)
call <sid>PaigeHighlight('cssBoxAttr',        s:default_text)
call <sid>PaigeHighlight('cssTextProp',       s:default_text_bold)
call <sid>PaigeHighlight('cssTextAttr',       s:default_text)
call <sid>PaigeHighlight('cssValueLength',    s:default_text)
call <sid>PaigeHighlight('cssValueNumber',    s:default_text)
call <sid>PaigeHighlight('cssUnitDecorators', s:default_text)
call <sid>PaigeHighlight('cssAtRule',         s:default_text_bold)
call <sid>PaigeHighlight('cssAtRuleLogical',  s:default_text_bold)
call <sid>PaigeHighlight('cssMediaType',      s:default_text_bold)
call <sid>PaigeHighlight('cssMediaProp',      s:default_text_bold)

" meson
call <sid>PaigeHighlight('mesonString', s:default_text)

" Vim
call <sid>PaigeHighlight('vimHiGroup', s:default_text)

" C
call <sid>PaigeHighlight('cErrInParen', s:default_text)

" Scheme
call <sid>PaigeHighlight('schemeSyntax',      s:default_text_bold)
call <sid>PaigeHighlight('schemeFunction',    s:default_text_bold)
call <sid>PaigeHighlight('schemeParentheses', s:default_text)
call <sid>PaigeHighlight('schemeNumber',      s:default_text)
call <sid>PaigeHighlight('schemeString',      s:default_text)

" (La)Tex / vimtex
call <sid>PaigeHighlight('texComment',      s:alt_fg_text_2)
call <sid>PaigeHighlight('texSection',      s:default_text_bold)
call <sid>PaigeHighlight('texParen',        s:default_text)
call <sid>PaigeHighlight('texCmdArgs',      s:default_text)
call <sid>PaigeHighlight('texBeginEnd',     s:default_text)
call <sid>PaigeHighlight('texBeginEndName', s:default_text_bold)

" markdown
call <sid>PaigeHighlight('markdownH1',          s:alt_bg_text_bold)
call <sid>PaigeHighlight('markdownH1Delimiter', s:alt_bg_text_bold)
call <sid>PaigeHighlight('markdownH2',          s:alt_bg_text_bold)
call <sid>PaigeHighlight('markdownH2Delimiter', s:alt_bg_text_bold)
call <sid>PaigeHighlight('markdownH3',          s:alt_bg_text_bold)
call <sid>PaigeHighlight('markdownH3Delimiter', s:alt_bg_text_bold)
call <sid>PaigeHighlight('markdownH4',          s:alt_bg_text_bold)
call <sid>PaigeHighlight('markdownH4Delimiter', s:alt_bg_text_bold)
call <sid>PaigeHighlight('markdownH5',          s:alt_bg_text_bold)
call <sid>PaigeHighlight('markdownH5Delimiter', s:alt_bg_text_bold)
call <sid>PaigeHighlight('markdownH6',          s:alt_bg_text_bold)
call <sid>PaigeHighlight('markdownH6Delimiter', s:alt_bg_text_bold)
call <sid>PaigeHighlight('markdownListMarker',  s:default_text_bold)
call <sid>PaigeHighlight('markdownError',       s:default_text)
call <sid>PaigeHighlight('markdownCodeBlock',   s:green_fg_text)

" git commit
call <sid>PaigeHighlight('gitcommitSummary',   s:alt_bg_text_bold)
call <sid>PaigeHighlight('gitcommitFirstLine', s:alt_bg_text_bold)
call <sid>PaigeHighlight('gitcommitBlank',     s:red_bg_text)
call <sid>PaigeHighlight('gitcommitComment',   s:alt_fg_text_2)
call <sid>PaigeHighlight('gitcommitHeader',    s:default_text_bold)

" .desktop files
call <sid>PaigeHighlight('dtGroup',      s:alt_bg_text_bold)
call <sid>PaigeHighlight('dtTypeKey',    s:default_text_bold)
call <sid>PaigeHighlight('dtExecKey',    s:default_text_bold)
call <sid>PaigeHighlight('dtLocaleKey',  s:default_text_bold)
call <sid>PaigeHighlight('dtBooleanKey', s:default_text_bold)
call <sid>PaigeHighlight('dtStringKey',  s:default_text_bold)
call <sid>PaigeHighlight('dtDelim',      s:alt_fg_text_2)

" scdoc
call <sid>PaigeHighlight('scdocHeader',        s:alt_bg_text_bold)
call <sid>PaigeHighlight('scdocPreambleName',  s:alt_bg_text_bold)
call <sid>PaigeHighlight('scdocPreambleExtra', s:alt_bg_text)
call <sid>PaigeHighlight('scdocBold',          s:default_text_bold)

" man
call <sid>PaigeHighlight('manHeader',         s:alt_bg_text_bold)
call <sid>PaigeHighlight('manSectionHeading', s:alt_bg_text_bold)
call <sid>PaigeHighlight('manReference',      s:default_text_bold)
call <sid>PaigeHighlight('manOptionDesc',     s:default_text_bold)
call <sid>PaigeHighlight('manLongOptionDesc', s:default_text_bold)

" ALE
call <sid>PaigeHighlight('ALEErrorSign',   s:red_bg_text)
call <sid>PaigeHighlight('ALEWarningSign', s:green_fg_text)
