#!/bin/bash

DOT_FILES=( .gitconfig .vimrc .zshrc )

for FILE in ${DOT_FILES[@]}
do
    if [ -e $HOME/$FILE ]; then
        echo "$HOME/$FILE already exists. please remove this file."
        exit 0
    fi
done

for FILE in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$FILE $HOME/$FILE
done

[ ! -d ~/.vim/bundle ] && mkdir -p ~/.vim/bundle && git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim && vim -c ':NeoBundleInstall'
