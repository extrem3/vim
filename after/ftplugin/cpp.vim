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
nnoremap <buffer> <leader>r :<c-u>call g:ClangUpdateQuickFix()<cr>

function! ConstructDefinitions()
  exec "set paste<cr>i<c-r>=protodef#ReturnSkeletonsFromPrototypesForCurrentBuffer({})<cr><esc>='[:set nopaste<cr>"
endfunction

function! FSReturnReadableCompanionFilename(filename)
  return 'inc/' . expand(a:filename . ':t:r') . '.h'
endfunction

exec 'command! E rightbelow vsp src/' . expand('%:t:r') . '.cc'
exec 'command! T rightbelow vsp tests/' . expand('%:t:r') . '_test.cc'

nnoremap <buffer> <leader>pp :<c-u>call ConstructDefinitions()<cr>
nnoremap <buffer> <leader>pg "5yy?private:"5Pf_Da() const;
nnoremap <buffer> <leader>ps "5yy?private:Pdwivoid set_f_Da("5pkJxf_Da);




function! CheckHeaders(file)

  if winnr('$') >= 3 && winnr() == 1
    execute 'edit inc/' . a:file . '.h'
    set ft=cpp
    wincmd l
    execute 'edit src/' . a:file . '.cc'
    set ft=cpp
    wincmd l
    execute 'edit tests/' . a:file . '_test.cc'
    set ft=cpp
    wincmd l
    wincmd h
    wincmd h
    wincmd h
    wincmd h
  endif

endfunction


function! Sp(dir, mode, linked, ...)

  let numOfWindows = winnr("$")
  let split = 'sp'
  if a:dir == '1'
    let split = 'vsp'
  endif
  if a:linked == '2'
    " windows linked by width
    wincmd b
    let move = ""
    let where = "leftabove "
    if numOfWindows >= 3
      wincmd t
      let move = " \| wincmd l "
      let where = "leftabove "
      let split = 'sp'
    endif

    let i = a:0
    while(i > 0)
      execute 'let files = glob (a:' . i . ')'
      for f in split (files, "\n")
        if a:mode == '0'
          execute split . ' ' . f
        else
          let f = fnamemodify(f, ':t:r')
          execute where . split . ' inc/' . f . '.h'. move 
          if numOfWindows < 3
            let where = "rightbelow "
          endif
          execute where . split . ' src/' . f . '.cc' . move
          if numOfWindows < 3
            if a:mode == '2'
                execute where . split . ' tests/' . f . '_test.cc' . move
            endif
          endif
        endif
      endfor
      let i = i - 1
    endwhile
  else
    " windows linked by height
    let hasMain = 0
    wincmd b
    if expand("%") == "main.cc"
      let hasMain = 1
    endif

    if numOfWindows >= 3
      let split = 'vsp'
    endif

    let i = a:0
    while(i > 0)
      execute 'let files = glob (a:' . i . ')'
      for f in split (files, "\n")
        if a:mode == '0'
          execute split . ' ' . f
        else
          let f = fnamemodify(f, ':t:r')
          if numOfWindows >=3
            if hasMain == 1
              quit
            endif
            execute 'bot sp'
            let split = 'e '
          endif
          if a:mode == '2'
            execute split . ' tests/' . f . '_test.cc'
            if numOfWindows >=3
              let split = 'vsp '
            endif
          endif
          execute split . ' src/' . f . '.cc'
          if numOfWindows >=3
            let split = 'vsp '
          endif
          execute split . ' inc/' . f . '.h'
          if numOfWindows >=3
            if hasMain == 1
              execute 'botright vsp main.cc'
            endif
          endif
        endif
      endfor
      let i = i - 1
    endwhile
  endif

  windo if expand('%') == '' | q | endif

endfunction

com! -nargs=* -complete=file Sp call Sp(0, 0, 0, <f-args>)
com! -nargs=* -complete=file Vsp call Sp(1, 0, 0, <f-args>)
com! -nargs=* -complete=file Eh call Sp(1, 1, 2, <f-args>)
com! -nargs=* -complete=file Eht call Sp(1, 2, 2, <f-args>)
com! -nargs=* -complete=file Eh2 call Sp(1, 1, 1, <f-args>)
com! -nargs=* -complete=file Eht2 call Sp(1, 2, 1, <f-args>)
