#!/bin/bash

DOT_FILES=(\
.gitconfig \
.gitignore_global \
.vimrc \
.zshrc \
)

for FILE in ${DOT_FILES[@]}
do
    if [ -e ~/$FILE ]; then
        echo "~/$FILE already exists. Skipping..."
    else
        ln -s ~/dotfiles-local/$FILE ~/$FILE
    fi
done
