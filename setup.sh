#!/bin/bash

# Until I am comfortable with git submodules, this will have to do. Also, it is
# a simple way to get the newest code.
getgit() {
    echo "=== Installing "$2" ===="
    if [ -e bundle/$2 ]; then
        pushd bundle/$2
        git pull
        popd
    else
        git clone $1 bundle/$2
    fi
}

# Solarized gives great syntax and editing colors
getgit git://github.com/altercation/vim-colors-solarized.git vim-colors-solarized

# snipmate adds snippet functionality
getgit https://github.com/msanders/snipmate.vim.git snipmate.vim

# Sparkup expands a haml-like syntax to html
getgit https://github.com/bingaman/vim-sparkup.git
