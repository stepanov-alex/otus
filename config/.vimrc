set nu rnu
set tabstop=2
set shiftwidth=2
set expandtab
set incsearch
set smarttab
set cursorline
"set termguicolors

set encoding=utf-8 
set nocompatible 
syntax enable 


if empty(glob('~/.vim/autoload/plug.vim')) 
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
endif

call plug#begin('~/.vim/bundle') 

Plug 'vim-airline/vim-airline'
Plug 'ErichDonGubler/vim-sublime-monokai'

call plug#end() 

filetype on
filetype plugin on
filetype plugin indent on
colorscheme sublimemonokai

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1 
let g:airline#extensions#keymap#enabled = 0 
let g:airline_section_z = "\ue0a1:%l/%L Col:%c" 
let g:Powerline_symbols='unicode' 
let g:airline#extensions#xkblayout#enabled = 0 
