function! SetUpMakeForBibtex()
  set makeprg=bibtex\ main.aux
endfunction

function! SetUpMakeForLatex()
  let b:tex_flavor = 'pdflatex'
  compiler tex
  set makeprg=pdflatex\ \-file\-line\-error\ \-interaction=nonstopmode\ $*\\\|\ grep\ \-P\ ':\\d{1,5}:\ '
  set errorformat=%f:%l:\ %m
endfunction
call SetUpMakeForLatex()

function! MakeBibtex()
  call SetUpMakeForLatex()
  call MakeLatex()
  if len(getqflist()) == 0
    " bibtex round
    call SetUpMakeForBibtex()
    silent make
    " latex round
    call SetUpMakeForLatex()
    call MakeLatex()
    " latex round
    call MakeLatex()
  else
    copen
  endif
endfunction

function! MakeLatex()
  silent make main.tex
  if len(getqflist()) > 0
    copen
  else
    cclose
  endif
endfunction

nnoremap <buffer> ,r :!mupdf main.pdf<cr><cr>
nnoremap <buffer> ,w :<c-u>call MakeLatex()<cr>
nnoremap <buffer> ,b :<c-u>call MakeBibtex()<cr>
