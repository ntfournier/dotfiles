" Vimrc
" Vundle {{{
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'

Plugin 'tomasr/molokai'

Plugin 'mileszs/ack.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'airblade/vim-gitgutter'

Plugin 'NLKNguyen/papercolor-theme'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'editorconfig/editorconfig-vim'

call vundle#end()
filetype plugin indent on
" }}}
" General {{{
set scrolloff=6

set shell=/bin/bash

set exrc
set secure

" Moving around wrapped lines
nmap j gj
nmap k gk

function MapToggle(key, opt)
	let cmd = ':set '.a:opt.'! \| set '.a:opt."?\<CR>"
	exec 'nnoremap '.a:key.' '.cmd
	exec 'inoremap '.a:key." \<C-O>".cmd
endfunction
command -nargs=+ MapToggle call MapToggle(<f-args>)

MapToggle <F2> wrap
MapToggle <F3> list

let mapleader = "\<Space>" " Remap leader to something easy to hit
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

set dictionary-=/usr/share/dict/american-english dictionary+=/usr/share/dict/american-english

set guifont=Hack\ Regular\ 12
" }}}
" Buffers {{{

" Easier buffer switch
set hidden
nnoremap gx :bd<CR>

nnoremap gt :bn<CR>
nnoremap gT :bp<CR>

nnoremap gp :bp<CR>
nnoremap gn :bn<CR>

"nnoremap <C-S-tab> :bp<CR>
"nnoremap <C-tab> :bn<CR>

nnoremap gl :ls<CR>
nnoremap gb :ls<CR>:b

nnoremap <C-t> :tabnew<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

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

map <C-s> :w<CR>

" Toggle spell check
nmap <F8> :setlocal spell! spelllang=en_us<CR>

nnoremap <leader>ev :e $VIMRC<CR>
nnoremap <leader>sv :source $VIMRC<CR>

cnoremap w!! w !sudo tee > /dev/null %

" }}}
" Text, tabulation and indent related {{{
set list
set listchars=tab:\|\ ,trail:~
set fileformat=unix

set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=120 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

set tabstop=4
set shiftwidth=4
set expandtab

" }}}
" UI and Colors {{{
syntax enable           " Enable syntax highlighting
set number              " Display line number
set cursorline

set background=light
colorscheme PaperColor
execute "set colorcolumn=" . join(range(81,120), ',')
" }}}
" Plugin: ack.vim {{{
if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif
" }}}
" Plugin: CtrlP {{{
nnoremap <Leader>o :CtrlP<CR>

let g:ctrlp_custom_ignore = 'dist\|build\|node_modules\|bower_components\|.git\|.class'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
" }}}
" Plugin: Git-gutter {{{
set signcolumn=yes
highlight clear SignColumn

nmap <leader>] <Plugin>GitGutterNextHunk
nmap <leader>[ <Plugin>GitGutterPrevHunk

nmap <Leader>ha <Plugin>GitGutterStageHunk
nmap <Leader>hu <Plugin>GitGutterRevertHunk
nmap <Leader>hr <Plugin>GitGutterUndoHunk

" }}}
" Plugin: Incsearch {{{
let g:incsearch#auto_nohlsearch = 1

nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>
" map /  <Plugin>(incsearch-forward)
" map ?  <Plugin>(incsearch-backward)
" map g/ <Plugin>(incsearch-stay)
" }}}
" Plugin: NerdTree {{{
map <C-n> :NERDTreeToggle<CR>
" }}}
" Plugin: vim-airline {{{
let g:airline_powerline_fonts = 0
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1

let g:airline_theme='wombat'
" }}}
" Plugin: vim-jsx {{{
let g:jsx_ext_required = 0
" }}}
" vim:foldmethod=marker:foldlevel=0
