#!/bin/bash

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

getgit git://github.com/altercation/vim-colors-solarized.git vim-colors-solarized
