#!/bin/sh

platform=`uname`
if [ "$platform" = "Linux" ]
then
    ln -is ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
elif [ "$platform" = "Darwin" ]
then
    ln -is ~/dotfiles/osx/tmux.conf ~/.tmux.conf
fi
ln -is ~/dotfiles/vim/vimrc ~/.vimrc
ln -is ~/dotfiles/zsh/zshrc.local ~/.zshrc.local
ln -is ~/dotfiles/powerline ~/.config/
ln -is ~/.vim ~/.config/nvim
ln -is ~/.vimrc ~/.config/nvim/init.vim
