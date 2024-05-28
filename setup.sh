#!/bin/bash

DOT_FILES=(\
.gitconfig \
.gitignore_global \
.vimrc \
.zshrc \
)

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
