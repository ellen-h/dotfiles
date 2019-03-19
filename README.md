These instructions are Mac-centric.

----
# To Do:

- [ ] Document bash and prompt customizations.
- [ ] Create installation script.

----
# Vim

## Quicklist of Vim Plugins

Install using Pathogen: [vim-pathogen](https://github.com/tpope/vim-pathogen)

    git clone https://github.com/w0rp/ale.git ~/.vim/bundle/ale.git
    git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
    git clone https://github.com/itchyny/lightline.vim ~/.vim/bundle/lightline.vim
    git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
    git clone https://github.com/pangloss/vim-javascript.git ~/.vim/bundle/vim-javascript
    git clone https://github.com/mxw/vim-jsx.git ~/.vim/bundle/vim-jsx


## Autocomplete and Jump to Definitions

Use ctags. No need for plugins! Install ctags (macOS comes with one, but missing some features).

`brew install ctags`

* By default, ctags creates a file called **tags**
* Run `ctags` at your project root, and put the tags in file called **.ctags**: `ctags -R -f .ctags`
* Or, you could put it somewhere more discreet: `ctags -R -f ./.git/tags`

### Cheat Sheet

* **Autocomplete**: `<Ctrl-n>` next, `<Ctrl-p>` previous
* **Definition**: `<Ctrl-]>` jump, `<Ctrl-t>` back


## Linting

That's done with ale.


## Nice Status Bar

Lightline

`git clone https://github.com/itchyny/lightline.vim ~/.vim/bundle/lightline.vim`


## Directory Tree Explorer

Use NERDTree.

`git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree`

I like it disabled by default. To open the explorer in vim: `:NERDTree`, or map it
to a shortcut in **.vimrc**:

`map ,e :NERDTree<CR>` (then, in vim, open with `,e`)

See next section for help moving around the multiple windows that result from
running nerdtree.


## Vim Split Window

Split your vim window.

### Cheat Sheet

| Command          | ٩(̾●̮̮̃̾•̃̾)۶ |
| ---              | ---|
| :split           | Split this file. Handy for viewing different parts of big file. |
| :split filename  | Split window and edit another file |
| :vsplit          | Vertical split |
| ctrl-w up arrow  | Move cursor up a window |
| ctrl-w ctrl-w    | Cycle cursor through windows |
| ctrl-w\_         | maximize current window |
| ctrl-w=          | make all equal size |
| n ctrl-w+        | increase window size by n lines |
| :hide            | close current window |
| :only            | keep only this window open |
| :ls              | show current buffers |


## Syntax Highlighters

### vim-javascript and vim-jsx

`git clone https://github.com/pangloss/vim-javascript.git ~/.vim/bundle/vim-javascript`

**Issues**:

Not sure whyyyy, but the JSX highlighter doesn't work. Workaround: create a couple of symbolic links:

    mkdir -p ~/.vim/after/syntax/javascript
    mkdir -p ~/.vim/after/indent/javascript
    ln -s ~/.vim/bundle/vim-jsx/after/syntax/jsx.vim ~/.vim/after/syntax/javascript
    ln -s ~/.vim/bundle/vim-jsx/after/indent/jsx.vim ~/.vim/after/indent/javascript

----

# iTerm2

`wget https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Solarized%20Dark%20Higher%20Contrast.itermcolors`

* Profile > Colors > Color Presets... > Import ...
