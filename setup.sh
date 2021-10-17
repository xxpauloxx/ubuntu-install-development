#!/bin/sh

# Install all dependencies
sudo apt update && sudo apt upgrade
sudo apt install curl wget git g++ make cmake build-essential libssl-dev zlib1g-dev \
                 libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm bison \
                 libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev \
                 libffi-dev liblzma-dev zsh tmate neofetch nmap docker.io docker-compose \
                 meld automake autoconf binutils fakeroot findutils flex inkscape gimp \
                 iftop vnstat iptraf hping3 tcpdump tldr jq fzf silversearcher-ag fonts-jetbrains-mono

sudo snap install ngrok
sudo snap install vault

# Zsh default
chsh -s $(which zsh)

# Install NeoVim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/bin/nvim

# Install Golang version manager
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

gvm install go1.6 -B
gvm use go1.6

# Install Python version manager
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | zsh
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

pyenv install 3.9.7
pyenv global 3.9.7

pip install neovim
pip install django
pip install fastapi
pip install "uvicorn[standard]"

# Install Nodejs version manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | zsh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

nvm install v14.18.1
nvm use v14.18.1

nvm install --global neovim
nvm install --global ionic
nvm install --global expo-cli

# Install Sdkman
curl -s "https://get.sdkman.io" | zsh
source "$HOME/.sdkman/bin/sdkman-init.sh"

sdk install springboot
sdk install maven
sdk install gradle
sdk install java

# Install pure zsh
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

# Zsh configuration
mv .zshrc $HOME/.zshrc