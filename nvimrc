set shell=/bin/bash " dont use system shell, always use bash

" No text wrapping
set nowrap

" indentation
set expandtab
set shiftwidth=4
set softtabstop=4

set number relativenumber  " hybrid numbers

" hide/show numbers in normal mode
nmap <F3> :set nonumber norelativenumber<CR>
nmap <F2> :set number relativenumber<CR>

" syntax highlight
syntax on

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'arzg/vim-colors-xcode'
Plug 'tpope/vim-commentary'
Plug 'jremmen/vim-ripgrep'
" Fuzzy Find
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Valloric/MatchTagAlways'
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
set cmdheight=1
set updatetime=300
set shortmess+=c        " Don't pass messages to |ins-completion-menu| 

" Map redo to shift+undo
nnoremap U <C-r>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Symbol renaming
nmap <C-r> <Plug>(coc-rename)

" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Do default action for next and prev item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>

" COC format file
command! -nargs=0 Format :call CocAction('format')
" COC organize imports
" TODO make this work, or at least understand what languages support this
" command! -nargs=0 Imports :call CocAction('runCommand', 'editor.action.organizeImport') 

" ~~ Fuzzy Find ctrl+p ~~
nnoremap <C-p> :FZF<cr>

" reload configuration shortcut
nnoremap <C-s> :source $MYVIMRC<CR>

" status line to show current file
set statusline=
set statusline+=%{coc#status()}
set statusline+=
set statusline+=\ %{&modified?'[+]':''}
set statusline+=\ %f
set statusline+=\:%l
set statusline+=\ %{get(b:,'coc_current_function','')} " TODO why does this not work??

