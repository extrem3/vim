function! SetUpMakeForScm()
  set makeprg=echo\ '\\#lang\ planet\ neil/sicp'\ >\ /tmp/temp.scm\ &&\ cat\ %\ >>\ /tmp/temp.scm\ &&\ racket\ /tmp/temp.scm
  set errorformat=%m
endfunction
call SetUpMakeForScm()

function! MakeScm()
  call AlertUser("Compiling", "update")
  silent make
  if len(getqflist()) > 0
    call AlertUser("Output", "done")
    copen
  endif
endfunction

nnoremap <buffer> <leader>c :<c-u>call MakeScm()<cr>
