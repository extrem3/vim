function! SetUpMakeForCpp()
  set makeprg=make\ -C\ ./bin\ 2>&1\ $*\\\|\ grep\ \-e\ 'error'\ \-e\ 'warning'
  set errorformat=%f:%l:%c:\ %m
endfunction
call SetUpMakeForCpp()

function! MakeCc()
  silent make
  if len(getqflist()) > 0
    copen
  else
    cclose
  endif
endfunction

nnoremap <buffer> ,w :<c-u>call MakeCc()<cr>
nnoremap <buffer> ,t :<c-u>call CheckTests()<cr>
