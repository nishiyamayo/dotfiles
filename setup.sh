#!/bin/sh
cd $(dirname $0)
for dotfile in .?*
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ] && [ $dotfile != '.gitignore' ] && [ $dotfile != '.gitmodules' ]
    then
        ln -Fis "$PWD/$dotfile" $HOME
    fi
done

git submodule init
git submodule update

# Vim
mkdir -p $HOME/.vim_swap
mkdir -p $HOME/.vim_backup

mkdir -p $HOME/.vim/plugged
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
