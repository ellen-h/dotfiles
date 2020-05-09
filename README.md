These instructions are Mac-centric.

----

# To Do:

- [ ] Document bash and prompt customizations.
- [ ] Create installation script.

----

# Vim

## Vim Plugins

Using vim-plug so no need for separate install instructions. Run :PlugInstall in vim to install.

### Manual installation

- Fuzzy finder http://kien.github.io/ctrlp.vim/#installation

    cd ~/.vim
    git clone https://github.com/kien/ctrlp.vim.git bundle/ctrlp.vim

Add to your ~/.vimrc:

    set runtimepath^=~/.vim/bundle/ctrlp.vim

Run at Vim's command line:

    :helptags ~/.vim/bundle/ctrlp.vim/doc

# Installation

- alacritty.yml: link .config/alacritty/alacritty.yml
- gitconfig: copy lines to .gitconfig manually - careful not to overwrite existing
- tmux.conf: link ~/.tmux.conf
- vimrc: link ~/.vimrc

