set nocompatible              " be iMproved, required
filetype off                  " required
set shell=/bin/bash

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'rakr/vim-one'
Plugin 'scrooloose/nerdtree'
Plugin 'sheerun/vim-polyglot'

call vundle#end()            " required
filetype plugin indent on    " required

" Plugin Specific
nnoremap <C-m> :NERDTreeToggle<CR>

""""""""""""

" Turn on syntax highlighting
syntax on

" TODO: Pick a leader key
let mapleader = ","

" Show line numbers
set number

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set autoindent
set fileformat=unix

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs

set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>
set clipboard=unnamed

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search


" Color scheme (terminal)
set guifont=Menlo\ Regular:h14
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
"colorscheme Tomorrow-Night-Eighties
colorscheme Tomorrow-Night-Eighties

source ~/.vim/bundle/cscope_maps.vim

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" Fixes indent on every line in the file
" mz creates a mark called 'z'
" gg jumps to beginning
" = indents
" G jumps to end
" `z jumps back to 'z' mark
map <F7> mzgg=G`z

if has('nvim') || has('termguicolors')
  set termguicolors
endif

