" .vimrc 2012-2013 by Wang Wei  voidstarting@gmail.com
set nocompatible
syntax on
execute pathogen#infect()
set number
set noswapfile
set smartindent
set smartcase
nnoremap <C-h> <c-w>h
nnoremap <C-l> <c-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" vim snips
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"

" Optional:
Bundle "honza/vim-snippets"




filetype plugin indent on     " required!

