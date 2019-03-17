execute pathogen#infect()
syntax on
filetype plugin indent on

" Mappings
" ============================================================================
map ,e :NERDTree<CR>
map ,t :NERDTree<CR>
map ,p :CtrlP<CR>


" Colours and Highlighting
" ============================================================================

" Highlight extra whitespace
highlight BadWhitespace ctermbg=gray guibg=gray
au BufRead,BufNewFile *.* match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.* match BadWhitespace /\s\+$/

" JSX highlight .jsx files only
" let g:jsx_ext_required = 1


" Filetypes and Formatting
" ============================================================================

" tab/shift defaults
set expandtab
set tabstop=4
set shiftwidth=4

" Filetypes
au BufNewFile,BufRead *.js set filetype=javascript
au BufNewFile,BufRead *.jsx set filetype=javascript
au BufNewFile,BufRead *.html setlocal filetype=html

" JS, TS
au FileType javascript set tabstop=2
au FileType javascript set shiftwidth=2

" HTML
au FileType html set tabstop=2
au FileType html set shiftwidth=2

" Oddities
" ============================================================================

" nerdtree quirk: get rid of visible delimiter "^G"
let g:NERDTreeNodeDelimiter = "\u00a0"
