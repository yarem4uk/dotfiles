set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'mattn/emmet-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'moll/vim-node'


Plugin 'tpope/vim-git'

call vundle#end()
filetype plugin indent on

set guifont="DejaVu Sans Mono"
set number
" set ruler
" syntax enable
syntax on
set wrap
set linebreak
set cursorline
set showcmd

set expandtab
set softtabstop=4
set shiftwidth=4
" set autoindent
set smartindent

set t_Co=256

set ignorecase
set smartcase

set laststatus=2
" let g:airline_theme='dark' 

" set background=dark
" colorscheme material-theme
colorscheme jellybeans

let mapleader=","

noremap Y y$
" upper/lower word
nmap <leader>u mQviwU'Q
nmap <leader>l mQviwu'Q

" nmap <leader>w :w<CR>
imap <C-s> :w<CR>
nmap <C-s> :w<CR>
nmap <leader>q :q<CR>

map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

nmap <silent> <leader><leader> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" set g:tagbar_ctags_bin
nmap <F8> :TagbarToggle<CR>

vmap <leader>y :w! ~/.vbuf<CR>
nmap <leader>y :.w! ~/.vbuf<CR>
nmap <leader>p :r ~/.vbuf<CR>

nmap <C-S-j> ddp

