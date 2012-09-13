" VUNDLE
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Set mapleader to ,
let mapleader=","

" Github
Bundle 'gmarik/vundle'
Bundle 'godlygeek/tabular'
Bundle 'Rip-Rip/clang_complete'
Bundle 'Shougo/neocomplcache'
Bundle 'osyo-manga/neocomplcache-clang_complete'
Bundle 'ujihisa/neco-ghc'
Bundle 'lukerandall/haskellmode-vim'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/tComment'
Bundle 'tpope/vim-fugitive'
Bundle 'sjl/gundo.vim'
" Bundle 'sjl/threesome.vim'
Bundle 'vim-scripts/bufkill.vim'
Bundle 'Townk/vim-autoclose'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'mattn/zencoding-vim'
Bundle 'gregsexton/gitv'
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/UltiSnips'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'derekwyatt/vim-protodef'

filetype plugin indent on


" NEOCOMPLCACHE
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

let g:neocomplcache_enable_auto_select = 0

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" use neocomplcache & clang_complete
let g:neocomplcache_force_overwrite_completefunc=1

" NECO-GHC
let $PATH = $PATH . ':' . expand("~/.cabal/bin")

" AUTOCLOSE
let g:AutoClosePreserveDotReg = 0

" TAGBAR
map <silent> <A-f> :TagbarToggle<CR>
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1

" GUNDO
"let g:miniBufExplMapCTabSwitchBufs = 1
let g:gundo_preview_bottom = 1
let g:gundo_width = 30
let g:gundo_preview_height = 30
nnoremap <leader>u :GundoToggle<cr>


" EASYMOTION
let g:EasyMotion_leader_key = '.'
let g:EasyMotion_keys = 'asdfghjkl;qwertyuiop'

" GITV + FUGITIVE
nnoremap <leader>gu :Gitv!<cr>
" nnoremap <leader>gco :Git checkout 
" nnoremap <leader>gf :Git flow feature start 
" nnoremap <leader>gr :Git flow release start 
" nnoremap <leader>gh :Git flow hotfix start 
" nnoremap <leader>gci :Git commit 
" nnoremap <leader>gcm :Git commit -a -m ''<left>
" nnoremap <leader>gst :Gstatus<CR>
" nnoremap <leader>gb :exe ':GbranchFinish'<CR>

" CLANG_COMPLETE
let g:clang_use_library = 1
let g:clang_periodic_quickfix = 1
let g:clang_complete_auto = 1
let g:clang_auto_select = 1
let g:clang_complete_copen = 1
let g:clang_hl_errors = 1
let g:clang_snippets = 0
let g:clang_snippets_engine = "snipmate"
let g:clang_complete_patterns = 0
let g:clang_user_options = '-std=c++11'
nnoremap <leader>q call g:ClangUpdateQuickFix()<CR>
imap <C-Space> <C-x><C-u>
set path+=/usr/include/c++/4.6.1/
set path+=/usr/include/i386-linux-gnu/
set path+=/usr/include/QtCore/
set path+=/usr/include/c++/4.6/
set path+=/usr/include/
set path+=/usr/include/qt4/
set path+=/usr/include/qt4/QtCore/
set path+=/usr/include/qt4/QtGui/
set path+=/home/andr3/projects/cc/libs/gtest/gtest-1.6.0/include/
set path+=/home/andr3/projects/cc/libs/a3/include/
exec "set path+=" . getcwd() . "/inc/"
exec "set path+=" . getcwd()

" CTRLP
set wildignore+=.git/*
let g:ctrlp_working_path_mode = 0
nnoremap <space>o :CtrlP<CR>
nnoremap <space>p :CtrlPBuffer<CR>

" ULTISNIPS
set runtimepath+=~/.vim/ultiSnips
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "ultiSnips"]




"Setting up the statusline
set statusline=
set statusline+=%f\ %2*%m\ %1*%h
set statusline+=%#warningmsg#
set statusline+=%{fugitive#statusline()}
set statusline+=%*
set statusline+=%r
set statusline+=%=
set statusline+=%{v:register}
set statusline+=\ [%{&encoding}\ %{&fileformat}\ %{strlen(&ft)?&ft:'none'}]
set statusline+=\ %10.(%c:%l/%L%)\ [%p%%]
set laststatus=2

" Vim special file directories
set undodir=~/.vim/tmp/undo// " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap// " swap files

" Don't destroy buffer after hiding it
set hidden

" Some tab options
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
" Search options
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
set iskeyword=@,48-57,_,192-255
nnoremap ,<space> :noh<cr>
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
" Open a Quickfix window for the last search 
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>
" Center next and previous search results
nnoremap n nzz
nnoremap N Nzz

" Remove pretty much everything from the GUI
set guioptions-=m
set guioptions-=T
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=b
" Show numbers
set number
" Show current cursor line
set cursorline
set guicursor=i:block-Cursor
set guicursor=n-v-c:blinkon0
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
syntax on

set wildmenu
set wildmode=longest,full
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc,*.pdf          " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files


" fast vertical movement
nnoremap <space>j 10j
nnoremap <space>k 10k

nnoremap <silent> <leader>p :YRShow<CR>


" " Always keep cursor in the middle
" set scrolloff=9999

" SplitJoin
nnoremap S li<cr><c-[>k$

inoremap ,f {<cr><bs><bs>}<esc>ko
nmap Y y$

nnoremap <leader>w :w<cr>

" forgot sudo?
cmap w!! w !sudo tee % >/dev/null


" Smart moving between windows
nnoremap <C-h> <C-w>h
noremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <A-h> <C-w>5>
nnoremap <A-j> <C-w>5+
nnoremap <A-k> <C-w>5-
nnoremap <A-l> <C-w>5<

" Move to next and previous buffer
map gt <esc>:bn<cr>
map gT <esc>:bp<cr>

" toggle case with gu
map gu g~

" for quick access of underscore
imap ,r _

" Language specific mappings
imap ,s š
imap ,z ž
imap ,c č


function! CheckTests()
  call AlertUser("Compiling", "update")
  silent make
  call AlertUser("Checking tests", "warning")
  silent !./coverage.rb clear
  if len(getqflist()) == 0
    set makeprg=./bin/tests\ $*\\\|\ grep\ \-i\ 'Failure'\ \-A\ 3\ $*\\\|\ grep\ \-v\ \-i\ '\\-\\-'\ $*\\\|\ sed\ \-e\ 'N;s\/\\n\/,\ \/'\ $*\\\|\ sed\ \-e\ 'N;s\/\\n\/\ >\ \/'\ $*\\\|\ sed\ \-e\ 'N;s\/\ \ \/\ \/'
    set errorformat=%f:%l:\ Failure\\,\ Value\ of:\ %m
    silent make
    if len(getqflist()) > 0
      call AlertUser("Some tests failed", "error")
      copen
    else
      call AlertUser("All tests passed", "done")
      cclose
      let shellcmd = './coverage.rb ' . expand("%")
      let output=system(shellcmd)
      if v:shell_error
        call AlertUser("could not check for coverage", "warning")
        return 0
      endif
      if output != "noerrors"
        call AlertUser("All tests passed", "done")
        exe 'sbuffer src/' . substitute(expand("%:t:r"), '\(.*\)_test', '\1', "g") . '.cc'
        exe output
      else
        exe 'sbuffer src/' . substitute(expand("%:t:r"), '\(.*\)_test', '\1', "g") . '.cc'
        match
      endif
      
    endif
  endif
  call SetUpMakeForCpp()
endfunction


colorscheme dummy
if has('gui_running')
	" set guifont=inconsolata\ 10
	" set guifont=FreeMono\ 10
	set guifont=Terminus\ 8
endif

" " match overlength characters 
" " with red background
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" autocmd BufAdd * match OverLength /\%81v.\+/
" match OverLength /\%81v.\+/
" " or with ColorColumn
highlight ColorColumn ctermbg=darkblue ctermfg=white guibg=#592929
set colorcolumn=80

" " Setting maximum width to 80 culomns
" set textwidth=80
" set wrap


" notify user that some action was completed
function! AlertUser(text, status)
  if a:status == "done"
    hi passedColor guifg=#000000 guibg=#66ff00
  elseif a:status == "warning"
    hi passedColor guifg=#000000 guibg=#ff6600
  elseif a:status == "update"
    hi passedColor guifg=#000000 guibg=#00ccff
  else
    hi passedColor guifg=#000000 guibg=#d00000
  endif

  echohl passedColor
  " echo " " . a:text . " "
  echo " " . a:text . " " . repeat(" ", &columns - strlen(a:text) - 3)
  " echohl

  redraw
endfunction

" " make visual centering of the screen a little more intuitive
" vnoremap <silent> zz :<C-u>call setpos('.',[0,(line("'>")-line("'<"))/2+line("'<"),0,0])<Bar>normal! zzgv<CR>
" vnoremap <silent> zt :<C-u>call setpos('.',[0,line("'<"),0,0])<Bar>normal! ztgv<CR>
" vnoremap <silent> zb :<C-u>call setpos('.',[0,line("'>"),0,0])<Bar>normal! zbgv<CR>


" make quickfix window to open as the very bottom buffer
autocmd! FileType qf wincmd J
" botright cwindow

" Jump to errors
map cn :cn<C-m>
map cp :cp<C-m>
map cr :cr<C-m>
map cla :cla<C-m>
map cc :cc<C-m>


set switchbuf=useopen


autocmd! BufWritePost .vimrc source %
