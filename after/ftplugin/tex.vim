function! SetUpMakeForLatex()
  let b:tex_flavor = 'pdflatex'
  compiler tex
  set makeprg=pdflatex\ \-file\-line\-error\ \-interaction=nonstopmode\ $*\\\|\ grep\ \-P\ ':\\d{1,5}:\ '
  set errorformat=%f:%l:\ %m
endfunction
call SetUpMakeForLatex()

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
