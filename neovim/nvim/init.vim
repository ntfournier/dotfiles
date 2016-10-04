" Vimrc
" Plug {{{
call plug#begin(expand('~/.vim/plugged'))

" Editor features
Plug 'airblade/vim-gitgutter'
Plug 'djoshea/vim-autoread'
Plug 'editorconfig/editorconfig-vim'
Plug 'luochen1990/rainbow'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'

" Javascript
Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Navigation
Plug 'ctrlpvim/ctrlp.vim'

" Search
Plug 'haya14busa/incsearch.vim'
Plug 'mileszs/ack.vim'

" Themes
Plug 'NLKNguyen/papercolor-theme'
Plug 'godlygeek/csapprox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()
" }}}
" General {{{
set scrolloff=5

set shell=/bin/bash

set exrc
set secure

" Moving around wrapped lines
nmap j gj
nmap k gk

let mapleader = "\<Space>" " Remap leader to something easy to hit
nnoremap <Leader>w :w<CR>

set dictionary-=/usr/share/dict/american-english dictionary+=/usr/share/dict/american-english
" }}}
" Buffers {{{

" Easier buffer switch
set hidden
nnoremap gx :bd<CR>

nnoremap gt :bn<CR>
nnoremap gT :bp<CR>

nnoremap gp :bp<CR>
nnoremap gn :bn<CR>

nnoremap <C-S-tab> :bp<CR>
nnoremap <C-tab> :bn<CR>

nnoremap gl :ls<CR>
nnoremap gb :ls<CR>:b

nnoremap <C-t> :tabnew<CR>
" }}}
" Files, backups and undo {{{
set nobackup
set nowb
set noswapfile
" }}}
" Search {{{
set ignorecase
set smartcase
set nowrapscan

nmap <leader>q :nohlsearch<CR>
" }}}
" Shortcuts {{{

" Toggle spell check
nmap <F3> :setlocal spell! spelllang=en_us<CR>

set pastetoggle=<F2>

nnoremap <leader>ev :e $VIMRC<CR>
nnoremap <leader>sv :source $VIMRC<CR>

cnoremap w!! w !sudo tee > /dev/null %

" }}}
" Text, tabulation and indent related {{{
set list
set listchars=tab:\|\ ,trail:~

set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
" }}}
" UI and Colors {{{
syntax enable           " Enable syntax highlighting
set number              " Display line number
set cursorline

colorscheme PaperColor
execute "set colorcolumn=" . join(range(81,110), ',')
" }}}
" Plugin: ack.vim {{{
if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif
" }}}
" Plugin: CtrlP {{{
nnoremap <Leader>o :CtrlP<CR>

let g:ctrlp_custom_ignore = 'dist\|build\|node_modules\|bower_components\|.git\'
" }}}
" Plugin: Git-gutter {{{
let g:gitgutter_sign_column_always = 1
highlight clear SignColumn

nmap <leader>] <Plug>GitGutterNextHunk
nmap <leader>[ <Plug>GitGutterPrevHunk

nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterRevertHunk
nmap <Leader>hr <Plug>GitGutterUndoHunk

" }}}
" Plugin: Incsearch {{{
let g:incsearch#auto_nohlsearch = 1

nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" }}}
" Plugin: Incsearch {{{
map <C-n> :NERDTreeToggle<CR>
" }}}
" Plugin: vim-airline {{{
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1

let g:airline_theme='papercolor'
" }}}
" Plugin: vim-jsx {{{
let g:jsx_ext_required = 0
" }}}
" vim:foldmethod=marker:foldlevel=0
