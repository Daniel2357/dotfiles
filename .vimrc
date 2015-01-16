set nocompatible

" font
set guifont=Monaco\ for\ Powerline\ Medium\ 12

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

" easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

" Show line numbers and length
set number  " show line numbers
set tw=90   " width of document (used by gd)
set wrap  " don't automatically wrap on load
set colorcolumn=90

" Absolute and relative line numbers
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" Useful settings
set history=1000
set undolevels=1000

" TABs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
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
" enable list of buffers
let g:airline#extensions#tabline#enabled=1
" show the filename
let g:airline#extensions#tabline#fnamemod=':t'

" Ctrlp
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
nnoremap <c-b> :CtrlPBuffer<CR>
set wildignore+=*.pyc
set wildignore+=*_build/*
let g:ctrlp_working_path_mode = 'wr'
let g:ctrlp_show_hidden = 1

" jedi-vim
let g:jedi#rename_command="<leader>r"
let g:jedi#usages_command = "<leader>n"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#popup_on_dot=0
let g:jedi#popup_select_first=1
let g:jedi#show_call_signatures=2
