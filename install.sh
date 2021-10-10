#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
osSetupScripts=${BASEDIR}/bashHelpers

# Create repos & tmp directory in home
mkdir -p ~/repos
mkdir -p ~/tmp

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

# vim
rm ~/.vimrc
rm -rf ~/.vim
mkdir -p ~/.vim
ln -sfn ${BASEDIR}/vimrc ~/.vimrc

# nvim
rm -rf ~/.config/nvim
mkdir -p ~/.config/nvim
ln -sfn ${BASEDIR}/init.vim ~/.config/nvim/init.vim

# vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# coc-settings
rm ~/.vim/coc-settings.json
ln -sfn ${BASEDIR}/coc-settings.json ~/.vim/coc-settings.json

# git
git config --global diff.tool vimdiff
git config --global merge.tool vimdiff
git config --global difftool.prompt false

# tmux
rm ~/.tmux.conf
ln -sfn ${BASEDIR}/tmux.conf ~/.tmux.conf

# alacritty
rm ~/.config/alacritty
ln -sfn ${BASEDIR}/alacritty ~/.config/alacritty

# personal shell
rm ~/.personal_shell
ln -sfn ${BASEDIR}/personal_shell ~/.personal_shell

# ripgrep global ignore
rm ~/.gitignore
ln -sfn ${BASEDIR}/rgignore ~/.gitignore

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

# ln -sfn ${BASEDIR}/ignore ~/.ignore

# install fonts
if [ ! -d ~/repos/nerd-fonts ]; then
  echo installing nerd-fonts
  git clone https://github.com/ryanoasis/nerd-fonts
  cd ~/repos/nerd-fonts
  ./install.sh
else
  echo nerd-fonts already installed
fi


if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  rm ~/.config/i3
	ln -sfn ${BASEDIR}/i3 ~/.config/i3
fi

# Mac OSX
if [[ "$OSTYPE" == "darwin"* ]]; then
  rm ~/.yabairc
  rm ~/.skhdrc
  rm ~/.config/spacebar/spacebarrc
  ln -sfn ${BASEDIR}/mac/yabairc ~/.yabairc
  ln -sfn ${BASEDIR}/mac/skhdrc ~/.skhdrc
  ln -sfn ${BASEDIR}/mac/spacebarrc ~/.config/spacebar/spacebarrc
  chmod +x ~/.yabairc
  chmod +x ~/.config/spacebar/spacebarrc
fi
