function! SetUpMakeForCpp()
  set makeprg=make\ -C\ ./bin\ 2>&1\ $*\\\|\ grep\ \-e\ 'error'\ \-e\ 'warning'
  set errorformat=%f:%l:%c:\ %m
endfunction
call SetUpMakeForCpp()

function! MakeCc()
  call AlertUser("Compiling", "update")
  silent make
  if len(getqflist()) > 0
    call AlertUser("Compiling failed", "error")
    copen
  else
    call AlertUser("Successfully compiled", "done")
    cclose
  endif
endfunction

nnoremap <buffer> _w :<c-u>call MakeCc()<cr>
nnoremap <buffer> _t :<c-u>call CheckTests()<cr>
