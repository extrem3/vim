" tests
" set makeprg=./bin/tests\ $*\\\|\ grep\ \-i\ 'Failure'\ \-A\ 3\ $*\\\|\ grep\ \-v\ \-i\ '\\-\\-'\ $*\\\|\ sed\ \-e\ 'N;s\/\\n\/,\ \/'\ $*\\\|\ sed\ \-e\ 'N;s\/\\n\/\ >\ \/'\ $*\\\|\ sed\ \-e\ 'N;s\/\ \ \ \/\ \/'
" set errorformat=%f:%l:%m


function! SetUpMakeForCpp()
  set makeprg=make\ -C\ ./bin\ 2>&1\ $*\\\|\ grep\ \-e\ 'error'\ \-e\ 'warning'
  set errorformat=%f:%l:%c:\ %m
endfunction
call SetUpMakeForCpp()

function! MakeCc()
  silent make
  if len(getqflist()) > 0
    copen
  endif
endfunction

nnoremap <buffer> ,r :asdfwe
nnoremap <buffer> ,w :<c-u>call MakeCc()<cr>
nnoremap <buffer> ,t :<c-u>call CheckTests()<cr>
