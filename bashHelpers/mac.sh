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

# fontawesome
brew install homebrew/cask-fonts/font-fontawesome

# window manager
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd
brew install cmacrae/formulae/spacebar

chmod +x ~/.yabairc
chmod +x ~/.config/spacebar/spacebarrc

# Disable animations when opening and closing windows.
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
# Accelerated playback when adjusting the window size.
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Installed like regular apps/ via app store
# Google Chrome
# VsCode
# mullvad
# vlc media player
# discord
# alfred
