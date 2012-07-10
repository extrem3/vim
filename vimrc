"Pathogen, for better plugin management
"{
" filetype on
" filetype plugin on

" call pathogen#runtime_append_all_bundles()
" call pathogen#helptags()
"}
"
"Vundle
"{
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Github
Bundle 'gmarik/vundle'
Bundle 'sjbach/lusty'
Bundle 'godlygeek/tabular'
Bundle 'Rip-Rip/clang_complete'
Bundle 'Shougo/neocomplcache'
Bundle 'osyo-manga/neocomplcache-clang_complete'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/tComment'
Bundle 'tpope/vim-fugitive'
Bundle 'sjl/gundo.vim'
Bundle 'sjl/threesome.vim'
Bundle 'abudden/TagHighlight'
" Bundle 'chrismetcalf/vim-yankring'
Bundle 'vim-scripts/bufkill.vim'
Bundle 'Townk/vim-autoclose'
Bundle 'Lokaltog/vim-easymotion'
" Bundle 'vim-scripts/camelcasemotion'
Bundle 'mattn/zencoding-vim'
Bundle 'gregsexton/gitv'
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/UltiSnips'
Bundle 'kien/ctrlp.vim'
Bundle 'mikewest/vimroom'
Bundle 'derekwyatt/vim-protodef'
" vim-scripts

" Non Github repos

filetype plugin indent on





" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
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

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

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

" add neocomplcache option
let g:neocomplcache_force_overwrite_completefunc=1

" add clang_complete option
let g:clang_complete_auto=1





"}

"Setting up the statusline
"{
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
"}

let g:LustyJugglerShowKeys = 'a'
let g:LustyJugglerSuppressRubyWarning = 1

" Set mapleader to ,
let mapleader=","

"Common options
"{
set nocp
" Vim special file directories
" {
set undodir=~/.vim/tmp/undo// " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap// " swap files
" }
" Buffer options 
" {
" Set pwd to the file in the current buffer
" autocmd BufEnter * lcd %:p:h
set hidden
" }
" Some tab options
set expandtab
set tabstop=2
set sw=2
set autoindent
" Search options
" {
set incsearch
set ignorecase
" }
"GUI options
" {
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
" Setting maximum width to 80 culomns
" set textwidth=80
" set wrap
" Do the coloring
syntax on
" }
" Wildmenu
" {
set wildmenu
set wildmode=full

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc,*.pdf          " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
" }
"}


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

" nnoremap <leader>s V`]
cmap w!! w !sudo tee % >/dev/null



let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_WinWidth = 40
let Tlist_Exist_OnlyWindow = 1


"autocmd VimEnter * NERDTree
map <silent> <A-s> :Project<CR>
map <silent> <A-f> :TagbarToggle<CR>
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
map <silent> <A-d> :Project\|TlistToggle<CR>
map ,m :w\|!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>:TlistUpdate<CR>a<esc>

"let g:miniBufExplMapCTabSwitchBufs = 1
let g:gundo_preview_bottom = 1
let g:gundo_width = 30
let g:gundo_preview_height = 30
nnoremap <leader>u :GundoToggle<cr>


" let g:EasyMotion_do_mapping = 0
let g:EasyMotion_leader_key = '.'
let g:EasyMotion_keys = 'asdfghjkl;qwertyuiop'
" let g:EasyMotion_binding_f = 'w'

nnoremap <leader>gu :Gitv!<cr>
nnoremap <leader>gco :Git checkout 
nnoremap <leader>gf :Git flow feature start 
nnoremap <leader>gr :Git flow release start 
nnoremap <leader>gh :Git flow hotfix start 
nnoremap <leader>gci :Git commit 
nnoremap <leader>gcm :Git commit -a -m ''<left>
nnoremap <leader>gst :Gstatus<CR>
nnoremap <leader>gb :exe ':GbranchFinish'<CR>
" nnoremap <leader>b :bd<cr>


" let g:acp_behaviorSnipmateLength = 1
" let g:SuperTabMappingForward = '<nul>'
" let g:SuperTabMappingBackward = '<s-nul>'
" let g:SuperTabMappingTabLiteral = '<A-tab>'

"autocmd BufNewFile,BufRead,BufEnter *.cpp,*.hpp,*.cxx set omnifunc=omni#cpp#complete#Main
"let OmniCpp_SelectFirstItem = 1
"imap <C-Space> <C-x><C-o>

let g:clang_periodic_quickfix = 1
let g:clang_use_library = 0
let g:clang_complete_auto = 1
let g:clang_auto_select = 1
let g:clang_complete_copen = 1
let g:clang_hl_errors = 1
let g:clang_snippets = 0
let g:clang_snippets_engine = "snipmate"
" let g:clang_auto_user_options = "/home/andr3/projects/cpp/conway/inc/, .clang_complete"
let g:clang_complete_patterns = 0
imap <C-Space> <C-x><C-u>
" nnoremap ,cu g:ClangUpdateQuickFix()<cr>

nnoremap <leader>pt <esc>:CommandT \/home\/andr3\/projects<cr>
nnoremap <leader>b ,lj

set wildignore+=.git/*
let g:ctrlp_working_path_mode = 0
nnoremap <space>o :CtrlP<CR>
nnoremap <space>p :CtrlPBuffer<CR>
nnoremap <space>j 10j
nnoremap <space>k 10k

nnoremap <silent> <leader>p :YRShow<CR>

set runtimepath+=~/.vim/ultiSnips
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "ultiSnips"]


" Smart pasting
nnoremap gp `[v`]
" nnoremap p pv`]=<C-o>
" nnoremap P Pv`]=
" nnoremap \p "_ddPV`]
" Select last pasted text
nnoremap <leader>V V`]

nmap Y y$

" Always keep cursor in the middle
" set scrolloff=9999

" Open a Quickfix window for the last search 
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>
" Hide search results
nmap <silent> <leader>n :nohlsearch<CR>
" Center next and previous search results
nnoremap n nzz
nnoremap N Nzz

" SplitJoin
nnoremap K /[^ ]<cr>"zd$jyyP^v$h"zpJk:s/\v +$//<cr>:noh<cr>j^
nnoremap S li<cr><c-[>k$

onoremap ad a[
onoremap id i[
" Insert common pairs and get cursor between them
inoremap ,s ""<esc>i
inoremap ,q ''<esc>i
inoremap ,p ()<esc>i
inoremap ,c []<esc>i
inoremap ,t <><esc>i
inoremap ,b {}<esc>i
inoremap ,d $$<esc>i
inoremap ,f {<cr><bs><bs>}<esc>ko
" Jump over next closing brace
inoremap <C-j> <esc>/\v["\]}')>\$]<CR>:nohlsearch<cr>a

" Toggle folds with space
" nnoremap <space> za
" vnoremap <space> za
nnoremap <leader>w :w<cr>

" Search for selected text, forwards or backwards.
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
" inoremap <A-j> V%<%dd<C-o>Vkd

" Toggle case with gu
map gu g~

" Insert ; on double tap
nmap ;; <esc>:s/;\?$/;/<cr><esc>n:noh<cr>
imap ;; <esc>:s/;\?$/;/<cr><esc>n:noh<cr>
" let g:yankring_paste_n_akey = '<m-A>'
imap <A-k> <esc>Vj%dG
imap <A-l> <esc>Vj%dGo<esc>pjj:w\|!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>:TlistUpdate<CR>a
"map ; :

ino <S-Enter> <c-r>=InsertMissingBracket("2")<cr><esc>o{<esc>o<esc>o}<esc>ka<tab>
ino <C-Enter> <c-r>=InsertMissingBracket("2")<cr><esc>A;<esc>o
ino <C-k> <c-r>=InsertMissingBracket("2")<cr>


" map ,w :w<cr>
nmap ,v :source $MYVIMRC<CR>
" nnoremap <buffer> ,c :!cd bin/ && make<cr>
" autocmd FileType *.cc,*.h nnoremap <buffer> ,c :!cd bin/\|make<cr>
autocmd FileType html nnoremap <buffer> ,r :!firefox %<cr><cr>
autocmd FileType php nnoremap <buffer> ,r :exe(GetUrl(expand("%:p")))<cr><cr>
" autocmd FileType cc,h nnoremap <buffer> ,r :!./"%:r"<cr>

" Language specific mappings
imap ,s š
imap ,z ž
imap ,c č
" For latex
autocmd FileType tex imap <buffer> ,c \v c
autocmd FileType tex imap <buffer> ,z \v z
autocmd FileType tex imap <buffer> ,s \v s

function! GetUrl(filename)
    let s = substitute(a:filename, ".*\/http\/", "", "")
    let s = substitute(s, "^", "!firefox http://localhost/", "")
    return s
endfunction

" nnoremap <leader>lv :!mupdf "%:r".pdf<cr><cr>
" map <A-c> :w<CR>:!clear;g++ -Wall %<CR> 
" map <A-v> :!clear;./a.out<CR>
" map comp :call MakeCpp()
" map ,c :w<CR>comp<C-m>
"map <F5> :w<CR>:!clear;g++ -Wall %<CR>:!clear;./a.out<CR>
map ,a :!./a.out<cr>

vmap i> >gv<esc>o}<esc>gvo<esc>O{<esc><C-o><C-o>
vmap l> >gv<esc>o}<esc>gvo<esc>O{<esc>o

map cn :cn<C-m>
map cp :cp<C-m>
map cr :cr<C-m>
map cla :cla<C-m>
map cc :cc<C-m>

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
      " set makeprg=./coverage.rb\ %
      " set errorformat=%f:%l:\ %m
      " silent make
      " if len(getqflist()) > 0
      "   call AlertUser("All tests passed, but these cases are not covered", "warning")
      "   copen
      " else
      "   cclose
      " endif
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

function! MakeCpp()
	set makeprg=g++\ -Wall\ -ansi\ -pedantic\ %\ -o\ %<
	make
	set makeprg=make
endfunction

function! InsertMissingBracket(mode)
	let lin = getline(".")
	let curs = col(".")

	"list contains all the characters we have to close
	let list = []
	let listLength = 0
	let index = 0
	while index < strlen(lin)
		if curs > index + 1
			if lin[index] == "("
				let listLength = listLength + 1
				call add(list, ")")
			elseif lin[index] == "["
				let listLength = listLength + 1
				call add(list, "]")
			elseif lin[index] == "{"
				let listLength = listLength + 1
				call add(list, "}")
			elseif lin[index] == "\""
				if listLength - 1 >= 0
					if list[listLength - 1] == "\""
						let listLength = listLength - 1
						let i = remove(list, listLength)
					else
						let listLength = listLength + 1
						call add(list, "\"")
					endif
				else
					let listLength = listLength + 1
					call add(list, "\"")
				endif
			elseif lin[index] == "'"
				if listLength - 1 >= 0
					if list[listLength - 1] == "'"
						let listLength = listLength - 1
						let i = remove(list, listLength)
					else
						let listLength = listLength + 1
						call add(list, "'")
					endif
				else
					let listLength = listLength + 1
					call add(list, "'")
				endif
			elseif lin[index] == ")" || lin[index] == "]" || lin[index] == "}"
				let listLength = listLength - 1
				let i = remove(list, listLength)
			endif
		endif
		let index += 1
	endwhile

	if a:mode == "1"
		let newList = []
		let index = listLength
		let stringToAdd = ""
		while index > 0
			let index = index - 1
			call add(newList, list[index])
		endwhile
		let stringToAdd = join(newList, "")
		return stringToAdd
	elseif a:mode == "2"
		let newList = []
		let tooMuch = 0
		let index = curs - 2
		let stringToAdd = ''
		while index < strlen(lin)
			let index = index + 1
			if lin[index] == ")" || lin[index] == "]" || lin[index] == "}" || lin[index] == "\"" || lin[index] == "'"
				let tooMuch = tooMuch + 1
			endif
		endwhile

		let index = listLength
		while index > tooMuch
			let index = index - 1
			call add(newList, list[index])
		endwhile
		let stringToAdd = join(newList, "")
		return stringToAdd
	endif
endfunction

colorscheme dummy
if has('gui_running')
	" set guifont=inconsolata
	set guifont=Terminus\ 9
	set completeopt=longest
	" inoremap <expr> <CR> pumvisible() ? '<C-y>' : '<C-g>u<CR>'
	" inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
	" inoremap <expr> <C-p> pumvisible() ? '<C-p>' :  '<C-p><C-r>=pumvisible() ? "\<lt>Up>" : ""<CR>'
	" inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
endif


nmap ,e :call NumberToggle()<CR>h
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap ,<space> :noh<cr>
" nnoremap <tab> %
" vnoremap <tab> %
map <F5> :mksession! ~/.vim/vim_session <cr>
map <F6> :source ~/.vim/vim_session <cr>
" silent execute '!mkdir -p ~/.vim/.vim_backups'
" set backupdir=~/.vim/vim_backups//
" set directory=~/.vim/vim_backups//
map ,l <esc>:set list!<cr>
set listchars=tab:\>\ 
highlight SpecialKey guifg=#333333
highlight ExtraWhitespace guifg=#333333

function! NumberToggle()
	if exists("&rnu")
		if &number
			setlocal relativenumber
		else
			setlocal number
		endif
	endif
endfunction

highlight ColorColumn ctermbg=darkblue ctermfg=white guibg=#592929
set colorcolumn=80

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

" autocmd BufRead *.h execute CheckHeaders(expand('%:t:r'))


" disable vi compatibility (emulation of old bugs)
set nocompatible
" use intelligent indentation for C
set smartindent
" configure tabwidth and insert spaces instead of tabs
"set shiftwidth=4     " indent also with 4 spaces
"set expandtab        " expand tabs to spaces
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */
" switch between header/source with F4
map ,h :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" goto definition with F12 
map ,d <C-]>
"set iskeyword=@,48-57,_,192-255,(,),=,[,],<,>,: 
" set iskeyword+=_,-,<,>,$,@,%,#
" set iskeyword-=_,<,>,%,#
set iskeyword=@,48-57,_,192-255

set switchbuf=useopen

autocmd! BufWritePost .vimrc source %

botright cwindow

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" autocmd BufAdd * match OverLength /\%81v.\+/
" match OverLength /\%81v.\+/

highlight Typedef guifg=#592929


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
  echo " " . a:text . " "

  redraw
endfunction
" command! NyanMe call NyanMe()
"
nnoremap <space>v <Plug>VimroomToggle

vnoremap <silent> zz :<C-u>call setpos('.',[0,(line("'>")-line("'<"))/2+line("'<"),0,0])<Bar>normal! zzgv<CR>
vnoremap <silent> zt :<C-u>call setpos('.',[0,line("'<"),0,0])<Bar>normal! ztgv<CR>
vnoremap <silent> zb :<C-u>call setpos('.',[0,line("'>"),0,0])<Bar>normal! zbgv<CR>
