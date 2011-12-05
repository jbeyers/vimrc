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
        git clone --recursive $1 bundle/$2
    fi
}

# .vimrc must be symlinked to the home directory to enable it for the user.
if [ ! -e $HOME/.vimrc ]; then
    ln -s $HOME/.vim/.vimrc $HOME/.vimrc
fi

# In vimrc I specify a .vim-tmp directory to keep temporary files. This keeps
# my directories clean of vim temporary files. However, that directory needs to
# exist.
if [ ! -e $HOME/.vim-tmp ]; then
    mkdir $HOME/.vim-tmp
fi

# Solarized gives great syntax and editing colors
getgit git://github.com/altercation/vim-colors-solarized.git vim-colors-solarized

# snipmate adds snippet functionality
getgit https://github.com/msanders/snipmate.vim.git snipmate.vim

# zope snipmate bundle
getgit http://github.com/zedr/zope-snipmate-bundle.git zope-snipmate-bundle

# django snipmate bundle
getgit http://github.com/robhudson/snipmate_for_django.git snipmate_for_django

# Sparkup expands a haml-like syntax to html
getgit https://github.com/bingaman/vim-sparkup.git vim-sparkup

# Surround stuff with tags
getgit https://github.com/tpope/vim-surround.git vim-surround

# Extends surround with specific tags
getgit https://github.com/tpope/vim-ragtag.git vim-ragtag

# Repeats things in script files.
getgit https://github.com/tpope/vim-repeat.git vim-repeat

# Matchit jumps between tags in html etc. Might be part of a standard install
getgit https://github.com/tsaleh/vim-matchit.git vim-matchit

# On-the-fly python syntax checking
#getgit https://github.com/kevinw/pyflakes-vim.git pyflakes-vim

# Text filtering and alignment
getgit https://github.com/godlygeek/tabular.git tabular

# Text filtering and alignment
getgit https://github.com/rodjek/vim-puppet.git vim-puppet

# Mako syntax highlighting, used with pyramid
getgit https://github.com/vim-scripts/mako.vim.git mako.vim

# NERDTree tree browser
getgit https://github.com/scrooloose/nerdtree.git nerdtree

# Syntastic syntax checker
getgit https://github.com/scrooloose/syntastic.git syntastic

# Shows errors in the status line. Makes the Syntastic workflow smoother.
getgit https://github.com/dannyob/quickfixstatus.git quickfixstatus
