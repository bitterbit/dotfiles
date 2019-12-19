#!/usr/bin/env bash


# Install zshell and tmux
if [ "$(uname)" == "Darwin" ]; then
    brew install vim zsh tmux
    brew install binutils
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    if [ -n "$(command -v yum)" ]; then
        yum install vim zsh tmux
    elif [ -n "$(command -v apt-get)" ];  then
        apt-get install vim zsh tmux exuberant-ctags
    elif [ -n "$(command -v zypper)" ];  then
        zypper install vim zsh tmux ctags
    fi
fi

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Create shortcuts to our dotfiles
rm ~/.vimrc ~/.zshrc ~/.tmux.conf

ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/oh-my-zsh ~/.oh-my-zsh
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

# syntax checking for python
pip3 install flake8 --user

vim +PluginInstall +qall

echo "Done!"
