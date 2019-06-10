" Turn on syntax highlighting
syntax on

" Highlight search
set hlsearch
noremap i :noh<cr>i

" * puts current word in search but doesn't move
nnoremap * *<c-o>

" do not make a newline
set noeol

" Show commands
set showcmd

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

" Leader config
com! -nargs=1 Replace :%s//<args>/gc

nmap <leader>r Replace 

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Status bar
set laststatus=2

set noantialias

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Packages
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/syntastic'
Plug 'https://github.com/mileszs/ack.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()

" Gruvbox
set termguicolors
colorscheme gruvbox
set background=dark

" Nerdtree

" Syntastic
let g:syntastic_python_checkers=['pylint']

" Ack
let g:ackprg = 'ag --vimgrep'

function QuietAck(string) abort
  let saved_shellpipe = &shellpipe
  let &shellpipe = '>'
  try
    execute 'Ack!' shellescape(a:string, 1)
  finally
    let &shellpipe = saved_shellpipe
  endtry
endfunction

command! -nargs=1 Search call QuietAck(<f-args>) 
nnoremap <Leader>s :Search<Space>
