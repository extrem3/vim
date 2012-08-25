function! SetUpMakeForScm()
  " set makeprg=echo\ '\\#lang\ planet\ neil/sicp'\ >\ /tmp/temp.scm\ &&\ cat\ %\ >>\ /tmp/temp.scm\ &&\ racket\ /tmp/temp.scm
  let &makeprg="echo '\\#lang planet neil/sicp' > /tmp/temp.scm && cat % >> /tmp/temp.scm && racket /tmp/temp.scm > /tmp/scheme.out"
  set errorformat=%s:%l:%c:\ %m
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


function! NewExcercise(type)
  let filename_numbers = split(expand('%:t:r'), "\\.")
  if a:type == 1
    let new_filename = filename_numbers[0] . "." . (filename_numbers[1] + 1) . ".scm"
  else
    let new_filename = (filename_numbers[0] + 1) . ".1.scm"
  endif
  exec 'vsp ' . new_filename
  set ft=scheme
endfunction

command! E call NewExcercise(1)
command! En call NewExcercise(2)
