#!/bin/bash

xcode-select --version
if [ $? -ne 0 ]; then
  xcode-select --install;
fi

brew --version
if [ $? -ne 0 ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install wget

# Should be handleed by default
# cmake
# clang
# python
# git

echo brew upgrade vim
brew upgrade vim

echo brew install ripgrep
brew install ripgrep

echo brew install fzf
brew install fzf

# Install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo brew install bat
brew install bat

# TODO: Figure out proper way to do this on mac
# node
# nvm
# npm

echo brew install ffmpeg
brew install ffmpeg

echo brew install pandoc
brew install pandoc

# Installed like regular apps/ via app store
# Google Chrome
# VsCode
# mullvad
# vlc media player
# discord
# alfred
