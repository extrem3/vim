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
    call AlertUser("1st compiling done, compiling bibtex", "update")
    call SetUpMakeForBibtex()
    silent make
    " latex round
    call AlertUser("2st compiling done", "update")
    call SetUpMakeForLatex()
    call MakeLatex()
    " latex round
    call MakeLatex()
  else
    copen
  endif
endfunction

function! MakeLatex()
  call AlertUser("Compiling", "update")
  silent make main.tex
  if len(getqflist()) > 0
    call AlertUser("Compiling failed", "error")
    copen
  else
    call AlertUser("Successfully compiled", "done")
    cclose
  endif
endfunction

nnoremap <buffer> <leader>r :!mupdf main.pdf<cr><cr>
nnoremap <buffer> <leader>c :<c-u>call MakeLatex()<cr>
nnoremap <buffer> <leader>b :<c-u>call MakeBibtex()<cr>

imap <buffer> ,c \v c
imap <buffer> ,z \v z
imap <buffer> ,s \v s

let g:AutoClosePairs_add = "$"


function! RepairCSZ()
  '<,'>s/č/\\v c/
  '<,'>s/š/\\v s/
  '<,'>s/ž/\\v z/
endfunction

function! OssLatexMake()
  g/^$/d
  %s/^\s*//
  %s/.*)\ \(.*\)$/\ \ \\task{\1}\r\ \ {}/
  %s/^Naloga\ \(.*\)/\\end\{tasks\}\r\r\r\%===============================================================================>>\ Section\ [Naloga\ \1]\r\\section*\{Naloga\ \1\}\r\\label\{sec:naloga_\1\}\r\r\\begin\{tasks\}
  %s/č/\\v c/
  %s/š/\\v s/
  %s/ž/\\v z/
  g/^\s*\\task/normal gqq
  normal ggdjGp<<
endfunction
