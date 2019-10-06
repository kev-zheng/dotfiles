" Leader key
let mapleader = ","

"""
" Look & Feel
"""

" Colors
set termguicolors
set background=dark
set t_Co=256 " number of colors exposed
set term=xterm-256color
" no antialiasing
set noantialias

" Show commands on status bar
set showcmd
" Show line numbers
set number
set relativenumber

""" Whitespace
set list                  " Show end-of-line whitespace
set expandtab             " Convert tabs to space
set textwidth=79          " Width for wrapping
set wrap                  " Wrap on multiple lines
set encoding=utf-8        " Encoding
set formatoptions=cqn1   " Format options... see :help fotable
set laststatus=2          " Status bar

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set autoindent

" Syntax highlighting
syntax on
set hlsearch " Highlight search
" Stop highlighting on insert 
autocmd InsertEnter * :let @/=""
autocmd InsertLeave * :let @/=""

highlight Comment ctermfg=Grey
highlight clear CursorLine
highlight LineNr ctermfg=yellow
highlight CursorLine cterm=NONE
highlight CursorLineNr cterm=bold ctermfg=black ctermbg=yellow
set cursorline

" Unix-style files (not that microsoft bs)
set fileformat=unix

""" Cursor motion
set scrolloff=3
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>
set clipboard=unnamed

set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs

" Move up/down lines, even wrapped
nnoremap j gj
nnoremap k gk

""" Searching
" * puts current word in search but doesn't move
nnoremap * *<c-o>

" Incremental search
set incsearch

""" Autocompletion
set completeopt=longest,menuone,noselect
set belloff+=ctrlg

"""
" Custom commands
"""

" Trim whitespace
command! Trim %s/\s\+$//e

" Jump to window on the next window (assistant editor style)
nnoremap <Leader>s :let srchqry=expand("<cword>")<Bar> wincmd w <Bar> silent exec("tag ".expand(srchqry))<CR>

"""
" Plugins
"""
execute pathogen#infect()

" Colorscheme
colorscheme gruvbox
"colorscheme badwolf

" Ack
let g:ackprg = 'ag --vimgrep'

" Nerdtree
nnoremap <silent> <leader>n :NERDTreeToggle <Bar> wincmd p <CR>
nnoremap <silent> <leader>m :NERDTreeFind <CR>

" Syntastic
let g:syntastic_python_checkers=['pylint']

" fzf
" Manual install
"source ~/.fzf/plugin/fzf.vim
" Brew installed
set rtp+=/usr/local/opt/fzf

" Commentary
autocmd FileType lua setlocal commentstring=--\ %s

autocmd BufNewFile,BufRead *.clog set syntax=cpp

