" File: liquidcarbon.vim
" Author: Jeet Sukumaran
" Description: Vim color file
" Last Modified: October 06, 2010

" Initialization and Setup {{{1
" ============================================================================
set background=dark
highlight clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "liquidcarbon"
" 1}}}

" Normal Color {{{1
" ============================================================================
" hi Normal           guifg=#bdcdcd   guibg=#0a0a0a
hi Normal           guifg=#FFFFFF guibg=#0a0a0a
" 1}}}

" Core Highlights {{{1
" ============================================================================
hi  ColorColumn     guifg=NONE      guibg=#333333
hi  Cursor          guifg=bg        guibg=#AACC88   gui=NONE
hi  CursorIM        guifg=bg        guibg=fg        gui=NONE
hi  CursorLine      guifg=NONE      guibg=#101010   gui=NONE
hi  lCursor         guifg=bg        guibg=fg        gui=NONE
hi  DiffAdd         guifg=#000000   guibg=#b3713c   gui=NONE
hi  DiffChange      guifg=#000000   guibg=#94cd4f   gui=NONE
hi  DiffDelete      guifg=#000000   guibg=#36268b   gui=NONE
hi  DiffText        guifg=#000000   guibg=#e5ee8e   gui=NONE
hi  Directory       guifg=#1e90ff   guibg=bg        gui=NONE
hi  ErrorMsg        guifg=#ff6a6a   guibg=NONE      gui=bold
hi  FoldColumn      guifg=#68838b   guibg=#4B4B4B   gui=bold
hi  Folded          guifg=#68838b   guibg=#4B4B4B   gui=NONE
hi  IncSearch       guifg=#000000   guibg=#33ff00   gui=bold
hi  LineNr          guifg=#353535   guibg=#070707   gui=NONE
hi  MatchParen      guifg=#99FF00   guibg=NONE        gui=bold 		"parenthasis match
hi  ModeMsg         guifg=#000000   guibg=#99FF00   gui=bold
hi  MoreMsg         guifg=#2e8b57   guibg=bg        gui=bold
hi  NonText         guifg=#070707   guibg=#070707   gui=NONE
hi  Pmenu           guifg=#bdcdcd   guibg=#1a1a1a   gui=NONE 		"intellisense
hi  PmenuSel        guifg=#9acd00   guibg=#1f1f1f   gui=bold
hi  PmenuSbar       guifg=#ffffff   guibg=#c1cdc1   gui=NONE
hi  PmenuThumb      guifg=#ffffff   guibg=#838b83   gui=NONE
hi  Question        guifg=#00ee00   guibg=NONE      gui=bold
hi  Search          guifg=#000000   guibg=#8fff6f   gui=bold
hi  SignColumn      guifg=#ffffff   guibg=#cdb4cd   gui=NONE
hi  SpecialKey      guifg=#666666   guibg=NONE      gui=NONE
hi  SpellBad        guisp=#ee2c2c   gui=undercurl
hi  SpellCap        guisp=#0000ff   gui=undercurl
hi  SpellLocal      guisp=#8b8b00   gui=undercurl
hi  SpellRare       guisp=#ff00ff   gui=undercurl
hi  StatusLine      guifg=#eeffdd   guibg=#030303   gui=NONE 		"window titles
hi  StatusLineNC    guifg=#999999   guibg=#030303   gui=italic 		"unfocused window titles
hi  TabLine         guifg=fg        guibg=#d3d3d3   gui=underline
hi  TabLineFill     guifg=fg        guibg=bg        gui=reverse
hi  TabLineSel      guifg=fg        guibg=bg        gui=bold
hi  Title           guifg=#9acd00   guibg=bg        gui=bold
hi  VertSplit       guifg=#030303   guibg=#030303
hi  Visual          guifg=#000000   guibg=#ccff90   gui=NONE
hi  WarningMsg      guifg=#ee9a00   guibg=bg        gui=NONE
hi  WildMenu        guifg=#000000   guibg=#ceeb87   gui=NONE
" 1}}}

" Syntax {{{1
" ============================================================================

"  General {{{2
" -----------------------------------------------------------------------------
hi  Comment         guifg=#105010   guibg=NONE      gui=italic
hi  Constant        guifg=#adcd00   guibg=NONE      gui=NONE
hi  String          guifg=#22AA00   guibg=NONE      gui=NONE
hi  Boolean         guifg=#c9cd69   guibg=NONE      gui=NONE
hi  Identifier      guifg=#a0a0a0   guibg=NONE      gui=NONE
hi  Function        guifg=#a5de92   guibg=NONE      gui=NONE
hi  Statement       guifg=#9acd00   guibg=NONE      gui=NONE
hi  PreProc         guifg=#9acd00   guibg=NONE      gui=NONE
hi  Keyword         guifg=#c5cd7a   guibg=NONE      gui=NONE
hi  Type            guifg=#69e141   guibg=NONE      gui=NONE
hi  Special         guifg=#9f447f   guibg=NONE      gui=NONE
hi  Ignore          guifg=bg        guibg=NONE      gui=NONE
hi  Error           guifg=#ff3030   guibg=NONE      gui=NONE
hi  Todo            guifg=#88eeff   guibg=NONE      gui=bold
" 2}}}

" Vim {{{2
" -----------------------------------------------------------------------------
hi VimError         guifg=#ff0000   guibg=#000000   gui=bold
hi VimCommentTitle  guifg=#528b8b   guibg=bg        gui=bold,italic
" 2}}}

" QuickFix {{{2
" -----------------------------------------------------------------------------
hi qfFileName       guifg=#7b8b60   guibg=NONE      gui=italic
hi qfLineNr         guifg=#88aa00   guibg=NONE      gui=bold
hi qfError          guifg=#ff0000   guibg=NONE      gui=bold
" 2}}}

" Python {{{2
" -----------------------------------------------------------------------------
hi pythonDecorator  guifg=#cd8500   guibg=NONE      gui=NONE
hi link pythonDecoratorFunction pythonDecorator
" 2}}}

" Diff {{{2
" -----------------------------------------------------------------------------
hi diffOldFile      guifg=#da70d6   guibg=NONE      gui=italic
hi diffNewFile      guifg=#ffff00   guibg=NONE      gui=italic
hi diffFile         guifg=#ffa500   guibg=NONE      gui=italic
hi diffLine         guifg=#ff00ff   guibg=NONE      gui=italic
hi link             diffOnly        Constant
hi link             diffIdentical   Constant
hi link             diffDiffer      Constant
hi link             diffBDiffer     Constant
hi link             diffIsA         Constant
hi link             diffNoEOL       Constant
hi link             diffCommon      Constant
hi diffRemoved      guifg=#cd5555   guibg=NONE      gui=NONE
hi diffChanged      guifg=#94cd4f   guibg=NONE      gui=NONE
hi diffAdded        guifg=#00cd00   guibg=NONE      gui=NONE
hi link             diffSubname     diffLine
hi link             diffComment     Comment
" 2}}}

" 1}}}
