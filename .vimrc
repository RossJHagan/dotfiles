set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'

" Language Based Plugins
"
" GoLang:
" Plugin 'fatih/vim-go'


call vundle#end()
filetype plugin indent on

set t_Co=256

set encoding=utf-8
set showcmd
set linespace=5
set showmode
set nowrap
set tabstop=4
set smarttab
set tags=tags
set softtabstop=4
set expandtab
set shiftwidth=4
set shiftround
set backspace=indent,eol,start
set autoindent
set copyindent
set number
set ignorecase
set smartcase
set timeout timeoutlen=500 ttimeoutlen=100
set noerrorbells
set autowrite
set mouse=a
set hidden
set laststatus=2

set hlsearch
set incsearch

" Map jj to replace <esc>
imap jj <esc>

" Jump around window splits a bit more naturally
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-l> <C-w>l
nmap <C-k> <C-w>k

syntax enable
set background=dark
colorscheme solarized
