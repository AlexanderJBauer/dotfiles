#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
osSetupScripts=${BASEDIR}/bashHelpers

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  ${osSetupScripts}/ubuntu.sh # For me, this is always Ubuntu
#elif [[ "$OSTYPE" == "darwin"* ]]; then
  # ${osSetupScripts}/mac.sh # Mac OSX
#elif [[ "$OSTYPE" == "cygwin" ]]; then
  # POSIX compatibility layer and Linux environment emulation for Windows
#elif [[ "$OSTYPE" == "msys" ]]; then
  # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
#elif [[ "$OSTYPE" == "win32" ]]; then
  # I'm not sure this can happen.
#elif [[ "$OSTYPE" == "freebsd"* ]]; then
  # ...
fi

# shell config
# Status code of 1 means command completed successfully but returned falsy.
# In this case it means the file exists, but does not have the desired string.
grep -q 'source ~/.personal_shell' ~/.bashrc;
if [ $? -eq 1 ]; then
  printf "\nsource ~/.personal_shell" >> ~/.bashrc;
fi
grep -q 'source ~/.personal_shell' ~/.zshrc;
if [ $? -eq 1 ]; then
  printf "\nsource ~/.personal_shell" >> ~/.zshrc;
fi

# vim
rm ~/.vimrc
rm -rf ~/.vim
rm ~/.personal_shell
ln -sfn ${BASEDIR}/vimrc ~/.vimrc
ln -sfn ${BASEDIR}/personal_shell ~/.personal_shell

# vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# git
git config --global diff.tool vimdiff
git config --global merge.tool vimdiff
git config --global difftool.prompt false

# ln -sfn ${BASEDIR}/ignore ~/.ignore
