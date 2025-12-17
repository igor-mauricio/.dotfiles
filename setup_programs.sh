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
  nvm

git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "=== Installing GUI apps ==="

brew install --cask \
  zen \
  iterm2 \
  obs \
  karabiner-elements \
  qbittorrent \
  maccy \
  betterdisplay \
  zerotier-one \
  visual-studio-code \
  nikitabobko/tap/aerospace \
  discord \
  chatgpt \
  gimp \
  mac-mouse-fix \
  orbstack

brew tap kde-mac/kde https://invent.kde.org/packaging/homebrew-kde.git
brew install --cask kde-mac/kde/kdeconnect

# install platformio
curl -fsSL -o get-platformio.py https://raw.githubusercontent.com/platformio/platformio-core-installer/master/get-platformio.py
python3 get-platformio.py

echo "=== Installing tdf ==="
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install --git https://github.com/itsjunetime/tdf.git
