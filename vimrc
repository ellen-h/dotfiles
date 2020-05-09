" vim-plug
" ============================================================================
call plug#begin('~/.vim/plugged')
" :PlugInstall to install new plugins
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'sickill/vim-monokai'
Plug 'vimwiki/vimwiki'
"Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile'}
"Bug: javascript file not found. Run :call coc#util#install()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

set runtimepath^=~/.vim/bundle/ctrlp.vim

syntax on
filetype indent off

" Navigation
" ============================================================================
" Remapping keys

" Highlighting
" ============================================================================

" Highlight extra whitespace
highlight BadWhitespace ctermbg=gray guibg=gray
au BufRead,BufNewFile *.* match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.* match BadWhitespace /\s\+$/

" Pretty things
" ============================================================================
" Lightline
set laststatus=2
let g:lightline = {
\   'component_function': {
\       'gitbranch': 'gitbranch#name'
\   }
\ }

" Syntax
" ============================================================================
" JSX highlight .jsx files only
" let g:jsx_ext_required = 1
let g:vim_jsx_pretty_colorful_config = 1

" Filetypes and Formatting
" ============================================================================

" tab/shift defaults
set expandtab
set tabstop=4
set shiftwidth=4

" Filetypes
au BufNewFile,BufRead *.js set filetype=javascript
au BufNewFile,BufRead *.ts set filetype=javascript
au BufNewFile,BufRead *.jsx set filetype=javascript
au BufNewFile,BufRead *.html set filetype=html
au BufNewFile,BufRead *.mako set filetype=html

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
let g:ale_sign_error = '🤬'
let g:ale_sign_warning = '😡'
let g:ale_sign_info = '🤔'
let g:ale_sign_style_error = '🤮'
let g:ale_sign_style_warning = '🤢'

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

" Coc stuff
if has_key(g:plugs, 'coc.nvim')
    inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1] =~# '\s'
    endfunction
endif

" Wiki settings
let wiki_default = {}
let wiki_default.auto_export = 0
let wiki_default.auto_toc = 0
let wiki_default.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'sh': 'sh'}

let work_wiki = copy(wiki_default)
let work_wiki.path = '~/Documents/notes/work/'

let personal_wiki = copy(wiki_default)
let personal_wiki.path = '~/ellybeans/vimwiki/'
let personal_wiki.path_html = '~/ellybeans/html/vimwiki/'

let g:vimwiki_list = [work_wiki, personal_wiki]
