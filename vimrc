set term=screen-256color
set t_Co=256

" mandatory defaults
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" our plugins
Plugin 'gmarik/Vundle.vim'       
Plugin 'flazz/vim-colorschemes' 
Plugin 'altercation/vim-colors-solarized'

" javascript
Plugin 'jelera/vim-javascript-syntax' 	" color syntax
Plugin 'pangloss/vim-javascript' 	" tabs
Plugin 'Raimondi/delimitMate' 		" close brakets

" react js
" Plugin 'mxw/vim-jsx'

" indentation
set expandtab
set shiftwidth=4
set softtabstop=4


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" colors
syntax on
set background=dark
" colorscheme distinguished
" colorscheme solarized


