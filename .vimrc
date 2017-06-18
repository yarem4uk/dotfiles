source ~/dotfiles/vim/abbreviations.vim

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'christoomey/vim-system-copy'
Plugin 'vim-scripts/ReplaceWithRegister'

Plugin 'tpope/vim-sensible'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'chriskempson/base16-vim'
Plugin 'foosoft/vim-argwrap'
Plugin 'SirVer/ultisnips'

" html
Plugin 'othree/html5.vim'
Plugin 'mattn/emmet-vim'

" js
Plugin 'pangloss/vim-javascript'
Plugin 'moll/vim-node'

" php 
Plugin '2072/PHP-Indenting-for-VIm'

call vundle#end()

filetype plugin indent on

set number
" set ruler
" syntax enable
syntax on
set wrap
set linebreak
set cursorline
set showcmd

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
" let g:syntastic_javascript_checkers=['eslint']

set expandtab
set softtabstop=4
set shiftwidth=4
" set autoindent
set smartindent

set t_Co=256

set ignorecase
set smartcase

set laststatus=2

set foldmethod=indent
set foldlevelstart=99

let mapleader=","

if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
endif

" EMMET

" let g:user_emmet_next_key = '<C-n>'
" let g:user_emmet_prev_key = '<C-b>'

" imap <expr> <C-i> emmet#expandAbbrIntelligent("\<C-i>")

" ULTISNIPS
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger='<Tab>'
" let g:UltiSnipsExpandTrigger='<C-i>'

" NERDTREE
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeIgnore = ['\.pyc$']
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1

noremap <silent> <leader><leader> :NERDTreeToggle<CR>
noremap <C-\> :NERDTreeFind<CR>
" autocmd vimenter * NERDTree /home/alex/hexlet/php/cookies/
" autocmd vimenter * NERDTree /home/alex/hexlet/js/prototypes/
autocmd vimenter * NERDTree /home/alex/hexlet/js/errors/

" CTRLP
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_working_path_mode = 'ra'

let g:bufExplorerDisableDefaultKeyMapping=1
let g:bufExplorerShowRelativePath=1
nnoremap <leader>b :BufExplorer<CR>


"COMMAND MAPPINGS

noremap Y y$

noremap <Space><Space> <C-^> 

" Map ctrl-movement keys to window switching
noremap <C-k> <C-w><Up>
noremap <C-j> <C-w><Down>
noremap <C-l> <C-w><Right>
noremap <C-h> <C-w><Left>

" Allows you to tintersudo pass and save the file 
" when you forgot to open your file with sudo 
cnoremap w!! %!sudo tee > /dev/null %

cnoremap <UP>    <NOP>
cnoremap <Down>  <NOP>
cnoremap <Left>  <NOP>
cnoremap <Right> <NOP>
cnoremap <bs>    <NOP>

cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <UP>
cnoremap <C-n> <Down>

" inoremap <esc>    <NOP>
inoremap <UP>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <bs>    <NOP>

noremap <UP>    <NOP>
noremap <Down>  <NOP>
noremap <Left>  <NOP>
noremap <Right> <NOP>
noremap <bs>    <NOP>
noremap <q>     <NOP>

noremap k gk
noremap gk k
noremap j gj
noremap gj j

nnoremap ' `
nnoremap ` '

" Quickly select the text I just pasted.
noremap gV `[v`]

" Toggle paste modle
noremap <silent> <F4> :set invpaste<CR>:set paste?<CR> 
inoremap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" Make Ctrl-e jump to the end of the line in the insert mode.
inoremap <C-e> <C-o>$


" MOVEMENT

onoremap <silent>in :<C-u>normal! f(vi(<cr>

" LEADER MAPING

" upper/lower word
noremap <leader>u mQviwU'Q
noremap <leader>l mQviwu'Q

vnoremap <leader>y :w! ~/.vbuf<cr>
noremap <leader>y :.w! ~/.vbuf<cr>
noremap <leader>p :r ~/.vbuf<cr>

inoremap <leader>w <esc>:w<CR>
noremap <leader>w :w<CR>

noremap <silent> <leader>q :q!<CR>

noremap <leader>H :vsplit<cr>
noremap <leader>o :only<cr>

noremap <leader>ev :vsplit $MYVIMRC<CR>
noremap <leader>sv :source $MYVIMRC<CR>

nnoremap <leader>N :setlocal number!<cr>
nnoremap <silent> <leader>a :ArgWrap<CR>

nnoremap <leader>f :normal! gg=G``<CR>

" AUTOCOMANDS
au bufread,bufnewfile *.js setl sts=2 sw=2
au bufread,bufnewfile *.html setl sts=2 sw=2
au BufRead,BufNewFile *.phtml setl ft=php sts=2 sw=2
au BufRead,BufNewFile *.phtml nnoremap <leader>h :call SetHTML()<cr>

function! SetHTML()
    if (&ft == 'php')
        set ft=html
    elseif (&ft == 'html')
        set ft=php
    endif
endfunc

" au bufread *.phtml call Try()
" function! Try()
"    :echom 'hellow'
" endfunc
