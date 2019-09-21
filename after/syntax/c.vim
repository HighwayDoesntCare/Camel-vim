syn match    cCustomParen    "?=(" contains=cParen,cCppParen
syn match    cCustomFunc     "\w\+\s*(\@=" contains=cCustomParen
hi hicCustomFunc guifg=NONE guibg=NONE guisp=NONE gui=bold ctermfg=lightyellow ctermbg=NONE cterm=bold
hi def link cCustomFunc hicCustomFunc

hi hicCustomStructName guifg=NONE guibg=NONE guisp=NONE gui=bold ctermfg=lightgreen ctermbg=NONE cterm=bold
syn match cCustomStructName "\(^struct\s*\)\@<=\w\+"
hi def link cCustomStructName hicCustomStructName
