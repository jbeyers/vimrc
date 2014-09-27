A quick guide to getting this all to work:
==========================================

This is my .vimrc file and .vim directory, with a setup script to set it up on
a new machine.

Managed by Ansible since 2014

Prerequisites
=============

* Ubuntu. This directory should be checked out in your home directory as .vim

* pyflakes. Actually, pyflakes-vim does come with its own version, but I usually do a sudo apt-get install pyflakes in any case.

Installation
============

A quick list of commands on a new system::

    cd ~
    sudo apt-get install pyflakes
    git clone git@github.com:jbeyers/vimrc.git .vim
    cd .vim
    ./setup.sh

What the setup script does:
===========================

* Clone all the plugins into bundle/, so pathogen can find them. If they already exist, try to update them.

* Create the directory ~/.vim-tmp, where vim temp files go (I don't like them all over the place)

* symlink ~/.vim/.vimrc to ~/.vimrc
    
The script is idempotent and reasonably non-destructive: It will not
overwrite .vimrc if it exists, and it should not kill any local changes to
bundles.
