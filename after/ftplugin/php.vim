function! GetUrl(filename)
    let s = substitute(a:filename, ".*\/http\/", "", "")
    let s = substitute(s, "^", "!firefox http://localhost/", "")
    return s
endfunction

nnoremap <buffer> ,r :exe(GetUrl(expand("%:p")))<cr><cr>
