set t_Co=16
set cursorline

" General highlighting
highlight Comment      ctermfg=Blue       ctermbg=none       cterm=none
highlight Function     ctermfg=Yellow     ctermbg=none       cterm=none
highlight Identifier   ctermfg=White      ctermbg=none       cterm=none
highlight Normal       ctermfg=White      ctermbg=Black      cterm=none
" Constant highlighting group
highlight Boolean      ctermfg=Red        ctermbg=none       cterm=none
highlight Character    ctermfg=Green      ctermbg=none       cterm=none
highlight Constant     ctermfg=DarkRed    ctermbg=none       cterm=none
highlight Float        ctermfg=Red        ctermbg=none       cterm=none
highlight Number       ctermfg=Red        ctermbg=none       cterm=none
highlight String       ctermfg=Green      ctermbg=none       cterm=none
" Statement highlighting group
highlight Conditional  ctermfg=Magenta    ctermbg=none       cterm=none
highlight Keyword      ctermfg=Magenta    ctermbg=none       cterm=none
highlight Operator     ctermfg=Yellow     ctermbg=none       cterm=none
highlight PreProc      ctermfg=DarkYellow ctermbg=none       cterm=none
highlight Repeat       ctermfg=Magenta    ctermbg=none       cterm=none
highlight Statement    ctermfg=Cyan       ctermbg=none       cterm=none
" Special highlighting group
highlight Delimiter    ctermfg=Cyan       ctermbg=none       cterm=none
highlight Special      ctermfg=DarkYellow ctermbg=none       cterm=none
highlight SpecialChar  ctermfg=DarkYellow ctermbg=none       cterm=none
highlight Tag          ctermfg=Magenta    ctermbg=none       cterm=none
highlight Todo         ctermfg=Yellow     ctermbg=Black      cterm=none
highlight Type         ctermfg=DarkCyan   ctermbg=none       cterm=none
" Other random highlights
highlight Cursor       ctermfg=none       ctermbg=none       cterm=none
highlight CursorLine   ctermfg=none       ctermbg=DarkBlue   cterm=none
highlight CursorLineNR ctermfg=White      ctermbg=Blue       cterm=none
highlight IncSearch    ctermfg=none       ctermbg=DarkGreen  cterm=bold
highlight LineNR       ctermfg=DarkGrey   ctermbg=DarkBlue   cterm=none
highlight MatchParen   ctermfg=Grey       ctermbg=Blue       cterm=none
highlight Pmenu        ctermfg=Black      ctermbg=Cyan       cterm=none
highlight PmenuSel     ctermfg=White      ctermbg=DarkCyan   cterm=none
highlight Search       ctermfg=none       ctermbg=DarkGreen  cterm=bold
highlight StatusLine   ctermfg=Blue       ctermbg=Grey       cterm=none
highlight Visual       ctermfg=none       ctermbg=DarkGrey   cterm=none
" Errors and warnings highlighting
highlight Error        ctermfg=none       ctermbg=DarkRed    cterm=none
highlight ErrorMsg     ctermfg=none       ctermbg=DarkRed    cterm=none
highlight WarningMsg   ctermfg=none       ctermbg=Yellow     cterm=none
" Diff highlights
highlight DiffAdd      ctermfg=none       ctermbg=DarkGreen  cterm=none
highlight DiffChange   ctermfg=none       ctermbg=DarkYellow cterm=none
highlight DiffDelete   ctermfg=DarkRed    ctermbg=DarkRed    cterm=none
highlight DiffText     ctermfg=none       ctermbg=DarkYellow cterm=underline
