#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"

installPackage() {
  if [ $(dpkg-query -W -f='${Status}' $1 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
    echo installing package $1
    sudo apt install $1
  else
    echo package $1 already installed
  fi
}

addRepo() {
  grep -h "^deb.*$1" /etc/apt/sources.list.d/* > /dev/null 2>&1
  if [ $? -ne 0 ]; then
    echo adding ppa:$1
    sudo add-apt-repository ppa:$1
  else
    echo ppa:$1 already exists
  fi
}

installSnap() {
  if ! snap info $1 >/dev/null 2>&1; then
    echo installing snap $1
    sudo snap install $1
  else 
    echo snap $1 already installed
  fi
}

installPackage build-essential
installPackage cmake
installPackage clang
installPackage curl
installPackage python3
installPackage python-is-python3
installPackage python3-pip
installPackage python3-venv
installPackage dirmngr
installPackage gnupg
installPackage apt-transport-https
installPackage ca-certificates
installPackage software-properties-common
installPackage gdebi-core
installPackage git
installPackage vim
addRepo neovim-ppa/unstable
installPackage neovim
installPackage fzf

# Install rustup
if ! rustup --version >/dev/null 2>&1; then
  echo installing rustup
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
else
  echo rustup is already installed
fi

installPackage bat
sudo ln -sfn batcat /usr/bin/bat

# install ripgrep independently to avoid conflicts with bat
if ! rg --version >/dev/null 2>&1; then
  echo installing ripgrep;
  curl -s https://api.github.com/repos/BurntSushi/ripgrep/releases/latest | grep browser_download_url | grep .deb | cut -d '"' -f 4 | xargs wget -qO ~/tmp/rg.deb
	sudo apt install ~/tmp/rg.deb
	rm ~/tmp/rg.deb
else
  echo ripgrep already installed;
fi

installPackage nodejs
installPackage npm

if [ ! -d ~/.nvm ]; then
  echo installing nvm
  sudo wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
else
  echo nvm is already installed
fi

installPackage ffmpeg
installPackage pandoc
installPackage google-chrome-stable
installPackage code
installPackage gnome-tweak-tool
installPackage i3
installPackage rofi
installPackage feh
installPackage tmux
installPackage zsh

installPackage testdisk


# Install Kinto if not present
if [ ! -d ~/repos/kinto ]; then
  echo "Installing kinto" && $BASEDIR/kinto.sh
else
  echo Kinto is already installed
fi

# Terminal font FiraCode NF weight=453 13

# mullvad
installPackage wireguard-tools
# wget --content-disposition https://mullvad.net/download/app/deb/latest
# sudo gdebi MullvadVPN-XXXX.X_amd64.deb

installSnap vlc
installSnap discord
