set shell=/bin/bash " dont use system shell, always use bash

" No text wrapping
set nowrap

" indentation
set expandtab
set shiftwidth=4
set softtabstop=4

set number relativenumber  " hybrid numbers
set nu rnu

" syntax highlight
syntax on

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'arzg/vim-colors-xcode'
call plug#end()

" xcode theme
colorscheme xcodedark
" set background=dark

" ~~ NERDTREE ~~
" NERDTree and ctrlp ignore files
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*,*.egg-info,__pycache__,node_modules
let NERDTreeRespectWildIgnore=1
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" ~~ coc.nvim ~~
" TextEdit might fail if hidden is not set.
set hidden
set cmdheight=2         " more space for error messages
set updatetime=300
set shortmess+=c        " Don't pass messages to |ins-completion-menu| 

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use tab for trigger completion with characters ahead and navigate.
noremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <c-space> coc#refresh()
