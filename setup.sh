#!/usr/bin/env bash

# Install zshell and tmux
if [ "$(uname)" == "Darwin" ]; then
    brew install binutils neovim zsh tmux wget
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    if [ -n "$(command -v apt-get)" ]; then
        apt-get install neovim zsh tmux exuberant-ctags
    else
        echo "NOT SUPPORTED!"
        exit 1
    fi
fi

function setup_neovim {
    mkdir -p ~/.config/nvim && ln -s ~/dotfiles/nvimrc ~/.config/nvim/init.vim
    mkdir -p ~/.local/share/nvim/site/autoload/
    wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -O ~/.local/share/nvim/site/autoload/plug.vim
}

function setup_rust_cargo {
    curl https://sh.rustup.rs -sSf | sh
}

function setup_tools {
    brew install rg exa
    cargo install starship

    # syntax checking for python
    pip3 install flake8 --user

    # ctrl+r history search
    brew install fzf
    $(brew --prefix)/opt/fzf/install
}

# Create shortcuts to our dotfiles
rm -f ~/.vimrc ~/.zshrc ~/.tmux.conf

ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/flake8.ini ~/.flake8
mkdir -p ~/.config/alacritty && ln -s ~/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
mkdir -p ~/.config/ion
ln -s ~/dotfiles/config.ion ~/.config/ion/initrc
ln -s ~/dotfiles/starship.ion ~/.config/ion/starship.ion
ln -s ~/dotfiles/starship.toml ~/.config/starship.toml


setup_neovim
setup_rust_cargo

nvim +PlugInstall +qall

echo "Done!"
