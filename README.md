These instructions are Mac-centric.

----
# To Do:

- [ ] Document bash and prompt customizations.
- [ ] Create installation script.

----
# Vim

## Autocomplete and Jump to Definitions

Use ctags. No need for plugins! Install ctags (macOS comes with one, but missing some features).

`brew install ctags`

* Run `ctags` at your project root: `ctags -R .`
* By default, it creates a `tags` file, but you could put it somewhere more discreet: `ctags -R -f ./.git/tags`.

### Cheat Sheet

* **Autocomplete**: `<Ctrl-n>` next, `<Ctrl-p>` previous
* **Definition**: `<Ctrl-]>` jump, `<Ctrl-t>` back


## Nice Status Bar

Lightline

`git clone https://github.com/itchyny/lightline.vim ~/.vim/bundle/lightline.vim`

**Issues**: Only working with NERDTree. Won't show up on its own.


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

| ٩(̾●̮̮̃̾•̃̾)۶ |  |
| --- | ---|
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
Not sure whyyyy. Workaround: create a symbolic link from `~/.vim/after/indent/javascript/jsx.vim` to `~/.vim/bundle/vim-jsx/after/indent/jsx.vim`

