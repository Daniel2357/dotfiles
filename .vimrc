set nocompatible

" font
set guifont=Literation\ Mono\ Powerline\ 12

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
Helptags

set modelines=0

set shell=/usr/bin/bash

" remove all trailing whitespace on write
autocmd BufWritePre * :%s/\s\+$//e

" Enable syntax highlighting
filetype plugin indent on
syntax on

" color scheme
let g:molokai_original = 1
colorscheme molokai

" gvim
set guioptions-=m "remove menu bar
set guioptions-=T "remove tool bar
set guioptions-=r "remove right scroll bar
set guioptions-=L "remove left scroll bar

" auto source .vimrc
autocmd! bufwritepost .vimrc source %

" Rebind <Leader> and <localleader> keys
let mapleader = ","
let maplocalleader = ","

" Buffers
set hidden
nnoremap <leader>t :enew<CR>
nnoremap <leader>l :bnext<CR>
nnoremap <leader>h :bprevious<CR>
nnoremap <leader>e :bd<CR>

" Copy & paste using system clipboard and shortcuts
set clipboard=unnamedplus
vnoremap <c-c> y
nnoremap <c-v> p
inoremap <c-v> <esc>pi

" Undo
nnoremap <c-u> u
inoremap <c-u> <esc>ui

" Redo
inoremap <c-r> <esc><c-r>i

" Quicksave command
nnoremap <c-s> :w<CR>
inoremap <c-s> <esc>:w<CR>i

" Easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

" Show line numbers and length
set number  " show line numbers
set tw=80   " width of document (used by gd)
set colorcolumn=80
set formatoptions+=t

" Absolute and relative line numbers
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

set history=1000
set undolevels=1000

" TABs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Search settings
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

" Airline
let g:airline_powerline_fonts=1
set laststatus=2 "show statusline for single window
let g:airline#extensions#tabline#enabled=1 " enable list of buffers
let g:airline#extensions#tabline#fnamemod=':t' " show the filenamea

" Ctrlp
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
nnoremap <c-b> :CtrlPBuffer<CR>
set wildignore+=*.pyc
set wildignore+=*_build/*
let g:ctrlp_working_path_mode = 0
let g:ctrlp_show_hidden = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" dont't check latex files
let g:syntastic_mode_map = { 'mode': 'active',
                          \ 'passive_filetypes': ['tex'] }

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0

" Vim-Latex
let g:latex_quickfix_ignore_all_warnings = 1
