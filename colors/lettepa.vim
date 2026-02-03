highlight clear
if exists('syntax on')
  syntax reset
endif

" Colorscheme name
let g:colors_name = 'lettepa'

" Detect 'background'
let s:is_dark=(&background == 'dark')
if s:is_dark
    set background=dark
else
    set background=light
endif

" Palette {{{

let s:lettepa = {}

" Full palette
let s:lettepa.anlan = ['#101f30', 234]      " base3
let s:lettepa.huilan = ['#21373d', 236]     " base2
let s:lettepa.waguanhui = ['#47484c', 239]  " base1
let s:lettepa.yuweihui = ['#5e616d', 241]   " base0
let s:lettepa.xinghui = ['#b2bbbe', 250]    " base00
let s:lettepa.dalishihui = ['#c4cbcf', 252] " base01
let s:lettepa.zhenzhuhui = ['#e4dfd7', 254] " base02
let s:lettepa.hanbaiyu = ['#f8f4ed', 231]   " base03
let s:lettepa.haitanghong = ['#f03752', 167]
let s:lettepa.fengyehong = ['#c21f30', 160]
let s:lettepa.shilv = ['#57c3c2', 42]
let s:lettepa.meidielv = ['#12aa9c', 36]
let s:lettepa.jianshilan = ['#66a9c9', 39]
let s:lettepa.dianqing = ['#1661ab', 25]
let s:lettepa.pubulan = ['#51c4d3', 75]
let s:lettepa.cuilan = ['#1e9eb3', 32]
let s:lettepa.fengxianhuahong = ['#ea7293', 211]
let s:lettepa.zijinghong = ['#ee2c79', 198]
let s:lettepa.mihuang = ['#fbb957', 215]
let s:lettepa.canghuang = ['#806332', 94]

" Palette based on 'background'
if s:is_dark
    " Main colors: 3, 2, 0, 01, 02
    let s:bg = s:lettepa.anlan
    let s:bg0 = s:lettepa.huilan
    let s:fg0 = s:lettepa.dalishihui
    let s:fg = s:lettepa.zhenzhuhui
    " Primary accent colors
    let s:red = s:lettepa.haitanghong
    let s:green = s:lettepa.shilv
    let s:blue = s:lettepa.jianshilan
    let s:cyan = s:lettepa.pubulan
    let s:magenta = s:lettepa.fengxianhuahong
    let s:yellow = s:lettepa.mihuang
    " Secondary accent colors
    let s:red0 = s:lettepa.fengyehong
    let s:green0 = s:lettepa.meidielv
    let s:blue0 = s:lettepa.dianqing
    let s:cyan0 = s:lettepa.cuilan
    let s:magenta0 = s:lettepa.zijinghong
    let s:yellow0 = s:lettepa.canghuang
else
    " Main colors: 03, 02, 00, 1, 2
    let s:bg = s:lettepa.hanbaiyu
    let s:bg0 = s:lettepa.zhenzhuhui
    let s:fg0 = s:lettepa.waguanhui
    let s:fg = s:lettepa.huilan
    " Primary accent colors
    let s:red = s:lettepa.fengyehong
    let s:green = s:lettepa.meidielv
    let s:blue = s:lettepa.dianqing
    let s:cyan = s:lettepa.cuilan
    let s:magenta = s:lettepa.zijinghong
    let s:yellow = s:lettepa.canghuang
    " Secondary accent colors
    let s:red0 = s:lettepa.haitanghong
    let s:green0 = s:lettepa.shilv
    let s:blue0 = s:lettepa.jianshilan
    let s:cyan0 = s:lettepa.pubulan
    let s:magenta0 = s:lettepa.fengxianhuahong
    let s:yellow0 = s:lettepa.mihuang
endif
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
call s:h('String', s:blue)
call s:h('Character', s:red)
call s:h('Number', s:blue)
call s:h('Boolean', s:blue)
call s:h('Float', s:blue)

call s:h('Identifier', s:green)
call s:h('Function', s:green)

call s:h('Statement', s:magenta)
call s:h('Conditional', s:magenta)
call s:h('Repeat', s:magenta)
call s:h('Label', s:magenta)
call s:h('Operator', s:magenta)
call s:h('Keyword', s:magenta)
call s:h('Exception', s:magenta)

call s:h('PreProc', s:magenta)
call s:h('Include', s:magenta)
call s:h('Define', s:magenta)
call s:h('Macro', s:magenta)
call s:h('PreCondit', s:magenta)

call s:h('Type', s:cyan)
call s:h('StorageClass', s:magenta)
call s:h('Structure', s:cyan)
call s:h('Typedef', s:cyan)

call s:h('Special', s:magenta)
call s:h('Tag', s:magenta)
call s:h('SpecialChar', s:magenta)
call s:h('Delimiter', s:fg0)
call s:h('SpecialComment', s:magenta)
call s:h('Debug', s:magenta)

call s:h('Underlined', s:cyan, s:none, ['underline'])

call s:h('Ignore', s:fg0)

call s:h('Error', s:red, s:none, ['bold'])

call s:h('Todo', s:green, s:bg0)

" }}}

" Extended highlighting {{{

call s:h('SpecialKey', s:fg0)

call s:h('NonText', s:fg0)
call s:h('EndOfBuffer', s:fg0)

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
call s:h('QuickFixLine', s:fg, s:cyan0)

call s:h('MoreMsg', s:fg, s:none, ['bold'])
call s:h('ModeMsg', s:fg, s:none, ['bold'])

call s:h('LineNr', s:fg0)
call s:h('LineNrAbove', s:fg0)
call s:h('LineNrBelow', s:fg0)

call s:h('CursorLineNr', s:fg)
call s:h('SignColumn', s:magenta)
call s:h('CursorLineSign', s:magenta)
call s:h('Folded', s:blue, s:bg0)
call s:h('FoldColumn', s:fg0)
call s:h('CursorLineFold', s:fg0)

call s:h('Question', s:green)

call s:h('VertSplit', s:fg0)

call s:h('Title', s:green)

call s:h('WildMenu', s:bg, s:fg)

call s:h('Conceal', s:fg0)

call s:h('DiffAdd', s:green, s:bg0)
call s:h('DiffChange', s:yellow, s:bg0)
call s:h('DiffDelete', s:red, s:bg0)
call s:h('DiffText', s:red, s:bg0, ['bold'])

call s:h('ColorColumn', s:none, s:bg0)

call s:h('SpellBad', s:fg, s:red0, ['underline'])
call s:h('SpellCap', s:fg, s:blue0, ['underline'])
call s:h('SpellLocal', s:fg, s:cyan0, ['underline'])
call s:h('SpellRare', s:fg, s:magenta0, ['underline'])

call s:h('Pmenu', s:fg, s:bg)
call s:h('PmenuSel', s:bg, s:fg)
call s:h('PmenuKind', s:fg, s:bg)
call s:h('PmenuKindSel', s:bg, s:fg)
call s:h('PmenuExtra', s:fg, s:bg)
call s:h('PmenuExtraSel', s:bg, s:fg)
call s:h('PmenuSbar', s:none, s:bg)
call s:h('PmenuThumb', s:none, s:fg0)

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
