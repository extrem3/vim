filetype off 
filetype plugin on
call pathogen#runtime_append_all_bundles()
" call pathogen#helptags()

set path+=/usr/include/c++/4.5.2/ 
" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set statusline=
set statusline+=%f\ %2*%m\ %1*%h
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{fugitive#statusline()}
set statusline+=%*
set statusline+=%r%=[%{&encoding}\ %{&fileformat}\ %{strlen(&ft)?&ft:'none'}]\ %12.(%c:%l/%L%)
set laststatus=2



set undodir=~/.vim/tmp/undo// " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap// " swap files


set number
set cursorline
set hidden
set noexpandtab
set tabstop=4
set sw=4
set autoindent
set incsearch
set ignorecase
" set splitbelow "breaks gitv ;_;
" set splitright
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

" nnoremap <leader>s V`]
nnoremap <silent> <leader>s :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>
cmap w!! w !sudo tee % >/dev/null

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

"let g:miniBufExplMapCTabSwitchBufs = 1
let g:gundo_preview_bottom = 1
let g:gundo_width = 30
let g:gundo_preview_height = 30
nnoremap <leader>u :GundoToggle<cr>

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

set nocp
"autocmd BufNewFile,BufRead,BufEnter *.cpp,*.hpp,*.cxx set omnifunc=omni#cpp#complete#Main
"let OmniCpp_SelectFirstItem = 1
"imap <C-Space> <C-x><C-o>
imap <S-Space> <C-R>=strftime(" ")<CR>

map ,m :w\|!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>:TlistUpdate<CR>a<esc>
let g:clang_periodic_quickfix = 1
" fucks with snipmate, for some reason... :(
nnoremap ,f :ClangUpdateQuickFix()<cr>
" let g:clang_use_snipmate = 0
let g:clang_complete_auto = 1
let g:clang_complete_copen = 1
let g:clang_hl_errors = 1
let g:clang_snippets = 0
imap <C-Space> <C-x><C-u>

nnoremap <leader>pt <esc>:CommandT \/home\/andr3\/projects<cr>
nnoremap <leader>b ,lj





nnoremap gp `[v`]
nnoremap S lr<cr>k$
nnoremap <C-h> <C-w>h
noremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <A-h> <C-w>>
nnoremap <A-j> <C-w>+
nnoremap <A-k> <C-w>-
nnoremap <A-l> <C-w><
" map gt <C-tab>
" map gT <C-S-tab>
map gt <esc>:bn<cr>
map gT <esc>:bp<cr>
nnoremap n nzz
nnoremap N Nzz
imap <C-l> <esc>V
inoremap <C-j> <esc>/\v["\]}')>\$]<CR>:nohlsearch<cr>a
" inoremap <A-j> V%<%dd<C-o>Vkd
inoremap sj ""<esc>i
inoremap qj ''<esc>i
inoremap pj ()<esc>i
inoremap cj []<esc>i
inoremap tj <><esc>i
inoremap bj {}<esc>i
inoremap dj $$<esc>i
inoremap fj {<cr><bs>}<esc>ko
map ;; <esc>:s/\s\+$//e<cr>A;<esc>
imap ;; <esc>:s/\s\+$//e<cr>A;<esc>
nnoremap <silent> <leader>p :YRShow<CR>
" let g:yankring_paste_n_akey = '<m-A>'
nmap <silent> <leader>n :nohlsearch<CR>
nmap ,v :source $MYVIMRC<CR>
imap <A-k> <esc>Vj%dG
imap <A-l> <esc>Vj%dGo<esc>pjj:w\|!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>:TlistUpdate<CR>a
"map ; :

ino <S-Enter> <c-r>=InsertMissingBracket("2")<cr><esc>o{<esc>o<esc>o}<esc>ka<tab>
ino <C-Enter> <c-r>=InsertMissingBracket("2")<cr><esc>A;<esc>o
ino <C-k> <c-r>=InsertMissingBracket("2")<cr>


map ,w :w<cr>
"map ,c :SCCompile -lGLU -lglut<cr>
call SingleCompile#ChooseCompiler('cpp', 'clang++')
autocmd FileType cpp,cxx nnoremap <buffer> ,c :SCCompile -o %< -lcurlpp<cr>
autocmd FileType tex nnoremap <buffer> ,c :!pdflatex %<cr>
" map ,r :!./%<<cr>
autocmd FileType html nnoremap <buffer> ,r :!firefox %<cr><cr>
autocmd FileType php nnoremap <buffer> ,r :exe(GetUrl(expand("%:p")))<cr><cr>
autocmd FileType cpp,cxx nnoremap <buffer> ,r :!./"%:r"<cr>
autocmd FileType tex nnoremap <buffer> ,r :!mupdf "%:r".pdf<cr><cr>


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

colorscheme mustangpp 
if has('gui_running')
	" set guifont=inconsolata
	set guifont=Terminus\ 9
	set completeopt=longest,menuone
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
