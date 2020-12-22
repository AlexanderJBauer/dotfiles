#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim
rm ~/.vimrc
rm -rf ~/.vim
ln -sfn ${BASEDIR}/vimrc ~/.vimrc
ln -sfn ${BASEDIR}/vim ~/.vim
# ln -sfn ${BASEDIR}/ignore ~/.ignore
# ln -sfn ${BASEDIR}/bashrc ~/.bashrc
printf "\n" >> ~/.bashrc
cat bashrc >> ~/.bashrc
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  # https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# git
git config --global diff.tool vimdiff
git config --global merge.tool vimdiff
git config --global difftool.prompt false
