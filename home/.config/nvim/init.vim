if !isdirectory(expand("~/.config/nvim/autoload"))
  !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Plug 'tpope/vim-fugitive'
" Plug 'kien/ctrlp.vim'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tomtom/tcomment_vim'
Plug 'bling/vim-airline'
Plug 'tomasr/molokai'
" Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" Plug 'lervag/vim-latex'
" Plug 'scrooloose/syntastic'
" Plug 'sjl/gundo.vim'
" Plug 'derekwyatt/vim-scala'
Plug 'rust-lang/rust.vim'
" Plug 'fatih/vim-go'
Plug 'mileszs/ack.vim'
" Plug 'JuliaLang/julia-vim'
call plug#end()

map <C-j> 5j
map <C-k> 5k

set directory=$HOME/.vim/backup/,~/.tmp,~/tmp,/tmp
set backupdir=$HOME/.vim/backup/,~/.tmp,~/tmp,/tmp
set pastetoggle=<F2>
set showcmd
set cmdheight=2
set number
set autoindent
set ruler
let mapleader = ","
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set scrolloff=3
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79
au FileType python set foldmethod=indent foldnestmax=2 foldignore=
nmap <leader>i :set list!<CR>
set listchars=eol:¬,tab:▸\ 
nnoremap <F3> :set nonumber!<CR>

nnoremap j gj
nnoremap k gk
nnoremap ; :

au FocusLost * :wa
nnoremap <leader>ev :tabe $MYVIMRC<cr>
nnoremap <leader>sv :so $HOME/.config/nvim/init.vim<cr>
inoremap jb <ESC>

" Quick movement between windows
nnoremap <C-n> <C-w>h
nnoremap <C-s> <C-w>l
nnoremap <C-g> <C-w>k
nnoremap <C-m> <C-w>j

" nnoremap <leader>h <C-w>h
" nnoremap <leader>j <C-w>j
" nnoremap <leader>k <C-w>k
" nnoremap <leader>l <C-w>l

nnoremap <leader>h gT
nnoremap <leader>l gt

" easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

nnoremap <F5> :GundoToggle<CR>

map <leader>c<space> :TComment<CR>
map <leader>cb :TCommentBlock<CR>

nmap <Space> i_<Esc>r
map <leader>e :e <C-R>=expand("%:h")<cr>/
map <leader>w :w <C-R>=expand("%:h")<cr>/
" map <leader>sa :sav <C-R>=expand("%:h")<cr>/
map <leader>te :tabe <C-R>=expand("%:h")<cr>/
map <leader>tn :tabnew <C-R>=expand("%:h")<cr>/
map <leader>tt :tabnew <cr>

map <C-p> :FZF<cr>

let g:rehash256 = 1
colorscheme molokai

let g:terminal_color_0  = '#2e3436'
let g:terminal_color_1  = '#cc0000'
let g:terminal_color_2  = '#4e9a06'
let g:terminal_color_3  = '#c4a000'
let g:terminal_color_4  = '#3465a4'
let g:terminal_color_5  = '#75507b'
let g:terminal_color_6  = '#0b939b'
let g:terminal_color_7  = '#d3d7cf'
let g:terminal_color_8  = '#555753'
let g:terminal_color_9  = '#ef2929'
let g:terminal_color_10 = '#8ae234'
let g:terminal_color_11 = '#fce94f'
let g:terminal_color_12 = '#729fcf'
let g:terminal_color_13 = '#ad7fa8'
let g:terminal_color_14 = '#00f5e9'
let g:terminal_color_15 = '#eeeeec'

if executable('rg')
  let g:ackprg = 'rg --vimgrep --no-heading'
endif
nnoremap <leader>g :Ack<space>
