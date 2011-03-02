filetype off 
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()



set number
set cursorline
set hidden
set noexpandtab
set tabstop=4
set sw=4
set autoindent
set incsearch
set ignorecase
syntax on
"autocmd BufEnter * lcd %:p:h
let mapleader=","
set guioptions-=m
set guioptions-=T
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=b


set guicursor=i:block-Cursor
set guicursor=n-v-c:blinkon0


let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_WinWidth = 40
let Tlist_Exist_OnlyWindow = 1



"autocmd VimEnter * NERDTree
map <silent> <A-s> :NERDTreeToggle<CR>
map <silent> <A-f> :TlistToggle<CR>
map <silent> <A-d> :NERDTreeToggle\|TlistToggle<CR>

let g:miniBufExplMapCTabSwitchBufs = 1



set nocp
"filetype plugin on
"autocmd BufNewFile,BufRead,BufEnter *.cpp,*.hpp,*.cxx set omnifunc=omni#cpp#complete#Main
"let OmniCpp_SelectFirstItem = 1
"imap <C-Space> <C-x><C-o>
imap <S-Space> <C-R>=strftime(" ")<CR>

map ,m :w\|!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>:TlistUpdate<CR>a<esc>
let g:clang_periodic_quickfix = 1
let g:clang_snippets = 1
let g:clang_complete_auto = 0
imap <C-Space> <C-x><C-u>

nnoremap <leader>pt <esc>:CommandT \/home\/andr3\/projects<cr>
nnoremap <leader>b ,lj

nnoremap S lr<cr>k$
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <A-h> <C-w>>
map <A-j> <C-w>+
map <A-k> <C-w>-
map <A-l> <C-w><
" map gt <C-tab>
" map gT <C-S-tab>
map gt <esc>:bn<cr>
map gT <esc>:bp<cr>
imap <C-l> <esc>V
imap <C-j> <esc>/["\]}')>]<CR>a
map <A-j> V%<%dd<C-o>Vkd
inoremap sj ""<esc>i
inoremap qj ''<esc>i
inoremap pj ()<esc>i
inoremap cj []<esc>i
inoremap tj <><esc>i
inoremap bj {}<esc>i
inoremap fj {<cr><bs>}<esc>ko
map ;; <esc>:s/\s\+$//e<cr>A;<esc>
imap ;; <esc>:s/\s\+$//e<cr>A;<esc>
nnoremap <silent> P :YRShow<CR>
" let g:yankring_paste_n_akey = '<m-A>'
nmap <silent> <leader>n :nohlsearch<CR>
nmap ,g :source $MYGVIMRC<CR>
imap <A-k> <esc>Vj%dG
imap <A-l> <esc>Vj%dGo<esc>pjj:w\|!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>:TlistUpdate<CR>a
"map ; :

ino <S-Enter> <c-r>=InsertMissingBracket("2")<cr><esc>o{<esc>o<esc>o}<esc>ka<tab>
ino <C-Enter> <c-r>=InsertMissingBracket("2")<cr><esc>A;<esc>o
ino <C-k> <c-r>=InsertMissingBracket("2")<cr>


map <A-c> :w<CR>:!clear;g++ -Wall %<CR> 
map <A-v> :!clear;./a.out<CR>

"map <F5> :w<CR>:!clear;g++ -Wall %<CR>:!clear;./a.out<CR>

map comp :call MakeCpp()
map ,c :w<CR>comp<C-m>

"map run :!./%<
"map ,r run<C-m>
"
map ,w :w<cr>
"map ,c :SCCompile -lGLU -lglut<cr>
map ,r :SCCompileRun<cr>
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

if has('gui_running')
	colorscheme liquidcarbon
	" set guifont=inconsolata
	set guifont=Terminus\ 9
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
nnoremap <tab> %
vnoremap <tab> %
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
