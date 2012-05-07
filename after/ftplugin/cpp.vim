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

nnoremap <buffer> <leader>c :<c-u>call MakeCc()<cr>
nnoremap <buffer> <leader>t :<c-u>call CheckTests()<cr>
nnoremap <buffer> <leader>r g:ClangUpdateQuickFix()

function! ConstructDefinitions()
  exec "set paste<cr>i<c-r>=protodef#ReturnSkeletonsFromPrototypesForCurrentBuffer({})<cr><esc>='[:set nopaste<cr>"
endfunction

function! FSReturnReadableCompanionFilename(filename)
  return 'inc/' . expand(a:filename . ':t:r') . '.h'
endfunction

function! UpdateVsp()
  exec 'cnoremap E rightbelow vsp src/' . expand('%:t:r') . '.cc<cr>'
  exec 'cnoremap T rightbelow vsp tests/' . expand('%:t:r') . '_test.cc<cr>'
endfunction

au! BufEnter *.hpp,*.h,*.hxx call UpdateVsp()
nnoremap <buffer> <leader>pp :<c-u>call ConstructDefinitions()<cr>
" nnoremap <buffer> <leader>pg "5yy?private:"5Pf_Da() const { return "5pdwkJA }
" nnoremap <buffer> <leader>ps "5yy?private:Pdwivoid set_f_Da("5pkJxf_Da) {"5pdwf;xkJA = "5pdwf_xkJA }
nnoremap <buffer> <leader>pg "5yy?private:"5Pf_Da() const;
nnoremap <buffer> <leader>ps "5yy?private:Pdwivoid set_f_Da("5pkJxf_Da);
