#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim
ln -sfn ${BASEDIR}/vimrc ~/.vimrc
ln -sfn ${BASEDIR}/vim ~/.vim
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  # https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# git
git config --global diff.tool vimdiff
git config --global difftool.prompt false
