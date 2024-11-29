" Reload hopefully
map <C-j> 5j
map <C-k> 5k

" Install vim-plug automatically
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'morhetz/gruvbox'
call plug#end()
autocmd vimenter * ++nested colorscheme gruvbox

set directory=/tmp
set backupdir=/tmp
set pastetoggle=<F2>
set showcmd
set cmdheight=2
set number                     " Show current line number
set relativenumber             " Show relative line numbers
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
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=100
au FileType python set foldmethod=indent foldnestmax=2 foldignore=
" autocmd! BufWritePost * Neomake
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
nmap <C-x> <C-w>j

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

" nmap <Space> i_<Esc>r
map <leader>e :e <C-R>=expand("%:h")<cr>/
" map <leader>w :w <C-R>=expand("%:h")<cr>/
map <leader>sa :sav <C-R>=expand("%:h")<cr>/
map <leader>te :tabe <C-R>=expand("%:h")<cr>/
map <leader>tn :tabnew <C-R>=expand("%:h")<cr>/
map <leader>tt :tabnew <cr>

map <c-p> :FZF -m --bind=ctrl-z:toggle <CR>
let g:fzf_buffers_jump = 1

let g:rehash256 = 1

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

" nnoremap <enter> za
" vnoremap <enter> zf

set scrolloff=3

" Repaint syntax highlighting
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>

" Smartcase search
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

" autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
" au FileType python setlocal formatprg=autopep8\ -
" let g:neomake_python_enabled_makers = ['pep8', 'flake8']
" let g:deoplete#enable_at_startup = 1
" let g:python3_host_prog = '/Users/jasonkni/src/venvs/py3/bin/python'

" let g:autofmt_autosave = 1

" Quick-save
nmap <leader>w :w<CR>
set hidden

noremap <silent> H :call LanguageClient_textDocument_hover()<CR>
noremap <silent> Z :call LanguageClient_textDocument_definition()<CR>
noremap <silent> R :call LanguageClient_textDocument_rename()<CR>
noremap <silent> S :call LanugageClient_textDocument_documentSymbol()<CR>

" Follow Rust code style rules
au Filetype rust set colorcolumn=100
autocmd BufRead *.md set filetype=markdown
