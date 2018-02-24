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
" Plugin 'bling/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
Plugin 'itchyny/lightline.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'foosoft/vim-argwrap'
Plugin 'SirVer/ultisnips'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

" linter
Plugin 'w0rp/ale'
" Plugin 'scrooloose/syntastic'
 
" html
Plugin 'othree/html5.vim'
Plugin 'mattn/emmet-vim'
Plugin 'elzr/vim-json'
" js
Plugin 'pangloss/vim-javascript'
Plugin 'moll/vim-node'

" php 
Plugin '2072/PHP-Indenting-for-VIm'

" blade.php
Plugin 'jwalton512/vim-blade'

" yaml
Plugin 'stephpy/vim-yaml'
call vundle#end()

filetype plugin indent on

set ttyfast
set lazyredraw

set number
set ruler
" syntax enable
syntax on
set wrap
set linebreak
set cursorline
set showcmd
set noshowmode

set expandtab
set softtabstop=2
set shiftwidth=2
" set autoindent
set smartindent

set t_Co=256
" set cmdheight=2
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

" ALE linter
let g:ale_php_phpcs_standard = 'PSR2'
let g:ale_linters = {
      \   'markdown': [],
      \   'javascript': ['eslint', 'flow'],
      \}
" let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 0
let g:ale_sign_error = '•'
let g:ale_sign_warning = '.'
highlight link ALEWarningSign Title
highlight link ALEErrorSign night
" highlight clear ALEWarningSign
let g:ale_set_highlights = 0
" let g:ale_sign_column_always = 1

nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>
 

" LIGHGLINE
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" STATUSLINE
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
 
" let g:syntastic_always_populate_loc_list = 0
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 1
" let g:syntastic_javascript_checkers=['eslint']

" let g:airline_section_z = ''
" let g:airline_section_y = ''
 
" ULTISNIPS
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger='<Tab>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

" NERDTREE
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeIgnore = ['\.pyc$']
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
" let NERDTreeShowBookmarks=1

noremap <silent> <leader><leader> :NERDTreeToggle<CR>
noremap <C-\> :NERDTreeFind<CR>
" autocmd vimenter * NERDTree /home/alex/hexlet/php/cookies/
" autocmd vimenter * NERDTree /home/alex/hexlet/js/
" autocmd vimenter * NERDTree /home/alex/unit/web/
" autocmd vimenter * NERDTree /home/alex/laravel/
" autocmd vimenter * NERDTree /home/alex/hexlet/php/fraim/
" autocmd vimenter * NERDTree /home/alex/app/

" BUFEXPLORER
let g:bufExplorerDisableDefaultKeyMapping=1
let g:bufExplorerShowRelativePath=1
nnoremap <leader>b :BufExplorer<CR>

" EMMET
" let g:user_emmet_next_key = '<C-n>'
" let g:user_emmet_prev_key = '<C-b>'
" imap <expr> <C-i> emmet#expandAbbrIntelligent("\<C-i>")

" FZF
nnoremap <C-p> :Files<cr>
nnoremap ; :Buffers<cr>

" COMMAND MAPPINGS

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
inoremap <C-f> <C-x><C-f>

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
noremap <silent> <leader>o :only<cr>

noremap <leader>v :vsplit $MYVIMRC<CR>
noremap <leader>sv :source $MYVIMRC<CR>

nnoremap <leader>N :setlocal number!<cr>
nnoremap <silent> <leader>a :ArgWrap<CR>

nnoremap <leader>f :normal! gg=G``<CR>

nnoremap <leader>( :normal! a(<esc>f;i)<esc>
" nnoremap <leader><space> :sh<esc>
nnoremap <leader>e <C-z>
nnoremap <Leader>F :CtrlPFunky<Cr>
"
" AUTOCOMANDS
" au bufread,bufnewfile,BufLeave *.php set dictionary+=~/.vim/dic/php_list
" set dictionary+=~/.vim/dic/php

" au BufNewFile,BufRead *.blade.php setl ft=html
au bufread,bufnewfile sh setl sts=2 sw=2
au bufread,bufnewfile zsh setl sts=2 sw=2
au bufread,bufnewfile vim setl sts=2 sw=2
au bufread,bufnewfile *.js setl sts=2 sw=2
au bufread,bufnewfile *.php setl sts=2 sw=2
au bufread,bufnewfile *.html setl sts=2 sw=2
au BufRead,BufNewFile *.phtml setl ft=php sts=2 sw=2
au BufRead,BufNewFile *.phtml nnoremap <leader>h :call SetHTML()<cr>

" if (&ft == 'html')
"   let g:user_emmet_next_key = '<C-j>'
"   let g:user_emmet_prev_key = '<C-k>'
" endif

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
"
"symbols
"✗✘

