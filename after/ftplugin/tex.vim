let b:tex_flavor = 'pdflatex'
compiler tex
set makeprg=pdflatex\ \-file\-line\-error\ \-interaction=nonstopmode\ $*\\\|\ grep\ \-P\ ':\\d{1,5}:\ '
set errorformat=%f:%l:\ %m

nnoremap <buffer> ,r :!mupdf main.pdf<cr><cr>
nnoremap <buffer> ,w :make main.tex<cr>
