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
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/tComment'
Bundle 'tpope/vim-fugitive'
Bundle 'sjl/gundo.vim'
Bundle 'chrismetcalf/vim-yankring'
Bundle 'vim-scripts/AutoComplPop'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'mattn/zencoding-vim'
Bundle 'gregsexton/gitv'
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/UltiSnips'
Bundle 'kien/ctrlp.vim'
" vim-scripts

" Non Github repos

filetype plugin indent on
"}

"Setting up the statusline
"{
set statusline=
set statusline+=%f\ %2*%m\ %1*%h
set statusline+=%#warningmsg#
set statusline+=%{fugitive#statusline()}
set statusline+=%*
set statusline+=%r%=[%{&encoding}\ %{&fileformat}\ %{strlen(&ft)?&ft:'none'}]\ %12.(%c:%l/%L%)\ [%p%%]
set laststatus=2
"}

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
" Setting maximum width to 80 culomns
" set textwidth=80
" set wrap
" Do the coloring
syntax on
" }
"}


set path+=/usr/include/c++/4.6/
set path+=/usr/include/
set path+=/usr/include/qt4/
set path+=/usr/include/qt4/QtCore/
set path+=/usr/include/qt4/QtGui/
set path+=/home/andr3/projects/cc/libs/gtest/gtest-1.6.0/include/
exec "set path+=" . getcwd() . "/inc/"

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

nnoremap <silent> <leader>p :YRShow<CR>

set runtimepath+=~/.vim/ultiSnips
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "ultiSnips"]


" Smart pasting
nnoremap gp `[v`]
nnoremap p pv`]=<C-o>
nnoremap P Pv`]=
nnoremap \p "_ddPV`]
" Select last pasted text
nnoremap <leader>V V`]

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
nnoremap S lr<cr>k$

onoremap ad a[
onoremap id i[
" Insert common pairs and get cursor between them
inoremap sj ""<esc>i
inoremap qj ''<esc>i
inoremap pj ()<esc>i
inoremap cj []<esc>i
inoremap tj <><esc>i
inoremap bj {}<esc>i
inoremap dj $$<esc>i
inoremap fj {<cr><bs><bs>}<esc>ko
" Jump over next closing brace
inoremap <C-j> <esc>/\v["\]}')>\$]<CR>:nohlsearch<cr>a

" Toggle folds with space
nnoremap <space> za
vnoremap <space> za

" Smart moving between windows
nnoremap <C-h> <C-w>h
noremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <A-h> <C-w>>
nnoremap <A-j> <C-w>+
nnoremap <A-k> <C-w>-
nnoremap <A-l> <C-w><

" Move to next and previous buffer
map gt <esc>:bn<cr>
map gT <esc>:bp<cr>
" inoremap <A-j> V%<%dd<C-o>Vkd

" Toggle case with gu
map gu g~

" Insert ; on double tap
map ;; <esc>:s/\s\+$//e<cr>A;<esc>;
imap ;; <esc>:s/\s\+$//e<cr>A;<esc>
" let g:yankring_paste_n_akey = '<m-A>'
imap <A-k> <esc>Vj%dG
imap <A-l> <esc>Vj%dGo<esc>pjj:w\|!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>:TlistUpdate<CR>a
"map ; :

ino <S-Enter> <c-r>=InsertMissingBracket("2")<cr><esc>o{<esc>o<esc>o}<esc>ka<tab>
ino <C-Enter> <c-r>=InsertMissingBracket("2")<cr><esc>A;<esc>o
ino <C-k> <c-r>=InsertMissingBracket("2")<cr>


map ,w :w<cr>
nmap ,v :source $MYVIMRC<CR>
" nnoremap <buffer> ,c :!cd bin/ && make<cr>
autocmd FileType *.cc,*.h nnoremap <buffer> ,c :!cd bin/\|make<cr>
autocmd FileType tex nnoremap <buffer> ,c :!pdflatex %<cr>
" map ,r :!./%<<cr>
autocmd FileType html nnoremap <buffer> ,r :!firefox %<cr><cr>
autocmd FileType php nnoremap <buffer> ,r :exe(GetUrl(expand("%:p")))<cr><cr>
autocmd FileType cc,h nnoremap <buffer> ,r :!./"%:r"<cr>
autocmd FileType tex nnoremap <buffer> ,r :!mupdf "%:r".pdf<cr><cr>

" Language specific mappings
imap ,s š
imap ,z ž
imap ,c č
" For latex
autocmd FileType tex imap <buffer> ,c \v c
autocmd FileType tex imap <buffer> ,z \v z
autocmd FileType tex imap <buffer> ,s \v s
autocmd FileType tex imap <buffer> ,f \footnote{}<esc>i

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

" highlight ColorColumn ctermbg=darkblue ctermfg=white guibg=#592929
" set colorcolumn=80

function! Sp(dir, mode, ...)

  let split = 'sp'
  if a:dir == '1'
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
        if a:mode == '2'
          execute split . ' tests/' . f . '_test.cc'
        endif
        execute split . ' src/' . f . '.cc'
        execute split . ' inc/' . f . '.h'
      endif
    endfor
    let i = i - 1
  endwhile

  windo if expand('%') == '' | q | endif

endfunction

com! -nargs=* -complete=file Sp call Sp(0, 0, <f-args>)
com! -nargs=* -complete=file Vsp call Sp(1, 0, <f-args>)
com! -nargs=* -complete=file Eh call Sp(1, 1, <f-args>)
com! -nargs=* -complete=file Eht call Sp(1, 2, <f-args>)


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
set iskeyword+=_,-,<,>,$,@,%,#

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
autocmd BufAdd * match OverLength /\%81v.\+/
match OverLength /\%81v.\+/
