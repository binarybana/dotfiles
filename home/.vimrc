set nocompatible              " be iMproved, required
filetype off                  " required

source ~/.vundlerc
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


set encoding=utf-8
filetype plugin indent on
syntax enable

map Q gq
set mouse=a

map <C-j> 5j
map <C-k> 5k

" Linux filesystem
set directory=$HOME/.vim/backup/,~/.tmp,~/tmp,/tmp
set backupdir=$HOME/.vim/backup/,~/.tmp,~/tmp,/tmp

set history=1000
set undolevels=1000
set noerrorbells
set pastetoggle=<F2>

set showcmd
set cmdheight=2
set number

set background=dark   " adapt colors for background
set selectmode=key

" Begin Jason Knight copying from stevelosh.com 'coming home to vim'
" Vim indent guides
"let g:indent_guides_start_level=2
"let g:indent_guides_start_size=1
"let g:indent_guides_guide_size=1
"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

"set modelines
set encoding=utf-8
set autoindent
set showmode
set hidden

set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,*.hi

set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

let mapleader = ","

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set smarttab
set shiftround
set nrformats-=octal

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set scrolloff=3

set wrap 
set textwidth=79 

set formatoptions=qrco
setlocal comments+=n:*,n:#

au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} setlocal fo+=awt
au BufRead,BufNewFile *.txt setlocal fo+=awt
au BufRead,BufNewFile *.{hsc,ghci,lhs} setlocal filetype=haskell
au BufRead,BufNewFile *.{pyx,pxd} setlocal filetype=python

au FileType rst setlocal comments=nb:*,n:-,n:*,n:+
au FileType rst set formatoptions+=tqnaw
au FileType rst set formatlistpat=^\\s*\\(\\d\\+\\\|[a-z]\\)[\\].)]\\s*

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79
au FileType python set foldmethod=indent foldnestmax=2 foldignore=

au Filetype tex setlocal fo+=awt
au Filetype cabal setlocal fo+=awt
au FileType make set noexpandtab

cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

map <F5> :call CompileLatex()<CR>
func! CompileLatex()
  exec "w" 
  exec "lcd %:p:h"
  exec "!latbib %:t "
  exec "i" 
endfunc

" Here, add a t to format options if we want to " auto insert linebreaks after
" 79 characters

" Shortcut to rapidly toggle `set list`
nmap <leader>i :set list!<CR>
set listchars=eol:¬,tab:▸\ 

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
highlight LineNr guifg=grey
highlight NonText ctermfg=grey
highlight SpecialKey ctermfg=grey
highlight LineNr ctermfg=grey

" :map <F3> :w !detex \| wc -w<CR>
nnoremap <F3> :set nonumber!<CR>

nnoremap j gj
nnoremap k gk

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap ; :

au FocusLost * :wa

nnoremap <leader>v V`]

nnoremap <leader>ev :tabe $MYVIMRC<cr>
nnoremap <leader>sv :so $HOME/.vimrc<cr>

inoremap jb <ESC>
inoremap ,. <ESC>  
vnoremap ,. <ESC>  
" nnoremap <leader>w <C-w>v<C-w>l

nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

nnoremap <leader>h gT
nnoremap <leader>l gt

" More of Jason's stuff below VVVV

nmap <Space> i_<Esc>r
map <leader>e :e <C-R>=expand("%:h")<cr>/
map <leader>w :w <C-R>=expand("%:h")<cr>/
map <leader>sa :sav <C-R>=expand("%:h")<cr>/
map <leader>te :tabe <C-R>=expand("%:h")<cr>/
map <leader>tn :tabnew <C-R>=expand("%:h")<cr>/
map <leader>tt :tabnew <cr>

vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

nnoremap Y y$

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u26ad"
  endif
endif

" easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

let g:LatexBox_Folding=1

"imap <buffer> [[ \begin{
"imap <buffer> ]] <Plug>LatexCloseCurEnv
"vmap <buffer> <F7> <Plug>LatexWrapSelection
"nmap <buffer> <F5> <Plug>LatexChangeEnv
"vmap <buffer> <S-F7> <Plug>LatexEnvWrapSelection
"imap <buffer> (( \eqref{

nnoremap <enter> za
vnoremap <enter> zf

noremap <leader>/ <Esc>:syntax sync fromstart<CR>

nnoremap <F5> :GundoToggle<CR>

map <leader>c<space> :TComment<CR>
map <leader>cb :TCommentBlock<CR>

call tcomment#DefineType('julia',          '# %s'            )
call tcomment#DefineType('julia_block',    "#=%s=#\n   "      )
call tcomment#DefineType('julia_inline',   '#= %s =#'         )

" let g:syntastic_quiet_messages = {
"     \ "!level":  "warnings",
"     \ "type":    "style",
"     \ "regex":   'length' }

noremap <leader>[ :SyntasticToggleMode<CR>
noremap <leader>] :SyntasticCheck<CR>

let g:syntastic_mode_map = { "passive_filetypes": ["scala"] }

set t_Co=256
"colorscheme darkburn
let g:rehash256 = 1
colorscheme molokai

