set term=screen-256color
set t_Co=256

" mandatory defaults
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" our plugins
Plugin 'gmarik/Vundle.vim'       

" colors
Plugin 'flazz/vim-colorschemes' 
Plugin 'altercation/vim-colors-solarized'

" code enchancments
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ctrlpvim/ctrlp.vim'

" javascript
Plugin 'jelera/vim-javascript-syntax' 	" color syntax
Plugin 'pangloss/vim-javascript' 	" tabs
Plugin 'Raimondi/delimitMate' 		" close brakets

" react js
Plugin 'mxw/vim-jsx'

" syntax
let g:syntastic_check_on_open=1                     " syntastic lint file also on open and not only on close or save
let g:jsx_ext_required = 0 	                    " allow JSX in normal JS files
let g:syntastic_javascript_checkers = ['eslint']    " syntastic use eslint (and not jshint) for better jsx 

" shortcuts
nmap ,f :CtrlP<CR>


" indentation
set expandtab
set shiftwidth=4
set softtabstop=4

" colors
syntax on
set background=dark
" colorscheme distinguished
" colorscheme solarized


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


