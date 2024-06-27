highlight clear
if exists('syntax on')
  syntax reset
endif

" Colorscheme name
let g:colors_name = 'lettepa-dark'
set background=dark

" Palette {{{

let s:lettepa = {}

" Full palette
let s:lettepa.kurenai = ['#CB1B45', 100]
let s:lettepa.nakabeni = ['#ED5A65', 167]
let s:lettepa.aomidori = ['#00AA90', 36]
let s:lettepa.braomidori = ['#47D2BC', 79]
let s:lettepa.ruri = ['#005CAF', 25]
let s:lettepa.brruri = ['#37B4FD', 39]
let s:lettepa.chigusa = ['#3A8FB7', 67]
let s:lettepa.brchigusa = ['#71DCEA', 45]
let s:lettepa.tsutsuji = ['#E03C8A', 198]
let s:lettepa.brtsutsuji = ['#FD67B8', 205]
let s:lettepa.kohaku = ['#CA7A2C', 172]
let s:lettepa.tamako = ['#F9BF45', 221]
let s:lettepa.black = ['#08192D', 234]
let s:lettepa.brblack = ['#24384F', 237]
let s:lettepa.dimgrey = ['#5C7186', 242]
let s:lettepa.grey = ['#728A9E', 245]
let s:lettepa.brgrey = ['#83A2B7', 247]
let s:lettepa.white = ['#CCE0EC', 253]
let s:lettepa.brwhite = ['#DFF3FF', 255]

" Dark palette
let s:red = s:lettepa.nakabeni
let s:green = s:lettepa.braomidori
let s:blue = s:lettepa.brruri
let s:cyan = s:lettepa.brchigusa
let s:magenta = s:lettepa.brtsutsuji
let s:yellow = s:lettepa.tamako
let s:bg = s:lettepa.black
let s:bg0 = s:lettepa.brblack
let s:fg0 = s:lettepa.brgrey
let s:fg = s:lettepa.white
let s:red0 = s:lettepa.kurenai
let s:green0 = s:lettepa.aomidori
let s:blue0 = s:lettepa.ruri
let s:cyan0 = s:lettepa.chigusa
let s:magenta0 = s:lettepa.tsutsuji
let s:yellow0 = s:lettepa.kohaku
let s:ignore = s:lettepa.grey
let s:none = ['NONE', 'NONE']

" }}}

" Helpers {{{
function! s:h(group, fg, ...) " bg, attr_list
  let l:fg = copy(a:fg)
  let l:bg = get(a:, 1, s:none)

  let l:attr_list = filter(get(a:, 2, ['NONE']), 'type(v:val) == 1')
  let l:attrs = len(l:attr_list) > 0 ? join(l:attr_list, ',') : 'NONE'

  let l:hl_string = [
  \ 'highlight', a:group,
  \ 'guifg=' . l:fg[0], 'ctermfg=', l:fg[1],
  \ 'guibg=' . l:bg[0], 'ctermbg=', l:bg[1],
  \ 'gui=' . l:attrs, 'cterm=' . l:attrs, 'term=' . l:attrs
  \]

  execute join(l:hl_string, ' ')
endfunction
" }}}

" Basic highlighting {{{

call s:h('Normal', s:fg, s:bg)

call s:h('Comment', s:yellow)

call s:h('Constant', s:blue)
" String    links to Constant
call s:h('Character', s:red)
" Number    links to Constant
" Boolean   links to Constant
" Float     links to Number

call s:h('Identifier', s:green)
" Function links to Identifier

call s:h('Statement', s:magenta)
" Conditional links to Statement
" Repeat      links to Statement
" Label       links to Statement
" Operator    links to Statement
" Keyword     links to Statement
" Exception   links to Statement

call s:h('PreProc', s:magenta)
" Include   links to PreProc
" Define    links to PreProc
" Macro     links to PreProc
" PreCondit links to PreProc

call s:h('Type', s:cyan)
call s:h('StorageClass', s:magenta)
" Structure    links to Type
" Typedef      links to Type

call s:h('Special', s:green)
" Tag            links to Special
" SpecialChar    links to Special
call s:h('Delimiter', s:ignore)
" SpecialComment links to Special
" Debug          links to Special

call s:h('Underlined', s:red)

call s:h('Ignore', s:ignore)

call s:h('Error', s:red, s:none, ['bold'])

call s:h('Todo', s:green, s:bg0)

" }}}

" Extended highlighting {{{

call s:h('SpecialKey', s:ignore)

call s:h('NonText', s:ignore)
" EndOfBuffer links to NonText

call s:h('StatusLine', s:fg, s:bg0)
call s:h('StatusLineNC', s:fg0, s:bg0)
call s:h('StatusLineTerm', s:bg, s:fg)
call s:h('StatusLineTermNC', s:bg, s:fg0)

call s:h('Visual', s:none, s:bg0, ['bold'])
call s:h('VisualNOS', s:none, s:none, ['bold', 'reverse'])

call s:h('Directory', s:blue)

call s:h('ErrorMsg', s:red, s:none, ['bold'])
call s:h('WarningMsg', s:yellow, s:none, ['bold'])

call s:h('IncSearch', s:none, s:none, ['reverse'])
call s:h('Search', s:fg, s:cyan0)
call s:h('CurSearch', s:none, s:none, ['reverse'])
" QuickFixLine links to Search

call s:h('MoreMsg', s:fg, s:none, ['bold'])
call s:h('ModeMsg', s:fg, s:none, ['bold'])

call s:h('LineNr', s:ignore)
" LineNrAbove cleared
" LineNrBelow cleared

call s:h('CursorLineNr', s:fg)
call s:h('SignColumn', s:magenta)
" CursorLineSign links to SignColumn
call s:h('Folded', s:blue, s:bg0)
call s:h('FoldColumn', s:ignore)
" CursorLineFold xxx links to FoldColumn

call s:h('Question', s:green)

call s:h('VertSplit', s:ignore)

call s:h('Title', s:green)

call s:h('WildMenu', s:bg, s:fg)

call s:h('Conceal', s:ignore)

call s:h('DiffAdd', s:green, s:bg0)
call s:h('DiffChange', s:yellow, s:bg0)
call s:h('DiffDelete', s:red, s:bg0)
call s:h('DiffText', s:red, s:bg0, ['bold'])

call s:h('ColorColumn', s:none, s:ignore)

call s:h('SpellBad', s:fg, s:red0, ['underline'])
call s:h('SpellCap', s:fg, s:blue0, ['underline'])
call s:h('SpellLocal', s:fg, s:cyan0, ['underline'])
call s:h('SpellRare', s:fg, s:magenta0, ['underline'])

call s:h('Pmenu', s:fg, s:bg0)
call s:h('PmenuSel', s:bg, s:fg)
" PmenuKind     links to Pmenu
" PmenuKindSel  links to PmenuSel
" PmenuExtra    links to Pmenu
" PmenuExtraSel links to PmenuSel
call s:h('PmenuSbar', s:none, s:ignore)
call s:h('PmenuThumb', s:none, s:fg)

" Cursor  guifg=bg guibg=fg
" lCursor guifg=bg guibg=fg

call s:h('CursorColumn', s:none, s:bg0)
call s:h('CursorLine', s:none, s:bg0)

call s:h('TabLine', s:fg0, s:bg0)
call s:h('TabLineSel', s:fg, s:bg)
call s:h('TabLineFill', s:none, s:bg0)

call s:h('MatchParen', s:bg, s:fg, ['bold', 'reverse'])

call s:h('ToolbarLine', s:none, s:bg0)
call s:h('ToolbarButton', s:bg, s:fg, ['bold'])

" Terminal cleared
" MessageWindow cleared
" PopupNotification cleared
" debugBreakpoint cleared
" debugPC  cleared
" CursorIM cleared

" }}}

" vim:et:tw=80:cc=+1:ts=2:sts=2:sw=2:fdl=0:fdm=marker:norl:
