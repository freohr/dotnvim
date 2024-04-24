if exists('b:current_syntax') | finish|  endif
syntax match TableBold	/\*\*[^\*]\+\*\*/	contains=TableLink
syntax match TableBold	/__[^_]\+__/	contains=TableLink
syntax match TableItalic	/\*[^\*]\+\*/	contains=TableLink
syntax match TableItalic	/_[^_]\+_/	contains=TableLink

syntax match TableLinkOptionSingle	/:\(s\|e\|x\|cl\)/	contained
syntax match TableLinkOptionComplex	/:\(d\|f\|c\|j\)[^:\]]\+/	contained
syntax match TableLink	/\[\[.\{-1,}]]/	contains=TableLinkOption.*

let b:current_syntax = 'table'

hi def link TableItalic	Green
hi def link TableBold		Blue
hi def link TableLink		Yellow
hi def link TableLinkOptionSingle	Orange
hi def link TableLinkOptionComplex	Red

set tabstop=4
