#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"

echo sudo apt install build-essential
sudo apt install build-essential

echo sudo apt install cmake
sudo apt install cmake

echo sudo apt install clang
sudo apt install clang

echo sudo apt install curl
sudo apt install curl

echo sudo apt install python3
sudo apt install python3

echo sudo apt install python-is-python3
sudo apt install python-is-python3

echo sudo apt install dirmngr gnupg apt-transport-https ca-certificates software-properties-common
sudo apt install dirmngr gnupg apt-transport-https ca-certificates software-properties-common

echo sudo apt install gdebi-core
sudo apt install gdebi-core

echo sudo apt install git
sudo apt install git

echo sudo apt install vim
sudo apt install vim

echo sudo apt install ripgrep
sudo apt install ripgrep

echo sudo apt install fzf
sudo apt install fzf

# Install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo sudo apt install bat
sudo sed -i '/\/usr\/.crates2.json/d' /var/lib/dpkg/info/ripgrep.list
sudo apt install bat
sudo ln -s batcat /usr/bin/bat
# sudo dpkg -i latest_release_from_githu_/bat_amd64.deb

echo sudo apt install nodejs
sudo apt install nodejs

echo sudo apt install npm
sudo apt install npm

sudo wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

echo sudo apt install ffmpeg
sudo apt install ffmpeg

echo sudo apt install pandoc
sudo apt install pandoc

echo sudo apt install google-chrome-stable
sudo apt install google-chrome-stable

echo sudo apt install code
sudo apt install code

echo sudo apt install gnome-tweak-tool
sudo apt install gnome-tweak-tool

echo sudo apt install i3
sudo apt install i3

echo sudo apt install rofi
sudo apt install rofi

echo sudo apt install tmux
sudo apt install tmux

# Create repos directory in home
cd ~
mkdir -p repos

# Install Kinto if not present
KINTO="repos/kinto/"
if [ ! -d $KINTO ]; then
  echo "Installing kinto" && $BASEDIR/kinto.sh
else
  echo "Kinto is already installed, skipping"
fi

# Terminal font FiraCode NF weight=453 13

# mullvad
echo sudo apt install wireguard-tools
sudo apt install wireguard-tools
# wget --content-disposition https://mullvad.net/download/app/deb/latest
# sudo gdebi MullvadVPN-XXXX.X_amd64.deb

# vlc media player
echo sudo snap install vlc
sudo snap install vlc

# discord
