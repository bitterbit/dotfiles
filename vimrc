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
" Plugin 'Valloric/YouCompleteMe'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'joonty/vim-taggatron'

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
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,E402,F403,F405,E302,E305,E261'   " ignore error line too long
" E501 - line too long
" E402 - import not at top
" F403 - allow `from A import *`
" E302 - expected two blank lines between functions
" E305 - expected two blank after class or function def
" E261 - at least two spaces before inline comment


set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*,*.egg-info,__pycache__
let NERDTreeRespectWildIgnore=1


" shortcuts
nmap ,f :CtrlP<CR>
map <C-n> :NERDTreeToggle<CR>

" NERDTree onload
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Auto complete trigger on tab
let g:SuperTabDefaultCompletionType = ""

" No text wrapping
set nowrap

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

colorscheme dracula

" PHP
command PHPCtags execute ":call RefreshPHPCtags()"

fun! RefreshPHPCtags()
    execute '!ctags -f php.tags --languages=PHP -R'
    set tags=php.tags
endfun

" go to defn of tag under the cursor
fun! MatchCaseTag()
    let ic = &ic
    set noic
        try
            exe 'tjump ' . expand('<cword>')
        finally
               let &ic = ic
        endtry
endfun
nnoremap <silent> <F12> :call MatchCaseTag()<CR>
