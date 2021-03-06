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

function setup_neovim {
    mkdir -p ~/.config/nvim && ln -s ~/dotfiles/nvimrc ~/.config/nvim/init.vim
    mkdir -p ~/.local/share/nvim/site/autoload/
    wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -O ~/.local/share/nvim/site/autoload/plug.vim
}

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install zsh typewritter theme
git clone git@github.com:bitterbit/typewritten.git $ZSH_CUSTOM/themes/typewritten
ln -s "$ZSH_CUSTOM/themes/typewritten/typewritten.zsh-theme" "$ZSH_CUSTOM/themes/typewritten.zsh-theme"

# Create shortcuts to our dotfiles
rm -f ~/.vimrc ~/.zshrc ~/.tmux.conf

ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/oh-my-zsh ~/.oh-my-zsh
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/flake8.ini ~/.flake8
mkdir -p ~/.config/alacritty && ln -s ~/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
mkdir -p ~/.config/ion
ln -s ~/dotfiles/config.ion ~/.config/ion/initrc
ln -s ~/dotfiles/starship.ion ~/.config/ion/starship.ion
touch ~/.config/starship.toml
setup_neovim

# syntax checking for python
pip3 install flake8 --user

vim +PluginInstall +qall
nvim +PlugInstall +qall

echo "Done!"
