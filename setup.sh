#!/usr/bin/env bash


# Install zshell and tmux
if [ "$(uname)" == "Darwin" ]; then
    brew install zsh tmux
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    if [ -n "$(command -v yum)" ]; then
        yum install zsh tmux
    elif [ -n "$(command -v apt-get)" ];  then
        apt-get install zsh tmux
    fi
fi

# Create shortcuts to our dotfiles
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

vim +PluginInstall +qall

echo "Done!"
