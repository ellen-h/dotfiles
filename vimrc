execute pathogen#infect()
syntax on
filetype plugin indent on

" Mappings
" ============================================================================
map ,e :NERDTree<CR>
map ,t :NERDTree<CR>
map ,p :CtrlP<CR>

" Pretty things
" ============================================================================
" Lightline
set laststatus=2
let g:lightline = {
\   'component_function': {
\       'gitbranch': 'gitbranch#name'
\   }
\ }

" Highlighting
" ============================================================================

" Highlight extra whitespace
highlight BadWhitespace ctermbg=gray guibg=gray
au BufRead,BufNewFile *.* match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.* match BadWhitespace /\s\+$/

" Syntax
" ============================================================================
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

" Linting
" ============================================================================

" Lint only on save
" let g:ale_lint_on_text_changed = 'never'

let g:ale_linters = {'python': ['flake8']}

" Markers for gutter
let g:ale_sign_error = '😱'
let g:ale_sign_warning = '😳'
let g:ale_sign_info = '🤔'
let g:ale_sign_style_error = '🙄'
let g:ale_sign_style_warning = '🧐'

" Clear gutter highlights
highlight clear ALEErrorSign
highlight clear ALEWarningSign

" Search for ctags file up to root
set tags=./tags;/

" Oddities
" ============================================================================

" nerdtree quirk: get rid of visible delimiter "^G"
let g:NERDTreeNodeDelimiter = "\u00a0"

" Colour fix for iTerm2
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
