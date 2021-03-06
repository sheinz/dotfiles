#!/bin/bash

echo "Installing git"
sudo apt-get -y install git-core

echo "Make CAPS key act as ESC"
dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"

echo "Installing gui diff tool meld"
sudo apt-get -y install meld

echo "Installing vim"
# Python3 support in VIM
sudo apt-add-repository ppa:pi-rho/dev
sudo apt-get update
sudo apt-get -y install vim
sudo apt-get -y install vim-gnome
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Configure VIM
wget https://raw.githubusercontent.com/sheinz/dotfiles/master/vim/vimrc -O ~/.vimrc
wget https://raw.githubusercontent.com/sheinz/dotfiles/master/vim/vimrc -O ~/.vimrc

echo "Configuring GIT"
git config --global diff.tool meld
git config --global alias.meld 'difftool -d'
git config --global alias.st status
git config --global alias.logg 'log --graph --decorate --oneline --abbrev-commit --all'
git config --global push.default simple

# Franca IDL syntax for VIM
#mkdir -p ~/.vim/syntax
#wget https://raw.githubusercontent.com/franca/franca/master/misc/vim-highlight/fidl.vim -O ~/.vim/syntax/fidl.vim
#mkdir ~/.vim/ftdetect
#wget https://raw.githubusercontent.com/franca/franca/master/misc/vim-highlight/ftdetect -O ~/.vim/ftdetect/fidl.vim

sudo apt-get install -y trash-cli

# Configure bashrc
wget https://raw.githubusercontent.com/sheinz/dotfiles/master/ubuntu/bashrc -O /tmp/bashrc
cat /tmp/bashrc >> ~/.bashrc

# build-essentials for program build
sudo apt-get install -y build-essential

# installing universal-ctags
mkdir /tmp/universal-ctags
cd /tmp/universal-ctags
git clone https://github.com/universal-ctags/ctags.git
cd ctags
sudo apt-get install -y autoconf
./autogen.sh
./configure
make
sudo make install


# Tmux
sudo apt-get install -y tmux
wget https://raw.githubusercontent.com/sheinz/dotfiles/master/tmux/tmux.conf -O ~/.tmux.conf

# xclip for tmux. Allows tmux to use system clipboard
sudo apt-get install -y xclip
