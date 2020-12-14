 source ~/.config/nvim/abbreviations.vim

set nocompatible
filetype off
syntax enable

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'jlanzarotta/bufexplorer'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'foosoft/vim-argwrap'
Plug 'SirVer/ultisnips'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

"themes
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'

" Linter
Plug 'w0rp/ale'

" html
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'

" js
Plug 'pangloss/vim-javascript'
Plug 'moll/vim-node'
Plug 'briancollins/vim-jst'
Plug 'elzr/vim-json'

" pug
Plug 'digitaltoad/vim-pug'

" php
Plug '2072/PHP-Indenting-for-VIm'

" blade.php
Plug 'jwalton512/vim-blade'

" yaml
Plug 'stephpy/vim-yaml'

" vue
Plug 'posva/vim-vue'
Plug 'leafOfTree/vim-vue-plugin'

Plug 'jpalardy/vim-slime'
call plug#end()

" let g:nord_cursor_line_number_background = 1
" let g:nord_italic_comments = 1
" let g:nord_uniform_diff_background = 1
" colorscheme nord

let g:gruvbox_contrast_dark = "soft"
let g:gruvbox_sign_column = "bg0"
colorscheme gruvbox

filetype plugin indent on

set ttyfast
set lazyredraw

set number
set ruler
set wrap
set linebreak
set cursorline
set showcmd
set showmatch
set noshowmode
set nojoinspaces

set expandtab
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent

set t_Co=256
set nohls
set ignorecase
set smartcase
set laststatus=2

set undodir=~/.config/nvim/backups
set undofile

set foldmethod=indent
set foldlevelstart=99

let mapleader="\<Space>"

" slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": ":.2"}
let g:slime_dont_ask_default = 1
nmap <silent> <leader>r :%SlimeSend<cr>

" ALE linter
let g:ale_php_phpcs_standard = 'PSR2'

let g:ale_linters = {
      \   'markdown': [],
      \   'javascript': ['eslint'],
      \   'python': ['flake8'],
      \   'html': ['prettier'],
      \}

let g:ale_fixers = {
      \  '*': ['remove_trailing_lines', 'trim_whitespace'],
      \  'javascript': ['prettier'],
      \}

" \ 'python': ['black'],

let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 0
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = 'ί'
let g:ale_set_highlights = 0

nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

" ULTISNIPS
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips']
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger='<Tab>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

" NERDTREE
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeIgnore = ['\.pyc$', 'node_modules$', '__pycache__']
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
" let NERDTreeShowBookmarks=1

noremap <C-\> :NERDTreeFind<CR>

noremap <silent> ,, :NERDTreeToggle ~/projects/soffice/<CR>
" autocmd vimenter * NERDTree ~/app/

" BUFEXPLORER
let g:bufExplorerDisableDefaultKeyMapping=1
let g:bufExplorerShowRelativePath=1

" EMMET
" let g:user_emmet_leader_key=','

" FZF
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8}}
let g:fzf_preview_window = []

nnoremap <C-p> :Files<cr>
nnoremap <leader>; :Buffers<cr>
" inoremap <expr> <C-j> fzf#vim#complete('cat $HOME/.config/css.cfg')

" Tell ack.vim to use ripgrep instead
let g:ackprg = 'rg --vimgrep --no-heading'

" PYTHON
let g:python3_host_prog = '/usr/bin/python'


" COMMAND MAPPINGS
noremap Y y$

noremap <leader><leader> <C-^>

" Map ctrl-movement keys to window switching
noremap <C-k> <C-w><Up>
noremap <C-j> <C-w><Down>
noremap <C-l> <C-w><Right>
noremap <C-h> <C-w><Left>

" Allows you to tintersudo pass and save the file
" when you forgot to open your file with sudo
cnoremap w!! %!sudo tee > /dev/null %

cnoreabbrev ss %s/

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

" LIGHGLINE
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'
" let g:lightline = {
"       \ 'colorscheme': 'seoul256',
"       \ }

" Quickly select the text I just pasted.
noremap gV `[v`]

" Make Ctrl-e jump to the end of the line in the insert mode.
inoremap <C-e> <C-o>$
inoremap <C-f> <C-x><C-f>
inoremap <A-j> (
inoremap <A-k> )


" MOVEMENT
onoremap <silent>in :<C-u>normal! f(vi(<cr>
onoremap <silent>il :<C-u>normal! F)vi(<cr>
onoremap im i[

" LEADER MAPING

" upper/lower word
noremap <leader>u mQviwU'Q
noremap <leader>l mQviwu'Q

vnoremap <leader>y :w! ~/.vbuf<cr>
noremap <leader>y :.w! ~/.vbuf<cr>
noremap <leader>p :r ~/.vbuf<cr>

inoremap ,w <esc>:w<CR>
noremap ,w :w<CR>

noremap <silent> <leader>q :q!<CR>
noremap <silent> <leader>o :only<cr>

noremap <leader>v :vsplit $MYVIMRC<CR>
noremap <leader>sv :source $MYVIMRC<CR>

nnoremap <leader>N :setlocal number!<cr>
nnoremap <silent> <leader>a :ArgWrap<CR>

nnoremap <leader>f :normal!  gg=G``<CR>
nnoremap <leader>( :normal! a(<esc>f;i)<esc>
nnoremap <leader>e <C-z>

" au BufNewFile,BufRead *.blade.php setl ft=html
au BufNewFile,BufRead *.ejs set ft=html

au BufNewFile,BufRead *.ms set filetype=groff
au BufNewFile,BufRead *.ejs set filetype=html
au bufread,bufnewfile *.py setl sts=4 sw=4 tw=79
au bufread,bufnewfile *.html setl sts=2 sw=2 tw=79
au BufRead,BufNewFile *.phtml setl ft=php
au BufRead,BufNewFile *.phtml nnoremap <leader>h :call SetHTML()<cr>
" au BufRead,BufNewFile *.vue nnoremap <leader>h :call SetCss()<cr>

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

au BufNewFile *.pl 0r ~/.vim/templates/skeleton.pl

" function! SetHTML()
"   if (&ft == 'php')
"     set ft=html
"   elseif (&ft == 'html')
"     set ft=php
"   endif
" endfunc

" function! SetCss()
"   if (&ft == 'vue')
"     set ft=css
"   elseif (&ft == 'css')
"     set ft=vue
"   endif
" endfunc

" au bufread *.phtml call Try()
" function! Try()
"    :echom 'hellow'
" endfunc
"
"symbols
"✘✓
