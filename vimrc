set shell=/bin/bash " dont use system shell, always use bash
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
Plugin 'tpope/vim-commentary'

" line numbers
Plugin 'ericbn/vim-relativize'
set relativenumber

Plugin 'aserebryakov/vim-todo-lists' " 'TODO' mode
let g:VimTodoListsMoveItems = 0      " dont move done items to bottom

" javascript
Plugin 'jelera/vim-javascript-syntax' 	" color syntax
Plugin 'pangloss/vim-javascript' 	" tabs
Plugin 'Raimondi/delimitMate' 		" close brakets

" react js
Plugin 'mxw/vim-jsx'

" current theme
Plugin 'arzg/vim-colors-xcode'

" Syntax highlight for reduxos/ion
Plugin 'vmchale/ion-vim'


" syntax
let g:syntastic_check_on_open=1                     " syntastic lint file also on open and not only on close or save
let g:jsx_ext_required = 0 	                    " allow JSX in normal JS files
let g:syntastic_javascript_checkers = ['eslint']    " syntastic use eslint (and not jshint) for better jsx 
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_config_file='.flake8'

" NERDTree and ctrlp ignore files
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*,*.egg-info,__pycache__,node_modules
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

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

colorscheme xcode 


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

" disable relative line numbers on F3
nnoremap <silent> <F3> :let [&number, &relativenumber] =
  \ [!&number && (g:relativize_with_number \|\| !g:relativize_enabled),
  \ !&relativenumber && g:relativize_enabled]<CR>


" fix xcode colorscheme matching parentheses color
hi MatchParen ctermfg=254 ctermbg=6 cterm=NONE
