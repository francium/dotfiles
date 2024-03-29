#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

BOLD="\e[1m"
RED="\e[31m"
RESET="\e[0m"
VIVID_VERSION=0.9.0

echo -e "${BOLD}${RED}=== Installing packages ===${RESET}"
sudo apt install --no-upgrade --yes \
    build-essential \
    ca-certificates \
    chromium-browser \
    cloc \
    curl \
    curl \
    fd-find \
    fzf \
    git \
    gnome-pass-search-provider \
    gnome-shell-extensions \
    gnome-tweaks \
    gnupg \
    htop \
    inotify-tools \
    iotop \
    libbz2-dev \
    libffi-dev \
    liblzma-dev \
    libncurses5-dev \
    libncursesw5-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    libterm-readkey-perl \
    lm-sensors \
    make \
    neovim \
    pass \
    pavucontrol \
    powertop \
    python-is-python3 \
    python3 \
    python3-neovim \
    python3-openssl \
    ripgrep \
    stow \
    tk-dev \
    tmux \
    wget \
    wl-clipboard \
    xz-utils \
    zlib1g-dev \

echo -e "${BOLD}${RED}\n\n=== Linking fd-find to fd ===${RESET}"
sudo ln -sf $(which fdfind) /usr/local/bin/fd

echo -e "${BOLD}${RED}\n\n=== Installing vivid ${VIVID_VERSION}===${RESET}"
if ! command -v vivid >/dev/null; then
    TMP_VIVID=$(mktemp --directory)
    wget "https://github.com/sharkdp/vivid/releases/download/v${VIVID_VERSION}/vivid_${VIVID_VERSION}_amd64.deb"
    sudo dpkg -i vivid_${VIVID_VERSION}_amd64.deb
    cd -
    rm -rf $TMP_VIVID
else
    echo -e "${BOLD}${RED}vivid is already installed${RESET}"
fi

# echo -e "\n\n=== Installing diff-so-fancy ==="
# cd /tmp
# wget https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/diff-so-fancy
# wget https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/lib/DiffHighlight.pm
# chmod +x diff-so-fancy
# sudo mv diff-so-fancy /usr/local/bin/
# sudo mkdir -p /usr/local/bin/lib/diff-so-fancy/
# sudo mv DiffHighlight.pm /usr/local/bin/lib/diff-so-fancy/

echo -e "${BOLD}${RED}\n\n=== Installing docker ===${RESET}"
# Based on https://docs.docker.com/engine/install/ubuntu/
if ! command -v docker >/dev/null; then
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg
    echo \
        "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
        "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update
    sudo apt install --yes \
        docker-ce \
        docker-ce-cli \
        containerd.io \
        docker-buildx-plugin \
        docker-compose-plugin
else
    echo -e "${BOLD}${RED}Docker is already installed${RESET}"
fi

echo -e "${BOLD}${RED}\n\n=== Installing z ===${RESET}"
if [[ ! -f /usr/share/z/z.sh ]]; then
    cd /tmp
    wget https://raw.githubusercontent.com/rupa/z/master/z.sh
    sudo mkdir -p /usr/share/z/
    sudo mv z.sh /usr/share/z/
else
    echo -e "${BOLD}${RED}z.sh is already installed${RESET}"
fi

echo -e "${BOLD}${RED}\n\n=== Installing AWS CLI ===${RESET}"
if ! command -v aws > /dev/null; then
    TMP_AWSCLI=$(mktemp --directory)
    cd $TMP_AWSCLI
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
    cd -
    rm -rf $TMP_AWSCLI
else
    echo -e "${BOLD}${RED}AWS CLI is already installed${RESET}"
fi

echo -e "${BOLD}${RED}\n\n=== Installing AWS SAM ===${RESET}"
if ! command -v sam > /dev/null; then
    TMP_AWS_SAM=$(mktemp --directory)
    cd $TMP_AWS_SAM
    curl "https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip" \
        --location \
        -o "aws-sam-cli.zip"
    unzip --quiet aws-sam-cli.zip
    sudo ./install
    cd -
    rm -rf $TMP_AWS_SAM
else
    echo -e "${BOLD}${RED}AWS SAM is already installed${RESET}"
fi
