#!/bin/bash

if ! command -v /opt/homebrew/bin/brew > /dev/null; then
    echo "Installing brew..."
    BREW_URL="https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"
    /bin/bash -c "$(curl -fsSL $BREW_URL)"
fi

if ! command -v brew > /dev/null; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' > ~/.zprofile
    echo "export HOMEBREW_NO_ANALYTICS=1" > ~/.zprofile
    source ~/.zprofile
fi

brew install \
    git \
    git-delta \
    neovim \
    pass \
    fzf \
    fd \
    stow \
    tmux \
    ripgrep \
    ranger \
    vivid
brew install --cask easy-move-plus-resize

mkdir -p ~/.gnupg
echo "pinentry-program /opt/homebrew/bin/pinentry-mac" > ~/.gnupg/gpg-agent.conf
