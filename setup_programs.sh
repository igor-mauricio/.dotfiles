#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "=== Installing CLI tools ==="

brew install \
  wget \
  yazi \
  zoxide \
  mpv \
  bat \
  aerc \
  isync \
  moreutils \
  tree \
  fd \
  pipx \
  ffmpeg \
  lazydocker \
  lazygit \
  fzf \
  mockery \
  gemini-cli \
  neovim \
  neofetch \
  btop \
  zsh-autosuggestions \
  zsh-syntax-highlighting \
  go \
  python3 \
  bfg \
  gh \
  tmux \
  rg \
  eza \
  7z \
  imagemagick \
  brew install superseedr \
  nvm

git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "=== Installing GUI apps ==="

brew install --cask \
  iterm2 \
  karabiner-elements \
  maccy \
  betterdisplay \
  zerotier-one \
  nikitabobko/tap/aerospace \
  discord \
  chatgpt \
  pearcleaner \
  gimp \
  mac-mouse-fix \
  orbstack

brew tap kde-mac/kde https://invent.kde.org/packaging/homebrew-kde.git
brew install --cask kde-mac/kde/kdeconnect

# install platformio
curl -fsSL -o get-platformio.py https://raw.githubusercontent.com/platformio/platformio-core-installer/master/get-platformio.py
python3 get-platformio.py

# install cleanshot x
# install pearcleaner
# install whatsapp
